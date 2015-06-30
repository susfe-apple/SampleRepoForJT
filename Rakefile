#!/usr/bin/env ruby

require 'rubygems'
require 'rake'
require 'haml'

task default: :compile

task :compile do
   FileList.new('./src/*.html.haml').each do |filename|
     if filename =~ /([^\/]+)\.haml$/
       File.open($1, 'w') do |f|
         f.write Haml::Engine.new(File.read(filename)).render
       end
     end
   end
end

task :clean do
   `rm -rf *.html`
end

