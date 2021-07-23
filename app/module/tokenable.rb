module Tokenable
  def self.generate_token
  verification_token = SecureRandom.hex(4)      
  end
end