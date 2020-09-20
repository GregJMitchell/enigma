require_relative 'key_shift'

class Decryption
  include KeyShift
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def decrypt
    chars = ('a'..'z').to_a << ' '
    lower_message = @message.downcase
    keys = final_keys(@key, @date)
    unshifted = lower_message.chars.map do |letter|
      value = (letter.ord - 97 - keys[0]) % 27
      value = -1 if letter == ' '
      character = chars[value]
      keys.rotate!
      character
    end.join
    {decryption: unshifted, key: @key, date: @date}
  end
end