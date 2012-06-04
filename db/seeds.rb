# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Author.create({ :name => 'Jan', :surname => 'Kowalski', :description => 'Opis Jana Kowalskiego'})
Author.create({ :name => 'Adam', :surname => 'Worth', :description => 'Opis Adama Worth\'a'})

Book.create({:title => "Book of Shadows", :author_id => 1})
Book.create({:title => "Zwykla Ksiazka", :author_id => 1})

Publisher.create({:id=>1, :name=>"MujWydafca"})
#Publisher.create({:name=>"Fabryka Liter"})

#Example.create({:book_id=>1, :user_id=>1})