#!/usr/bin/env ruby
require 'getoptlong'
require 'webrick'

port = 8000
document_root = Dir::pwd 
opts = GetoptLong.new(['--port', '-p', GetoptLong::REQUIRED_ARGUMENT])

opts.each do |opt, arg|
  case opt
    when '--port'
      port = arg
  end
end

warn "USAGE: #{$0} [--port=n] [dir]" if ARGV.length > 2

document_root = ARGV.first unless ARGV.empty?
abort "#{$0}: #{document_root} does not exist" unless File.directory? document_root

server = WEBrick::HTTPServer.new :Port => port, :DocumentRoot => document_root

trap 'INT' do server.shutdown end

server.start

