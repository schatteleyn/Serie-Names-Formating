#!/usr/bin/env ruby

if ARGV.size == 2
	directory = ARGV[0]
	serie = ARGV[1]
elsif ARGV.size == 0
	puts "Directory ?"
	  directory = gets.chomp
	puts "Serie's name ?"
	  serie = gets.chomp
else
	abort "Number of parameters is incorrect. Please specify path and serie name"
end
	puts "Format: #{serie} Sxx Exx in #{directory}"

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
			if episode == "00"
				next
			end
			File.rename(old_name, "#{serie} S#{season}E#{episode}#{suffix}")
			puts "#{old_name} is now named:"
			puts "#{serie} S#{season}E#{episode}#{suffix}"
		end
	end
else
	puts "Wrong path"
end
