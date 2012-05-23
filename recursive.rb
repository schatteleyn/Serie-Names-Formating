#!/usr/bin/env ruby
$LOAD_PATH << File.dirname(__FILE__)
require 'format.rb'
require 'find'

Find.find('./') do |f|
  if Dir.exist?(f) == false
    path = Dir.pwd
    format(path)
    f.prune
  end
end
