#!/usr/bin/env ruby
$LOAD_PATH << File.dirname(__FILE__)
require 'format.rb'

dir.each do |file|
  if File.exist?(file) # Si true, le fichier est un répertoire
    # Ouvrir le répertoire, recommencer
   else
     # affichage du chemin, demander nom série, lancer le script
  end
end
