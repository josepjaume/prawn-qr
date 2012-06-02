# prawn-qr [![Build Status](https://secure.travis-ci.org/josepjaume/prawn-qr.png)](http://travis-ci.org/josepjaume/prawn-qr)

Prawn-qr is a prawn extension for creating QR Codes inside of a prawn document thanks to [rqrcode](https://github.com/whomwah/rqrcode).

## Installation

Add this line to your application's Gemfile:

    gem 'prawn-qr'

And then execute:

    $ bundle

## Usage

```Ruby
require 'prawn-qr'

Prawn::Document.generate "test.pdf" do
 qrcode "http://codegram.com"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
