#!/usr/bin/ruby
require 'json'

json_data = JSON.parse(File.read('../config/file_input.json').strip)
dir = json_data['dir']
key = json_data['key']

key_path = File.join(dir, key)

File.open(key_path, 'w+') do |file|
    for i in 1..1000 do 
        file.puts((1...1000).map { (33 + rand(93)).chr }.join)
    end
end