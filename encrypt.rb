require './lib/enigma'

file_names = ARGV

enigma = Enigma.new
file = File.open(file_names[0])
file_data = file.read

encrypted_message = enigma.encrypt(plaintext_message, key, date)
file.close

File.write(file_names[1], encrypted_message[:encyrption])