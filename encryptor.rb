class Encryptor

  # def initialize
  #   @message = message
  #   @rotation = rotation
  # end

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotatated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotatated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def decrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation * -1)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split("")

    results = letters.collect do |letter|
      encrypted_letter = encrypt_letter(letter, rotation)
    end.join
    
  end

  def decrypt(string, rotation)
    letters = string.split("")

    results = letters.collect do |letter|
      decrypted_letter = decrypt_letter(letter, rotation)
    end.join
  end

  def encrypt_file(filename, rotation)
    file = File.open(filename, "r")
    text = file.read
    encrypted_text = encrypt(text, rotation)
    output_file = File.open(filename + ".encrypted", "w")
    output_file.write(encrypted_text)
    output_file.close
  end

  def decrypt_file(filename, rotation)
    file = File.open(filename, "r")
    text = file.read
    decrypted_text = decrypt(text, rotation)
    output_filename = filename.gsub("encrypted", "decrypted")
    output_file = File.open(output_filename, "w")
    output_file.write(decrypted_text)
    output_file.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end
  end

end

  puts "Would you like to encrypt or decrypt a message?"
  choice = $stdin.gets.chomp

  case choice
  when "encrypt"

    puts "Please type a message you would like encrypted:"
    ins_message = $stdin.gets.chomp.to_s

    puts "Please enter the encryption rotation:"
    rotation = $stdin.gets.chomp.to_i

    e = Encryptor.new

    puts e.encrypt(ins_message, rotation)

  when "decrypt"
    puts "Please type a message you would like decrypted:"
    ins_message = $stdin.gets.chomp.to_s

    puts "Please enter the decryption rotation:"
    rotation = $stdin.gets.chomp.to_i

    e = Encryptor.new

    puts e.decrypt(ins_message, rotation)
  else
    puts "That is not an option"
    exit(0)
  end