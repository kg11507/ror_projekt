# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Author.create({ :name => 'Jan', :surname => 'Kowalski', :description => 'Opis Jana Kowalskiego'})
Author.create({ :name => 'Adam', :surname => 'Worth', :description => 'Opis Adama Worth\'a'})
Author.create({ :name => 'John', :surname => 'Druitt', :description => 'Opis John\'a Druitt\'a'})
Author.create({ :name => 'Seweryn', :surname => 'Klosowski', :description => 'Opis'})
Author.create({ :name => 'George', :surname => 'Chapman', :description => 'Opis'})
Author.create({ :name => 'Aaron', :surname => 'Kosminski', :description => 'Opis'})
Author.create({ :name => 'Michael', :surname => 'Ostrog', :description => 'Opis'})
Author.create({ :name => 'John', :surname => 'Pizer', :description => 'Opis'})
Author.create({ :name => 'James', :surname => 'Sadler', :description => 'Opis'})
Author.create({ :name => 'Francis', :surname => 'Tumblety', :description => 'Opis'})

BookGenre.create({:name=>"Horror"})
BookGenre.create({:name=>"Thriller"})
BookGenre.create({:name=>"Fantasy"})
BookGenre.create({:name=>"Mystery"})
BookGenre.create({:name=>"History"})
BookGenre.create({:name=>"Children's Book"})



Book.create({:title => "Runaway", :author_id => 1, :book_genre_id=>1})
Book.create({:title => "First & Only", :author_id => 2, :book_genre_id=>2})
Book.create({:title => "Best Soup Recipes", :author_id => 3, :book_genre_id=>3})
Book.create({:title => "Social Media Marketing", :author_id => 4, :book_genre_id=>4})
Book.create({:title => "Resurection", :author_id => 5, :book_genre_id=>5})
Book.create({:title => "Lord Fool to the Rescue", :author_id => 6, :book_genre_id=>6})
Book.create({:title => "Seven Days From Sunday", :author_id => 7, :book_genre_id=>1})
Book.create({:title => "Encrypted", :author_id => 8, :book_genre_id=>2})
Book.create({:title => "Shades of Gray", :author_id => 1, :book_genre_id=>3})
Book.create({:title => "Growing Up Amish", :author_id => 2, :book_genre_id=>4})
Book.create({:title => "Drowning Ruth", :author_id => 2, :book_genre_id=>5})
Book.create({:title => "What Doesn't Kill You", :author_id => 3, :book_genre_id=>6})
Book.create({:title => "Truman", :author_id => 4, :book_genre_id=>5})
Book.create({:title => "The Shopkeeper", :author_id => 5, :book_genre_id=>1})
Book.create({:title => "The Snow Child", :author_id => 6, :book_genre_id=>2})


Publisher.create({:name=>"Wheatmark"})
Publisher.create({:name=>"Little, Brown and Company"})
Publisher.create({:name=>"Reagan Arthur Books"})
Publisher.create({:name=>"Triple J Press"})


Example.create({:book_id=>1, :publisher_id=>1, :publish_date=>"2010-02-03", :buy_date=>"2011-06-06"})
Example.create({:book_id=>2, :publisher_id=>2, :publish_date=>"2010-02-03", :buy_date=>"2011-06-06"})
Example.create({:book_id=>3, :publisher_id=>2, :publish_date=>"2010-02-03", :buy_date=>"2011-06-06"})

Reservation.create({:example_id=>1, :user_id=>1})

Hire.create({:example_id=>1, :user_id=>1})
Hire.create({:example_id=>1, :user_id=>1, :return_date=>DateTime.new(2000)})



