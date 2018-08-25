class AuthorizationAnalyzer
  
    def initialize
      # Default error message. It will be overridden by jwt token decode errors, if any.
      @error_message = "Unauthorized Access"
    end
  
    # This method is called for each node in the AST of the query.
    # Check to see if, it's an introspection query.
    def call(memo, visit_type, irep_node)
      if !valid_auth(irep_node.query.context) && !irep_node.definition.nil?
        memo = { is_introspection_query: irep_node.definition.introspection? } if memo.nil?
        memo[:is_introspection_query] &&= irep_node.definition.introspection?
      end
      memo
    end
  
    # This method is called in the end, after parsing each node of the AST. 
    # Return a Graphql Analysis error, if it fails authentication.
    # Also, reset  @valid_auth and @error_message to nil, to again check for authentication
    # in the next query.
    def final_value(memo)
      error = GraphQL::AnalysisError.new(@error_message) if !@valid_auth && !memo[:is_introspection_query]
      reset_defaults
      error
    end
  
    private
  
    def reset_defaults
      @valid_auth = nil
      @error_message = "Unauthorized Access"
    end
  
    def valid_auth(context)
      @valid_auth = authenticate(context) if @valid_auth.nil?
      @valid_auth
    end
  
    def set_user_params(jwt_payload, context)
      context[:user_id] = jwt_payload['user_id']
    end
  
    def is_jwt_valid(jwt_payload)
      user_id = jwt_payload["user_id"]
      JwToken.find_by_user_id(user_id).present?
    end
  
    def check_jwt_validity(jwt, context)
      decode_status, decode_data = authorize_jwt!(token: jwt)
      # Set error message and return for invalid jwt
      if !decode_status
        @error_message = decode_data
        return false
      end
  
      jwt_payload, _ = decode_data
  
      # check if jti in jwt is valid
      if !is_jwt_valid(jwt_payload)   
        @error_message = "Invalid jti"
        return false
      end
  
      # Everything checks out, jwt is valid. Set user_id and account id on context.
      set_user_params(jwt_payload, context)
      return true
    end
  
    def authenticate(context)
      valid = false
  
      # We pass auth token from request into the context.
      if context[:auth_token].present?
        jwt = context[:auth_token].split(" ")[1].strip
        valid = check_jwt_validity(jwt, context)
      end
  
      valid
    end

    def authorize_jwt!(token:)
      public_key = File.open('config/secrets/hard_public.pem')
      rsa = OpenSSL::PKey::RSA.new(public_key)
      [ true, JWT.decode(token, rsa, true, algorithm: 'RS256') ]
    rescue => e
      [ false, e.message ]
    end

end