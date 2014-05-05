# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
q1 = Question.create(query:"Who am I?", explanation:"Big Brother") 
q2 = Question.create(query:"I am going to be a big giant my friend!", explanation:"My father is Microsoft")
q3 = Question.create(query:"I am so powerful", explanation:"Google")

# THEMES AND LEVELS
q1.theme_list.add("google")
q1.level_list.add("facile")
q1.answers.build(title:"Google true", true_false:"true")
q1.answers.build(title:"Bing false", true_false:"false")
q1.answers.build(title:"Yahoo false", true_false:"false")

q2.theme_list.add("bing")
q2.level_list.add("compliqué")
q2.answers.build(title:"Google true", true_false:"true")
q2.answers.build(title:"Bing true", true_false:"true")
q2.answers.build(title:"Yahoo false", true_false:"false")

q3.theme_list.add("google", "bing")
q3.level_list.add("compliqué")
q3.answers.build(title:"Google true", true_false:"true")
q3.answers.build(title:"Bing true", true_false:"true")
q3.answers.build(title:"Yahoo false", true_false:"false")

# ANSWERS
# a1 = q1.answers.build(good_answer:"bonne réponse", bad_answer:"mauvaise réponse", bad_answer_2:"mauvaise réponse 2")
# a2 = q2.answers.build(good_answer:"bonne réponse bing!", bad_answer:"mauvaise réponse", bad_answer_2:"mauvaise réponse 2")
# a3 = q3.answers.build(good_answer:"bonne réponse Google", bad_answer:"mauvaise réponse", bad_answer_2:"mauvaise réponse 2")

q1.save
q2.save
q3.save

# a1.save
# a2.save
# a3.save
#q2.tag_list.remove("awesome", "slick")
#@user.tag_list.add("awesomer, slicker", parse: true)



# USERS
user = User.create! :first_name => 'John', :last_name => 'Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user2 = User.create! :first_name => 'Céline', :last_name => 'LS', :email => 'celinems@gmail.com', :password => '123456789', :password_confirmation => '123456789'

# I am the master
user2.update_attribute(:admin, true)
