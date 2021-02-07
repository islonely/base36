# Implementation Base36 encoding/decoding
Implementation of Base36 encoding and decoding in V.

Base algorithm is adapted from [mr-tron/base58](https://github.com/mr-tron/base58)

## Installation
V must first be installed on your machine. You can get that from [vlang/v](https://github.com/vlang/v). After installing V execute this command to install this module to your system. And that's it!

VPM:
```bash
$ v install islonely.base36
```
VPKG:
```bash
$ vpkg get base36
```
Manual install:
```bash
$ mkdir modules
$ cd modules
$ git clone https://github.com/islonely/base36
```
## Usage
The default base36 alphabet is 0123456789ADBCDEFGHIJLKMNOPQRSTUVWXYZ.
```v
import base36   // if you installed with VPM
                // then you will need to use 'import islonely.base36'

fn main() {
    input_string := 'placeholder'
    encoded := base36.encode(input_string)?
    decoded := base36.decode(encoded)?
                                        // Output
	println('Input:\t\t$input_string')  // placeholder
	println('Encoded:\t$encoded')       // H2S101J0K6UJRYXKI
	println('Decoded:\t$decoded')       // placeholder
}
```

For use with custom alphabets:
```v
import base36

fn main() {
    custom_alphabet := base36.new_alphabet('!@#$%^&*()_-+=~`\\";:/?.>,<[]{}abcdef')

    input_string := 'placeholder'
    encoded := base36.encode_walpha(input_string, custom_alphabet)?
    decoded := base36.decode_walpha(encoded, custom_alphabet)?
                                        // Output
    println('Input:\t\t$input_string')  // placeholder
    println('Encoded:\t$encoded')       // "#{@!@:!/&a:]ed/;
    println('Decoded:\t$decoded')       // placeholder
}
```

### Donations
Pls, I'm broke lol

[![.NET Conf - November 10-12, 2020](https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png)](https://www.buymeacoffee.com/islonely)