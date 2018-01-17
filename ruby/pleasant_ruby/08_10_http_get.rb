# coding: utf-8

require "net/http"
require "uri"

url  = URI.parse("http://www.ruby-lang.org/ja/")
http = Net::HTTP.start(url.host, url.port)
doc  = http.get(url.path)

p url.scheme #=> http
p url.host   #=> www.ruby-lang.org
p url.port   #=> 80
p url.path   #=> /ja/
p url.to_s   #=> http://www.ruby-lang.org/ja/

puts "HTML document---------------------"
puts doc.body
