require_relative 'key_shiftable'

class Decryption
  include KeyShiftable
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
  end

  def decrypt
    chars = ('a'..'z').to_a << ' '
    keys = final_keys(@key, @date)
    unshifted = @message.chars.map do |letter|
      value = (letter.ord - 97 - keys[0]) % 27
      value = -1 if letter == ' '
      character = chars[value]
      keys.rotate!
      character
    end.join
    {decryption: unshifted, key: @key, date: @date}
  end
end
