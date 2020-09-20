require 'date'

module Generatable
  def generate_date
    date = DateTime.now
    year = date.year.to_s[-2..-1]
    day = date.day
    month = date.month
    day = "0#{day}" if day.to_s.length < 2
    month = "0#{month}" if month.to_s.length < 2
    "#{day}#{month}#{year}"
  end

  def generate_key
    rand.to_s[0..4]
  end
end