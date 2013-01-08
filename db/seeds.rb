# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

#puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name

u = Admin.new(
    :name => "Editor",
    :email => "editor@totomama.co.ke",
    :password => 't0t0m@m@'
)
u.save!(:validate => false)

pregnant = Stage.find_or_create_by_name_and_order('I am Pregnant', 0)
one_yr = Stage.find_or_create_by_name_and_order('My baby is one year old',1)
two_yr = Stage.find_or_create_by_name_and_order('My baby is 2-3 years old',2)
three_yr = Stage.find_or_create_by_name_and_order('My child is 3-5 years old',3)
h_a = Stage.find_or_create_by_name_and_order('Healthcare and safety', 4)

puts "Created #{Stage.all.length} stages"

prams = Category.find_or_create_by_name_and_stage_id_and_order('Prams', one_yr.id, 0)
cots = Category.find_or_create_by_name_and_stage_id_and_order('Cots', pregnant.id, 1)
bottles = Category.find_or_create_by_name_and_stage_id_and_order('Milk Bottles', pregnant.id, 1)

puts "Created #{Category.all.length} categories"

bottle = Item.find_or_create_by_name_and_category_id_and_description('Avent Natural Bottle', bottles.id, "A bottle that's easy to clean is sure to grab a mom's attention." )

puts "Created #{Item.all.length} items"

bottle = Shop.find_or_create_by_name_and_description_and_lat_and_lon_and_address('Stokke', " High quality baby products and accessories.", -1.298293, 36.762872, "Ground Floor, Junction Mall, Ngong Rd")

puts "Created #{Shop.all.length} shops"
