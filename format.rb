puts "Nombre d'épisodes ?"
episode = gets.chomp
puts "Numéro de la saison?"
saison = gets
puts "Il y a #{episode} épisodes dans la saison #{saison}"

i = 1
directory = Dir.pwd
d = Dir.new(directory)
d.each do |file|
  until (i <= episode)
    old_name = File.basename(__FILE__)   #get filename
    suffix = File.extname(file_name)     #get file extension
    File.rename(old_name, "S#{saison}E#{i}.#{suffix}")
    i += 1
  end
end