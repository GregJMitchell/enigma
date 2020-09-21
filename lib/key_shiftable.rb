module KeyShiftable
  def date_shift(date)
    square_date = date.to_i**2
    date_keys = square_date.to_s[-4..-1]
    date_keys.split('')
  end

  def key_shift(key)
    keys = []
    index = 0
    4.times do
      keys << key[index..index + 1].to_i
      index += 1
    end
    keys
  end

  def final_keys(key, date)
    date_keys = date_shift(date)
    keys = key_shift(key)
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
