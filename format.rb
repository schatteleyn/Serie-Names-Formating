puts "Nom de la série ?"
serie = gets.chomp
puts "Nombre d'épisodes ?"
episode = gets.chomp
puts "Numéro de la saison?"
saison = gets
puts "Format:#{serie} S#{saison}E#{episode}"

i = 1
directory = Dir.pwd
d = Dir.new(directory)

d.each do |file|
  until (i <= episode)
    old_name = File.basename(__FILE__)   #get filename
    suffix = File.extname(__FILE__)     #get file extension
    File.rename(old_name, "#{serie} S#{saison}E#{i}.#{suffix}")
    i += 1
  end
end