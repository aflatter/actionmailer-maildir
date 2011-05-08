require 'rubygems'
require 'bundler/setup'

require 'action_mailer'
require 'actionmailer-maildir'

require 'fakefs'

TEMPORARY = '/tmp/Maildir'


ActionMailer::Base.delivery_method = :maildir

class TestMailer < ActionMailer::Base
  default :from => "sender@example.com"
 
  def hello
    opts = {:to => "recipient@example.com", :subject => "Hello World"}
    mail opts do |format|
      format.text { 'Hello World' }
    end
  end

end

describe ActionMailer::Base do
  it "has maildir_settings" do
    ActionMailer::Base.should respond_to(:maildir_settings=)
  end
end

describe TestMailer do
  it "raises error if path is not set" do
    ActionMailer::Base.maildir_settings = {}
    lambda { TestMailer.hello.deliver! }.should raise_error
  end

  it "delivers!" do
    ActionMailer::Base.maildir_settings = {:path => TEMPORARY}
    TestMailer.hello.deliver!

    maildir = ::Maildir.new(TEMPORARY)
    maildir.list(:new).length.should == 1
  end
end
