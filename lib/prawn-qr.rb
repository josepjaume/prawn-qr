require "prawn-qr/version"
require "prawn-qr/qrcode"
require 'prawn'

module Prawn
  module Qr
    # Public: Generates a QR code centered on the inside of the current 
    # boundaries.
    #
    # content - The text content of the QR to be generated
    #
    # Examples
    #
    #   Prawn::Document.generate "test.pdf" do
    #     qrcode "http://codegram.com"
    #   end
    def qrcode(content)
      QRCode.new(self, content).draw
    end
  end
end

Prawn::Document.extensions << Prawn::Qr
