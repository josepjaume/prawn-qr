require 'rqrcode'

module Prawn
  module Qr
    class QRCode
      attr_accessor :document, :content

      def initialize(document, content)
        @document = document
        @content = content
      end

      def qrcode
        return @qrcode if @qrcode
        size = 1
        while(!@qrcode)
          begin
            @qrcode = RQRCode::QRCode.new(content, size: size)
          rescue RQRCode::QRCodeRunTimeError
            size += 1
          end
        end
        @qrcode = @qrcode.modules
      end

      def draw
        document.fill_color 'ffffff'
        document.rectangle(
          [horizontal_offset, vertical_offset + table_size],
          table_size, table_size
        )
        document.fill

        qrcode.reverse.each_with_index do |row, y|
          y += 1
          row.each_with_index do |dark, x|
            if dark
              document.fill_color = '000000'
              document.rectangle(
                [x * cell_size + horizontal_offset, y * cell_size + vertical_offset],
                cell_size, cell_size
              )
              document.fill
            end
          end
        end
      end

      private

      def cell_size
        @cell_size ||= [cell_height, cell_width].min
      end

      def cell_height
        return @cell_height if @cell_height
        height = qrcode.length
        @cell_height = document.bounds.height.to_f / height.to_f
      end

      def table_size
        cell_size * qrcode.length
      end

      def cell_width
        return @cell_width if @cell_width
        width = qrcode.first.length
        @cell_width = document.bounds.width.to_f / width.to_f
      end

      def vertical_offset
        @vertical_offset ||= (
          document.bounds.height - qrcode.length * cell_size
        ).to_f / 2
      end

      def horizontal_offset
        @horizontal_offset ||= (
          document.bounds.width - qrcode.length * cell_size
        ).to_f / 2
      end
    end
  end
end
