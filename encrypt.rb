require './lib/enigma'

file_names = ARGV

enigma = Enigma.new
file = File.open(file_names[0])
file_data = file.read

encrypted_message = enigma.encrypt(file_data, file_names[2], file_names[3])
file.close

File.open(file_names[1], "w") { |f| f.write "#{encrypted_message[:encryption]}" }

p "Created '#{file_names[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
