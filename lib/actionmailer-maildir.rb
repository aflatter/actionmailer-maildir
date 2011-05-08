require 'maildir'
require 'maildir/serializer/mail'

module ActionMailer

  module DeliveryMethods

    class Maildir
      attr_accessor :path
      attr_accessor :settings

      def initialize(settings = {})
        self.settings = settings
        @maildir = ::Maildir.new(settings[:path])
        @maildir.serializer = ::Maildir::Serializer::Mail.new
      end

      def deliver!(mail)
        @maildir.add(mail) # writes an RFC2822 message to disk
      end

    end

  end

end

ActionMailer::Base.class_eval do
  cattr_accessor :maildir_settings
  self.maildir_settings = {}
  add_delivery_method :maildir, ActionMailer::DeliveryMethods::Maildir, {}
end
