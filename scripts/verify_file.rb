#!/usr/bin/ruby
require 'time'
require 'json'

json_data = JSON.parse(File.read('file_input.json').strip)
scored_file = json_data['scored_file']

file_time = File.mtime(scored_file)
now_time = Time.now

minute_diff = (now_time - file_time).to_i / 60 

if minute_diff > 5 then
    File.delete(scored_file)
end