require 'pry'

require_relative 'encryptor'

describe Encryptor do 

  it "checks to see if password correct" do
    @test.check?(password) = ""
  end


  before do 
    @test = Encryptor.new
    @letter = 'm'
    @string = 'hello'
    @rotation1 = 3
    @rotation2 = 17
    @rotation3 = 21
    @filename = 'file_spec_test.txt'
  end

  it "encrypts a letter" do 
    @test.encrypt_letter(@letter, @rotation1).should == 'p'
  end

  it "encrypts a string" do 
    @test.encrypt(@string, @rotation1, @rotation2, @rotation3).should == 'kv&o%'
  end

  it "decrypts a letter" do  
    @test.decrypt_letter('p', @rotation1).should == 'm'
  end

  it "decrypts a letter" do 
    @test.decrypt('kv&o%', @rotation1, @rotation2, @rotation3).should == 'hello'
  end

  it "cracks a message by attempting to figure out the rotation" do
    @test.crack(@message).should ==""
  end

  it "encrypts a file" do
    @test.encrypt_file(@filename, @rotation1, @rotation2, @rotation3)
    File.read('file_spec_test.txt.encrypted').should == "`'tn$-v%-%)rr&"
  end

  it "decrypts a file" do
    @test.decrypt_file(@filename + ".encrypted", @rotation) == "Sugar is sweet"
  end


end