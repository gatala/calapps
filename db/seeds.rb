# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


applications = [{:name => 'Ninja Courses', :creator => 'William Li, Alex Sydell', 
	:URL => 'http://www.ninjacourses.com', :description => "Used to generate potential schedules for students."}, 
	{:name => 'Berkeley Time', :creator => 'Yuxin Zhu, Noah Gilmore', 
	:URL => 'http://www.berkeleytime.com', :description => "Used to search through different classes and look for interesting lectures or empty classrooms during the day."},
	{:name => 'Course Flash', :creator => 'Jeff Chang', 
	:URL => 'http://www.courseflask.com', :description => "Used to plan what classes to take for 4 years."}
]


applications.each do |app|
	Calapp.create!(app)
end