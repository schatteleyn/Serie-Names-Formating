puts "Directory ?"
  directory = gets.chomp
puts "Serie's name ?"
  serie = gets.chomp
puts "Total episode's number ?"
  episode = gets.chomp
puts "Season's number?"
  season = gets.chomp
puts "Format: #{serie} S#{season}E#{episode}"

d = Dir.new(directory)
Dir.chdir(directory)

if d == nil
	puts "Wrong path"
else
	d.each do |file|
	  for episode in (1..episode.to_i)
	 	episode = "%02d" % episode
	 	season = "%02d" % season
	    old_name = File.basename(__FILE__)   #get filename
	    suffix = File.extname(__FILE__)      #get file extension
      #manage format with season et episode's number
      File.rename(old_name, "#{serie} S#{season}E#{episode}.#{suffix}")
    end
  end
end