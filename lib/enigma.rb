require_relative 'encryption'

class Enigma
  def encrypt(message, key = nil, date = nil)
    encryption = Encryption.new(message, key, date)
    encryption.encrypt
  end

  def decrypt(message, key, date)
    chars = ('a'..'z').to_a << ' '
    lower_message = message.downcase
    keys = final_keys(key, date)
    lower_message.chars.map do |letter|
      value = (letter.ord - 97 - keys[0]) % 27
      value = -1 if letter == ' '
      character = chars[value]
      keys.rotate!
      character
    end.join
  end
end
