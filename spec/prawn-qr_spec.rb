require_relative 'spec_helper'
require 'prawn-qr'
require 'mocha'
require 'prawn-qr/qrcode'

describe Prawn::Qr do
  describe "qrcode" do
    it "should be available for prawn documents" do
      Prawn::Document.new.must_respond_to :qrcode
    end

    it "must generate a qrcode" do
      document = Prawn::Document.new
      Prawn::Qr::QRCode.expects(:new).with(document, "BobRoss").returns(
        stub(draw: true)
      )
      document.qrcode("BobRoss").must_equal true
    end
  end
end
