# Pinboard to Instapaper to Kindle

This script is an attempt to keep articles, blog postings, tutorials, etc. organized, searchable and available on my Kindle 3 with WiFi.

## What you will need

* All bookmarks housed in [Pinboard](http://www.pinboard.in) and marked as 'toread'
* An [Instapaper](http://www.instapaper.com) account setup to work with your Kindle
* Kindle 3 with Wifi (so that your instapaper can be delivered to your @free.amazon.com address)

## Setup

Copy `config.sample.yml` to `config.yml` and add your credentials.

## The process

Mark items in Pinboard as 'toread' and once the script is run it will:

* Parse your 'toread' bookmarks and get the most recent 20
* Add them to your Instapaper and remove the 'toread' tag and add the 'instaliciousd' tag (useful for searching in the future)
* Login to Instapaper, navigate to the "Manage My Kindle" area of the "Account" page and select "Send Now"
* Your instapaper will be delivered to your Kindle
* "Bulk Archive" the Unread items on your Instapaper homepage


## Author
Copyright 2011 Kevin Old (kevin@kevinold.com)

## License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
