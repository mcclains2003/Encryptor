class Encryptor

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotatated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotatated_characters)]
  end

    def encrypt(string)
    letters = string.split("")

    results = letters.collect do |letter|
      encrypted_letter = encrypt_letter(letter)
    end

    results.join
  end

  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

end