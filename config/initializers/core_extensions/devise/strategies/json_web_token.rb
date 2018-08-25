module Devise
    module Strategies
      class JsonWebToken < Base
        def valid?
          bearer_header.present?
        end
  
        def authenticate!
          return if no_claims_or_no_claimed_user_id
  
          success! User.find_by_id claims['user_id']
        end
  
        private
  
        def bearer_header
          request.headers['Authorization']&.to_s
        end
  
        def no_claims_or_no_claimed_user_id
          !claims || !claims.has_key?('user_id')
        end
  
        def claims
            strategy, token = bearer_header.split(' ')
            return nil if (strategy || '').downcase != 'bearer'
            JwtService.verify_token(token) rescue nil
        end
      end
    end
  end
  