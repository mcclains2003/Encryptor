require 'pry'

require_relative 'encryptor'

describe Encryptor do 

  before do
    @password = 'Ruby on Rails'
    @test = Encryptor.new
  end

  it "checks to see if password correct" do
    @test.check?(@password).should == true
  end


  before do 
    @test = Encryptor.new
    @letter = 'm'
    @string = 'hello'
    @rotation1 = 3
    @rotation2 = 17
    @rotation3 = 21
    @filename = 'file_spec_test.txt'
    @message = "Wzg#%ts%Wfnqx"
  end

  it "encrypts a letter" do 
    @test.encrypt_letter(@letter, @rotation1).should == 'p'
  end

  it "encrypts a string" do 
    @test.encrypt_rotation(@string, @rotation1, @rotation2, @rotation3).should == 'kv&o%'
  end

  it "decrypts a letter" do  
    @test.decrypt_letter('p', @rotation1).should == 'm'
  end

  it "decrypts a string" do 
    @test.decrypt_rotation('kv&o%', @rotation1, @rotation2, @rotation3).should == 'hello'
  end

  it "cracks a message by attempting to figure out the rotation" do
    text = @test.crack(@message)
    text.include?("Ruby on Rails").should == true
  end

  it "encrypts a file" do
    @test.encrypt_file(@filename, @rotation1)
    File.read('file_spec_test.txt.encrypted').should == "Vxjdu#lv#vzhhw"
  end

  it "decrypts a file" do
    @test.decrypt_file(@filename + ".encrypted", @rotation1) == "Sugar is sweet"
  end


end