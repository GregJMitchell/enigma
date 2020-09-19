require_relative 'key_shift'

class Enigma
  include KeyShift
  def encrypt(message, key, date)
    chars = ('a'..'z').to_a << ' '
    lower_message = message.downcase
    keys = final_keys(key, date)
    shifted = lower_message.chars.map do |letter|
      value = (letter.ord - 97 + keys[0]) % 27
      value = -1 if letter == ' '
      character = chars[value]
      keys.rotate!
      character
    end.join
    encrypted = {}
    encrypted[:encryption] = shifted
    encrypted[:key] = key
    encrypted[:date] = date
    encrypted
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
