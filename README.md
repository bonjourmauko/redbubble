# Redbubble

[![Gem Version](https://badge.fury.io/rb/github_cli.svg)](http://badge.fury.io/rb/github_cli)
[![Build Status](https://travis-ci.org/maukoquiroga/redbubble.svg?branch=master)](https://travis-ci.org/maukoquiroga/redbubble)
[![Dependency Status](https://gemnasium.com/maukoquiroga/redbubble.svg)](https://gemnasium.com/maukoquiroga/redbubble)
[![Coverage Status](https://coveralls.io/repos/maukoquiroga/redbubble/badge.svg)](https://coveralls.io/r/maukoquiroga/redbubble)
[![Code Climate](https://codeclimate.com/github/maukoquiroga/redbubble/badges/gpa.svg)](https://codeclimate.com/github/maukoquiroga/redbubble)

Redbubble is a Ruby CLI to generate browsable html files from Redbubble's **works** XML files.

![Interface](https://github.com/maukoquiroga/redbubble/raw/master/screenshots/index.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redbubble'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redbubble


## Usage

Run:

    $ redbubble -f input.xml -o output

Both arguments are required. You can get a copy of `works.xml` from Redbubble™. As for `output`, it should be a path and not a file, as multiple HTML files are created in batch.

![Usage](https://github.com/maukoquiroga/redbubble/raw/master/screenshots/terminal.png)


## Contributing

1. Fork it ( https://github.com/[my-github-username]/redbubble/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2015 Mauko Quiroga

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
