#!/usr/bin/env ruby
require 'json'
main = {}
Dir.glob("./cldr-json/cldr-localenames-full/main/**/languages.json").each { |file| main.merge!(JSON.parse(File.read(file))['main']) }
output = { version: main['en']['identity']['version']['_cldrVersion'], locales: {} }
main['en']['localeDisplayNames']['languages'].each do |k,v|
  name = main[k]['localeDisplayNames']['languages'][k] rescue nil
  next if name.nil?
  output[:locales][k] = { name: name, english_name: v }
end
File.write('languages.json', JSON.pretty_generate(output))
puts "#{output[:locales].count} language locales were generated for CLDR version #{output[:version]} in file 'languages.json'"
