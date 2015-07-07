#!/usr/bin/env ruby

require 'net/http'
require 'test/unit'

class JenkinsSampleTest  < Test::Unit::TestCase
   def setup
      @webpage = Net::HTTP.get('54.211.98.37', '/index.html')
   end

   def test_congratulations
      assert(@webpage =~ /Congratulationsqwewqewqewq!/)
   end
end
