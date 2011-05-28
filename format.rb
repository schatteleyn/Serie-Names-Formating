puts "Serie's name ?"
serie = gets.chomp
puts "Episode's number ?"
episode = gets.chomp
puts "Season's number?"
season = gets
puts "Format:#{serie} S#{season}E#{episode}"

i = 1
directory = Dir.pwd
d = Dir.new(directory)

if d == nil
	puts "Wrong path"
else
	d.each do |file|
	  until (i <= episode)
	    old_name = File.basename(__FILE__)   #get filename
	    suffix = File.extname(__FILE__)     #get file extension
      if i < 10
        File.rename(old_name, "#{serie} S#{season}E0#{i}.#{suffix}")
        i += 1
      else
        File.rename(old_name, "#{serie} S#{season}E#{i}.#{suffix}")
        i += 1
      end
	  end
	end
end