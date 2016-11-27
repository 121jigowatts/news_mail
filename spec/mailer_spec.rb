require 'spec_helper'

describe Mailer do
  describe "#send" do
    it "sendメソッドが呼ばれること" do
      gmail_mock = double('GMail')
      allow(gmail_mock).to receive(:send)

      mailer = Mailer.new(gmail_mock)
      expect(mailer).to receive(:send)

      mailer.send(nil)
    end
  end
end