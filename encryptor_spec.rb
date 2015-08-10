require_relative 'encryptor'

describe Encryptor do 

  before do 
    @test = Encryptor.new
    @letter = 'm'
    @string = 'hello'
    @rotation = 13
    @filename = 'file_spec_test.txt'
  end

  it "encrypts a letter" do 
    @test.encrypt_letter(@letter, @rotation).should == 'z'
  end

  it "encrypts a string" do 
    @test.encrypt(@string, @rotation).should == 'uryy!'
  end

  it "decrypts a letter" do  
    @test.decrypt_letter('z', @rotation).should == 'm'
  end

  it "decrypts a letter" do 
    @test.decrypt('uryy!', @rotation).should == 'hello'
  end

  it "cracks a message by attempting to figure out the rotation" do
    @test.crack(@message).should ==""
  end

  it "encrypts a file" do
    @test.encrypt_file(@filename, @rotation)
    text = File.open('file_spec_test.txt.encrypted', 'r')
    text.read.should == "`'tn$-v%-%)rr&"
  end

  it "decrypts a file" do
    @test.decrypt_file(@filename + ".encrypted", @rotation) == "Sugar is sweet"
  end


end