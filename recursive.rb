#!/usr/bin/env ruby

require 'find'

Find.find('./') do |f|
  if !Dir.exist?(f) && f[2] != "." # don't stop on .DS_Store
    path = Dir.pwd + f[1..-1] # get full path, removing the "."
    format(path)
  end
end

def format(directory)
  puts directory
  puts "Serie's name ?"
    serie = gets.chomp
  puts "Format: #{serie} Sxx Exx"

  if Dir.exist?(directory)
    Dir.chdir(directory)
    files = Dir.entries(Dir.pwd) # list all the files
    files.each do |file|
      if /^[.]+.*/.match(file) # Avoid ".", "..", ".DS_Store" and every hidden files
        next
      else
        old_name = File.basename(file)
        suffix = File.extname(file)
        if old_name.match(/\d+[x]\d+/)
          w = old_name.match(/\d+[x]\d+/).to_s
          season = w.match(/^\d{1,2}/).to_s
          episode = w.match(/\d{1,2}$/).to_s
        else
          episode = old_name.match(/[eE]\d+[\-eE]?\d+/).to_s.match(/\d+[\-eE]?\d+/).to_s
          season = old_name.match(/[sS]\d+/).to_s.match(/\d+/).to_s
        end
        episode = "%02d" % episode.to_i #Format
        season = "%02d" % season.to_i #Format
        File.rename(old_name, "#{serie} S#{season}E#{episode}#{suffix}")
        puts "#{old_name} is now named:"
        puts "    #{serie} S#{season}E#{episode}#{suffix}"
      end
    end
  else
    puts "Wrong path"
  end
end
