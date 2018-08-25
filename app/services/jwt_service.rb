class JwtService
      
    def initialize(user: nil, token: nil)
        @user = user.present? ? user : nil
        @token = token if token.present?
    end

    def build!
        JwToken.create(user: @user, jti: encoded_key)
    end

    def encoded_key
        payload = {user_id: @user.id}
        JWT.encode payload, AUTH_PRIVATE_KEY, 'RS256'
    end

    def self.verify_token(token)
        jwt_service = JwtService.new(token: token)
        begin
            jwt_record = JwToken.find(jti: token)
            if jwt_record.present?
                jwt_service.decode
            else
                nil
            end
        rescue
            nil
        end
    end
    
    private
    def validate_token
        JWT.decode @token, AUTH_PUBLIC_KEY, 'RS256'
    end

    def decode
        validate_token.first
    end

end
