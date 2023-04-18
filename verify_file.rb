#!/usr/bin/ruby
require 'time'

while true
    file_time = File.mtime('./config/counter.txt')
    now_time = Time.now

    minute_diff = (now_time - file_time).to_i / 60 

    if minute_diff > 15 then
        File.delete(scored_file)
    end
    
    sleep(300)
end