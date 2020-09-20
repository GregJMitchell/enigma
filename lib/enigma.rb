require_relative 'encryption'
require_relative 'Decryption'
require_relative 'generatable'

class Enigma
  include Generatable
  def encrypt(message, key = nil, date = nil)
    date = generate_date if date.nil?
    key = generate_key if key.nil?
    encryption = Encryption.new(message, key, date)
    encryption.encrypt
  end

  def decrypt(message, key, date = nil)
    date = generate_date if date.nil?
    decryption = Decryption.new(message, key, date)
    decryption.decrypt
  end
end
