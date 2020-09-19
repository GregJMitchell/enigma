require './lib/enigma'

file_names = ARGV

enigma = Enigma.new
file = File.open(file_names[0])
file_data = file.read
key = "02715" 
date = "040895"

encrypted_message = enigma.encrypt(file_data, key, date)
file.close

File.open(file_names[1], "w") { |f| f.write "#{encrypted_message[:encryption]}" }
