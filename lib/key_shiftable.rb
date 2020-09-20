module KeyShiftable
  def date_shift(date)
    square_date = date.to_i**2
    date_keys = square_date.to_s[-4..-1]
    date_keys.split('')
  end

  def key_shift(key)
    keys = []
    keys << a_key = key[0..1].to_i
    keys << b_key = key[1..2].to_i
    keys << c_key = key[2..3].to_i
    keys << d_key = key[3..4].to_i
    keys
  end

  def final_keys(key, date)
    date_keys = date_shift(date)
    keys = key_shift(key)
    # require 'pry'; binding.pry
    real_keys = []
    index = 0
    4.times do
      key_total = date_keys[index].to_i + keys[index]
      real_keys << key_total
      index += 1
    end
    real_keys
  end
end
