puts "Directory ?"
  directory = gets.chomp
puts "Serie's name ?"
  serie = gets.chomp
puts "Format: #{serie} Sxx Exx"

d = Dir.new(directory)
Dir.chdir(directory)

if d == nil
  puts "Wrong path"
else
  d.each do |file|
    old_name = File.basename(__FILE__)
    suffix = File.extname(__FILE__)
    episode = old_name.match(/[eE]\d+[\-]?\d+/).to_s.match(/\d+[\-]?\d+/).to_s
    episode = "%02d" % episode.to_i #Format the number
    season = old_name.match(/[sS]\d+/).to_s.match(/\d+/).to_s
    season = "%02d" % season.to_i #Format
    #Must cover more possibilities with regex
    File.rename(old_name, "#{serie} S#{season}E#{episode}#{suffix}")
  end
end
