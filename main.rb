require_relative 'encryptor'

puts "\nWould you like to encrypt/decrypt"
puts "1. A file"
puts "2. A typed message"
print "Enter a number: "
choice_file_or_message = $stdin.gets.chomp

case choice_file_or_message
  when "1" #Encrypt or Decrypt a File

    puts "\nWould you like to:"
    puts "1. encrypt a file" 
    puts "2. decrypt a file"
    print "Enter a number: "
    choice_file_en_or_de = $stdin.gets.chomp

    case choice_file_en_or_de
    when "1"
      print "Please enter the filename, including the filetype (ex filename.txt): "
      filename = $stdin.gets.chomp

      print "Please enter the encryption rotation: "
      rotation = $stdin.gets.chomp.to_i

      e = Encryptor.new

      e.encrypt_file(filename, rotation)

      puts "\nYour file has been encrypted,"
      puts "please find your encrypted file"
      puts "with the same name followed by"
      puts ".encrypted in the same location"

    when "2"
      print "Please enter the filename, including the filetype (ex filename.txt.encrypted): "
      filename = $stdin.gets.chomp

      print "Please enter the decryption rotation: "
      rotation = $stdin.gets.chomp.to_i

      e = Encryptor.new

      e.decrypt_file(filename, rotation)

      puts "\nYour file has been decrypted,"
      puts "please find your decrypted file"
      puts "with the same name followed by"
      puts ".decrypted in the same location"

    else
      exit(0)
    end

  when "2"

    puts "\nWould you like to"
    puts "1. encrypt a message?"
    puts "2. decrypt a message?"
    print "Enter a number: "
    choice_message_en_or_de = $stdin.gets.chomp

    case choice_message_en_or_de
    when "1"

      puts "\nPlease type a message you would like encrypted:"
      ins_message = $stdin.gets.chomp.to_s

      puts "\nPlease enter the encryption rotation:"
      rotation = $stdin.gets.chomp.to_i

      e = Encryptor.new

      puts e.encrypt(ins_message, rotation)

    when "2"
      puts "\nPlease type a message you would like decrypted:"
      ins_message = $stdin.gets.chomp.to_s

      puts "\nPlease enter the decryption rotation:"
      rotation = $stdin.gets.chomp.to_i

      e = Encryptor.new

      puts e.decrypt(ins_message, rotation)

    else
      puts "That is not an option"
      exit(0)
    end

  end