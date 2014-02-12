# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User_one = User.create(email: 'swap123@gmail.com', password: '12345678', password_confirmation: '12345678')
User_two = User.create(email: 'gymboreee@gmail.com', password: 'yeart5678', password_confirmation: 'yeart5678')
User_three = User.create(email: 'uglyduck@gmail.com', password: 'topiwala', password_confirmation: 'topiwala')

Q1 = PostQuestion.create(question: 'How do I install sqlite3 for Ruby on Windows?', user: User_one, body: "Being really new to Ruby/Rails, and after attempting to resolve the issue myself this weekend I'm making an attempt to seek advice here.

I have a complete Ruby/Apache/Passenger setup done on FreeBSD, and I'm trying to accomplish the task of using Windows as a Ruby development environment.")
Q2 = PostQuestion.create(question: 'Rails model singular format', user: User_two, body: "This is more a question to see if an error has occurred when creating a model in my app. I have created a model in the usual way rails g model Media Now i thought that this would actually create the following. I thought the model represented as single media but the database consists of many medias. Why would the migration not change to medias? Is it best to delete this model and try it again or is this normal behaviour? Thanks")
Q3 = PostQuestion.create(question: 'How does ActiveSupport do month sums?', user: User_three, body: "I was pleased and surprised to find that ActiveSupport does month sums in the way I wanted it to. Regardless of how many days are in the months in question, adding 1.month to a particular Time will land you on the same day-of-the-month as the Time.")
Q4 = PostQuestion.create(question: 'In Perl, why does variable interpolation fail for a hexadecimal escape sequence?', user: User_two, body: 'In Perl, why does variable interpolation fail for a hexadecimal escape sequence?')

PostAnswer.create(answer: 'I found a lot of information online, but being a Ruby newbie I had a tough time following all. The basic answer comes from the following post https://github.com/luislavena/sqlite3-ruby/issues/82 with instructions by "paulwis" on how to properly install sqlite3 for ruby 2.0.0-p0 and some comments on https://github.com/rails/rails/issues/10150', post_question: Q1, user_display_name: 'nickname123', number_of_votes: 3, user: User_two,)
PostAnswer.create(answer: "That's a really good question. The short answer is that 1.month is an ActiveSupport::Duration object (as you already saw) and its identity is defined in two different ways:as 30.days (in case you need/try to convert it to a number of seconds), and as 1 month (in case you try to add this duration to a date). You can see that it still knows that it is equivalent to 1 month by inspecting its parts method: main > 1.month.parts => [[:months, 1]]", post_question: Q3, user_display_name: 'ruby', number_of_votes: 5, user: User_one)
PostAnswer.create(answer: 'Media is the plural of Medium. The clean way would be to have a Medium model and Media for table name.', post_question: Q2, user_display_name: 'rails', number_of_votes: 8, user: User_one)
