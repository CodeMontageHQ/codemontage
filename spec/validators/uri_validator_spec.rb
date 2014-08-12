require 'spec_helper'
 
describe UriValidator do
  subject do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :url
      validates :url, uri: true
    end.new
  end
 
  it "should be valid for a valid http url" do
    subject.url = 'http://www.google.com'
    subject.valid?
    subject.errors.full_messages.should == []
  end
 
  ['http://google', 'http://.com', 'http://ftp://ftp.google.com','http://ssh://google.com'].each do |invalid_url|
    it "#{invalid_url.inspect} is a invalid http url" do
      subject.url = invalid_url
      subject.valid?
      subject.errors.full_messages.should == []
    end
  end
 
  ['http:/www.google.com','<>hi'].each do |invalid_url|
    it "#{invalid_url.inspect} is an invalid url" do
      subject.url = invalid_url
      subject.valid?
      subject.errors.should have_key(:url)
      subject.errors[:url].should include("is an invalid URL")
    end
  end
 
  ['www.google.com','google.com'].each do |invalid_url|
    it "#{invalid_url.inspect} is an invalid url" do
      subject.url = invalid_url
      subject.valid?
      subject.errors.should have_key(:url)
      subject.errors[:url].should include("is an invalid URL")
    end
  end
 
  ['ftp://ftp.google.com','ssh://google.com'].each do |invalid_url|
    it "#{invalid_url.inspect} is an invalid url" do
      subject.url = invalid_url
      subject.valid?
      subject.errors.should have_key(:url)
      subject.errors[:url].should include("must begin with http or https")
    end
  end
end