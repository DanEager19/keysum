#!/usr/bin/ruby
require 'digest'
require 'json'

json_data = JSON.parse(File.read('./config/file_input.json').strip)
dir = json_data['dir']
key = json_data['key']
checks = json_data['checks']
scored_file = json_data['scored_file']

key_path = File.join(dir, key)
check_paths = Dir[File.join(dir, checks)]

checksum = true

check_paths.each do |check|
    key_hash = Digest::MD5.file(key_path).hexdigest
    check_hash = Digest::MD5.file(check).hexdigest
    checksum = (checksum and (key_hash == check_hash))
end

r = /(Yes|No)/
checksum ? checksum_output = 'Yes': checksum_output = 'No'

File.write(scored_file, File.read(scored_file).sub(r, checksum_output))

File.open('./config/counter.txt', 'r+') do |file|
    num = file.gets.to_i
    file.rewind
    file.puts(num.next)
end

File.delete(key_path)
check_paths.each do |check|
    File.delete(check)
end