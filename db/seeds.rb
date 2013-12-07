# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



applications = applications = [
	{:name => 'Ninja Courses', :creator => 'William Li, Alex Sydell', 
	:URL => 'http://www.ninjacourses.com', :description => "Used to generate potential schedules for students.", 
	:category => "Academic"}, 
	{:name => 'Berkeley Time', :creator => 'Yuxin Zhu, Noah Gilmore', 
	:URL => 'http://www.berkeleytime.com', :description => "Berkeleytime started as a weekend hack that allowed students to easily filter through thousands of classes by requirement, grades, and enrollment. Since then, it has become one of the most popular resources on campus, and was visited 50,000 times in the last semester alone. The first iteration empowered students to discover new and exciting classes, and our goal is to extend this online experience to schedule planning, events, and organizations within 1-2 years.",
	:category => "Academic"},
	{:name => 'Course Flask', :creator => 'Jeff Chang', 
	:URL => 'http://www.courseflask.com', :description => "Used to plan what classes to take for 4 years.",
	:category => "Academic"},
	{:name => 'Cal Util', :creator => 'Kevin Lindkvist', 
	:URL => 'https://calutil.herokuapp.com', :description => "Our application provides students with all the information they need about courses, the dining commons, Cal1Card retailers, campus buildings, and bus schedules around campus, all in a personalized manner. It also automatically logs them into Air Bears when they open the app, no interaction necessary.  Along with this app, we also provide the api that it is used as a data source.",
	:category => "Multipurpose"},
	{:name => 'Telebears Oracle', :creator => 'Timothy Zhu', 
	:URL => 'http://telebearsoracle.com', :description => "Asked all your friends and still don't know which classes to Phase 1? Want some hard data to back up your assumptions? Telebears Oracle lets you see how section enrollment varies over time. Compare how fast different classes fill up and make a more informed decision.",
	:category => "Academic"},
	{:name => 'BuyNearMe', :creator => 'Eric Xiao', 
	:URL => 'http://buynear.me', :description => "BuyNearMe is a streamlined marketplace for community-based local trading. Our market need is indicated by the abundant use of Facebook groups by over 11,000 college students for the same purpose-- to buy and sell items to classmates. We have found that solutions available: eBay, Amazon, Craigslist, are not suited for community-based local trading for various reasons. Network based trading promotes communal accountability and transparency, creating a safer, relevant, more trustworthy environment. Right now, we are focused on the college community, specifically Berkeley, but the ideas can be extended to any community, such as the workplace. We have over 10,000 visits over the last two months.",
	:category => "Commerce"},
	{:name => 'Calaborate', :creator => 'Samir Makhani', 
	:URL => 'http://calaborate.herokuapp.com', :description => "Calaborate makes it very simple for students to search and create study groups for their classes in real-time. Let’s say you have a midterm tomorrow, and you’re panicking. You are probably not alone. What if you could search which study groups are active at that exact time? This is just one of many use cases. Our mission is to encourage student collaboration and provide instant help for any student that needs it.",
	:category => "Academic"},
	{:name => 'Class Blueprint', :creator => 'Adam Remba', 
	:URL => 'classblueprint.com', :description => "Class Blueprint helps students plan their college classes for the time they are in school by organizing required courses and prerequisite courses for any major automatically through our database.  We hope to help students plan out their four years of college classes so they can graduate on time and with the degree or degrees they want.",
	:category => "Academic"},
	{:name => 'HedgeMyCareer', :creator => 'Jie Min Wong', 
	:URL => 'finance-edu.herokuapp.com', :description => "HedgeMyCareer prepares you for job interviews by providing interactive content that helps you review materials related to interviews. The eventual goal is to become a platform where anyone can contribute interactive contents related to any kinds of job.For a start, we're focusing on careers in the sales and trading tract of the finance industry.",
	:category => "Career"},
	{:name => 'Sellegit', :creator => 'Unknown', 
	:URL => 'https://sellegit.com/', :description => "Sellegit is a unique, online marketplace that utilizes the Dutch auction method for local trading. Prices on our website can only go down. Buyers no longer need to wait until the end of an auction to win. For any item, you can buy it now or name your price. Sellegit will automatically place bids for buyers when the price falls to their ideal value. We offer sellers complete pricing control.",
	:category => "Commerce"}
]

user1 = User.create!(:name => "Admin Admin", :email => "admin@admin.com", :password => "saasbook", :password_confirmation => "saasbook")

applications.each do |app|
	Calapp.create!(app)
end
