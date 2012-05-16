puts "Directory ?"
  directory = gets.chomp
puts "Serie's name ?"
  serie = gets.chomp
puts "Format: #{serie} Sxx Exx"

if Dir.exist?(directory)
  Dir.chdir(directory)
  files = Dir.entries(Dir.pwd)
  files.each do |file|
    old_name = File.basename(file)
    suffix = File.extname(file)
    episode = old_name.match(/[eE]\d+[\-]?\d+/).to_s.match(/\d+[\-]?\d+/).to_s
    episode = "%02d" % episode.to_i #Format the number
    season = old_name.match(/[sS]\d+/).to_s.match(/\d+/).to_s
    season = "%02d" % season.to_i #Format
    #Must cover more possibilities with regex
    puts File.rename(old_name, "#{serie} S#{season}E#{episode}#{suffix}")
  end
else
  puts "Wrong path"
end
