AUTH_PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read('config/secrets/hard_private.pem'))
AUTH_PUBLIC_KEY = OpenSSL::PKey::RSA.new(File.read('config/secrets/hard_public.pem'))
