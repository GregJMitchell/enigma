require_relative 'encryption'

class Enigma
  def encrypt(message, key = nil, date = nil)
    encryption = Encryption.new(message, key, date)
    encryption.encrypt
  end

  def decrypt(message, key, date)
    decryption = Decryption.new(message, key, date)
    decryption.decrypt
  end
end
