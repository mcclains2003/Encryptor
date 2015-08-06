require_relative 'encryptor'

describe Encryptor do 

  before do 
    @test = Encryptor.new
    @letter = 'm'
    @string = 'hello'
    @rotation = 13
  end

  it "encrypts a letter" do 
    @test.encrypt_letter(@letter, @rotation).should == 'z'
  end

  it "encrypts a string" do 
    @test.encrypt(@string, @rotation).should == 'uryy!'
  end

  it "decrypts a letter" do  
    @test.decrypt_letter('z').should == 'm'
  end

  it "decrypts a letter" do 
    @test.decrypt_string('uryy!').should == 'hello'
  end

end