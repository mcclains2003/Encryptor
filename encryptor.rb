require 'digest/md5'

class Encryptor

  # def initialize
  #   @message = message
  #   @rotation = rotation
  # end

  def check?(password)
    Digest::MD5.hexdigest(password) == 'd41a9e3915fd905f6427a8e3770546cf'
  end

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

  def encrypt_rotation(string, x, y, z)
    letters = string.split("")
    a = [x, y, z]
    b = []
    
    results = letters.collect do |letter|
      a.cycle(string.size / 2) do |x| 
        b.push(x)
      end
      encrypted_letter = encrypt_letter(letter, b.shift)
    end.join
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

  def decrypt_rotation(string, x, y, z)
    letters = string.split("")
    a = [x, y, z]
    b = []

    results = letters.collect do |letter|
      a.cycle(string.size / 2) do |x| 
        b.push(x)
      end
      decrypted_letter = decrypt_letter(letter, b.shift)
    end.join
  end

  def encrypt_file(filename, rotation)
    file = File.open(filename, "r")
    string = file.read
    encrypted_text = encrypt(string, rotation)
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
    cracked = supported_characters.count.times.collect do |attempt|
      decrypt(message, attempt)
    end.join
  end

end