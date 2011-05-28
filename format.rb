puts "Directory ?"
directory = gets.chomp
puts "Serie's name ?"
serie = gets.chomp
puts "Total episode's number ?"
episode = gets.chomp
puts "Season's number?"
season = gets.chomp
puts "Format: #{serie} S#{season}E#{episode}"

i = 1
d = Dir.new(directory)
Dir.chdir(directory)

if d == nil
	puts "Wrong path"
else
	d.each do |file|
	  until (i <= episode)
	    old_name = File.basename(__FILE__)   #get filename
	    suffix = File.extname(__FILE__)      #get file extension
        if i < 10 and season < 10			 #manage format with season et episode's number
          File.rename(old_name, "#{serie} S0#{season}E0#{i}.#{suffix}")
          i += 1
        elsif i < 10 and season > 10
          File.rename(old_name, "#{serie} S#{season}E0#{i}.#{suffix}")
          i += 1
        elsif i > 10 and season < 10
          File.rename(old_name, "#{serie} S0#{season}E#{i}.#{suffix}")
          i += 1
        else
          File.rename(old_name, "#{serie} S#{season}E#{i}.#{suffix}")
          i += 1
        end
    end
  end
end