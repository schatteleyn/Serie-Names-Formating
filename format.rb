#!/usr/bin/env ruby

puts "Directory ?"
  directory = gets.chomp
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
        season =
        episode =
      else
        episode = old_name.match(/[eE]\d+[\-eE]?\d+/).to_s.match(/\d+[\-eE]?\d+/).to_s
        episode = "%02d" % episode.to_i #Format the number
        season = old_name.match(/[sS]\d+/).to_s.match(/\d+/).to_s
        season = "%02d" % season.to_i #Format
        #Must cover more possibilities with regex
      end
      File.rename(old_name, "#{serie} S#{season}E#{episode}#{suffix}")
      puts "#{old_name}.#{suffix} is now named:"
      puts "    #{serie} S#{season}E#{episode}#{suffix}"
    end
  end
else
  puts "Wrong path"
end
