require_relative 'key_shiftable'

class Encryption
  include KeyShiftable
  attr_reader :message, :key, :date
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt
    chars = ('a'..'z').to_a << ' '
    lower_message = @message.downcase
    keys = final_keys(@key, @date)
    shifted = lower_message.chars.map do |letter|
      value = (letter.ord - 97 + keys[0]) % 27
      value = -1 if letter == ' '
      character = chars[value]
      keys.rotate!
      character
    end.join
    {encryption: shifted, key: @key, date: @date}
  end
end