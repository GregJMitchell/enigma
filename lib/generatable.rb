require 'date'

module Generatable
  def generate_date
    Time.now.strftime("%d%m%y")
  end

  def generate_key
    key = rand(10_00..99_999).to_s
    until key.length == 5
      key.insert(0, '0')
    end
    key
  end
end