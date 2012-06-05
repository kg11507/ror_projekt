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
Book.create({:title => "Zwykla Ksiazka", :author_id => 2})

Publisher.create({:name=>"MujWydafca"})
Publisher.create({:name=>"Fabryka Liter"})


Example.create({:book_id=>1, :publisher_id=>1})
Example.create({:book_id=>2, :publisher_id=>2})

User.create({:email=>"test@test.test", :admin=>true, :encrypted_password=>"$2a$10$xCwVRny0iZrTl2UscrR9m.fyzh7nF6Ll.LiR/fPisw43qOHrSrCYG", :sign_in_count=>1})

Reservation.create({:example_id=>1, :user_id=>1})