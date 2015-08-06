require_relative 'encryptor'

describe Encryptor do 

  before do 
    @test = Encryptor.new
    @letter = 'm'
    @string = 'hello'

  it "encrypts a letter"
    @test.encrypt_letter(@letter).should == "z"
  end

  it "encrypts a string"
    @test.encrypt_string(@string).should == 'uryyb'
  end

  it "decrypts a letter"
    @test.decrypt_letter('z').should == 'm'
  end

  it "decrypts a letter"
    @test.decrypt_string('uryyb').should == 'hello'
  end

end