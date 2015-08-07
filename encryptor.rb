class Encryptor

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

end