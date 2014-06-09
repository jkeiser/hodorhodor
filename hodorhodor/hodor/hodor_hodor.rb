$:.unshift(File.expand_path('../../../hodor', __FILE__))

require 'hodor'

describe ::Hodor do
  it 'Hodor hodor hodor HODOR! Hodor hodor hodor.' do
    Hodor.hodor('hodor').split(/\s/).should == ["hOdOR", "hODor", "HoDOR,", "hoDor,", "HOdOR", "HODoR...", "hodOr!", "HODOR."]
  end

  it 'Hodor hodor hodor hodor.' do
    Hodor.hodorhodor('hodor hodor hodor hodor').should == "\0\0\0"
  end

  it 'Hodor hodor hodor, hodor hodor hodor.' do
    Hodor.hodorhodor(Hodor.hodor('hodor hodor hodor HOOOOOODOOOOOOR hodor')).should == 'hodor hodor hodor HOOOOOODOOOOOOR hodor'
  end

  it 'Hodor hodor hodor, hodor hodor hodor hodor HODOR.' do
    Hodor.hodorhodor(Hodor.hodor("hodor hodor hodor\0HOOOOOODOOOOOOR\nhodor")).should == "hodor hodor hodor\0HOOOOOODOOOOOOR\nhodor"
  end
end
