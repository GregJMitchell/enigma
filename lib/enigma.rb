class Enigma
  def encrypt(message, key, date)
    chars = ("a".."z").to_a << " "
    lower_message = message.downcase
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i
    square_date = (date.to_i)**2
    date_key = square_date.to_s[-4..-1]
    a_key += date_key[0].to_i
    b_key += date_key[1].to_i
    c_key += date_key[2].to_i
    d_key += date_key[3].to_i
    keys = []
    keys << a_key
    keys << b_key
    keys << c_key
    keys << d_key

    shifted = lower_message.chars.map do |letter|
      value = (letter.ord - 97 + keys[0]) % 27
      if letter == ' '
        value = -1
      end

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
    
  end
end