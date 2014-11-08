# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

themes = Theme.create([
  {title: "Maison", description: "Tout ce qu'il faut savoir sur sa maison" , color: "#440e3f", icon: File.new(Rails.root + "db/files/maison.png")},
  {title: "Santé / Beauté", description: "Tout ce qu'il faut savoir pour sa santé et son bien être", color: "#8d9b00", icon: File.new(Rails.root + "db/files/sante.png")},
  {title: "Famille", description: "Tout ce qu'il faut savoir pour sa famille", color: "#b2254f", icon: File.new(Rails.root + "db/files/famille.png")},
  {title: "Profession", description: "Tout ce qu'il faut savoir pour le travail" , color: "#edc600", icon: File.new(Rails.root + "db/files/profession.png")},
  {title: "Loisirs", description: "Tout ce qu'il faut savoir pour ses loisirs" , color: "#df8200", icon: File.new(Rails.root + "db/files/loisirs.png")},
  {title: "Informatique", description: "Tout ce qu'il faut savoir sur son ordinateur", color: "#388adc", icon: File.new(Rails.root + "db/files/informatique.png")}
])