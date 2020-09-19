require './lib/enigma'

file_names = ARGV

require 'pry'; binding.pry
enigma = Enigma.new


enigma.encrypt(plaintext_message, key, date)