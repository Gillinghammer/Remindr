# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.create(name: "Lenny", 
          email: "lenny@simpsons.com",
          avatar: "http://cdn.staticneo.com/w/simpsons/thumb/a/ae/Lenny_Leonard.png/250px-Lenny_Leonard.png",
          contact_type: "friend",
          remind_interval: 14,
          user_id: 1)

Contact.create(name: "Chief Wiggum", 
          email: "wiggum@simpsons.com",
          avatar: "http://www.anvari.org/db/cols/The_Simpsons_Characters_Picture_Gallery/Clancy_Wiggum.png",
          contact_type: "friend",
          remind_interval: 75,
          user_id: 1)

Contact.create(name: "Mo", 
          email: "mo@simpsons.com",
          avatar: "https://c2.staticflickr.com/4/3588/3450003241_e7d4c2dc0c.jpg",
          contact_type: "friend",
          remind_interval: 7,
          user_id: 1)

Contact.create(name: "Marge", 
          email: "marge@simpsons.com",
          avatar: "http://images.sodahead.com/polls/002410493/3926777574_marge_simpson1_xlarge_xlarge.jpeg",
          contact_type: "family",
          remind_interval: 30,
          user_id: 1)

Contact.create(name: "Bart", 
          email: "bart@simpsons.com",
          avatar: "http://static.giantbomb.com/uploads/square_small/4/48992/1089078-bart.png",
          contact_type: "family",
          remind_interval: 10,
          user_id: 1)

Contact.create(name: "Mr. Burns", 
          email: "monty@simpsons.com",
          avatar: "http://www.tomtom.com/lib/img/voices/burns.png",
          contact_type: "professional",
          remind_interval: 60,
          user_id: 1)

Contact.create(name: "Hank Scorpio", 
          email: "scorpio@simpsons.com",
          avatar: "http://static.comicvine.com/uploads/scale_small/0/40/173189-63417-hank-scorpio.png",
          contact_type: "professional",
          remind_interval: 365,
          user_id: 1)
