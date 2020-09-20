require './lib/enigma'

file_names_key_date = ARGV

enigma = Enigma.new
file = File.open(file_names_key_date[0])
file_data = file.read

unless file_names_key_date[3].nil?
  decrypted_message = enigma.decrypt(file_data, file_names_key_date[2], file_names_key_date[3])
  file.close

  File.open(file_names_key_date[1], "w") { |f| f.write "#{decrypted_message[:decryption]}" }
  p "Created '#{file_names_key_date[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
end

if file_names_key_date[3].nil?
  decrypted_message = enigma.decrypt(file_data, file_names_key_date[2])
  file.close

  File.open(file_names_key_date[1], "w") { |f| f.write "#{decrypted_message[:decryption]}" }

  p "Created '#{file_names_key_date[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
end
