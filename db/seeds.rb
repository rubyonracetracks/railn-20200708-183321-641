require 'ruby-progressbar'

########################
# BEGIN: creating admins
########################

puts '----------------------------------'
puts 'Creating super admin (Jill Tarter)'
Admin.create!(name: 'Tarter',
              username: 'jill_tarter',
              email: 'jill_tarter@rubyonracetracks.com',
              password: 'SETI Institute',
              password_confirmation: 'SETI Institute',
              confirmed_at: Time.now, super: true)

puts '----------------------------------'
puts 'Creating super admin (Frank Drake)'
Admin.create!(name: 'Drake',
              username: 'frank_drake',
              email: 'fdrake@rubyonracetracks.com',
              password: 'Drake Equation',
              password_confirmation: 'Drake Equation',
              confirmed_at: Time.now, super: true)

n_admins = 50
puts '--------------------------------------------'
puts "Creating the first #{n_admins} random admins"
pbar = ProgressBar.create(total: n_admins)
n_admins.times do |n|
  name1 = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email_address = "admin-#{n + 1}@rubyonracetracks.com"

  Admin.create!(name: name1,
                username: "admin#{n + 1}",
                email: email_address, password: 'Daytona 500',
                password_confirmation: 'Daytona 500',
                confirmed_at: Time.now)
  pbar.increment
end

n_admins = 51
puts '---------------------------------------------'
puts "Creating the second #{n_admins} random admins"
pbar = ProgressBar.create(total: n_admins)
n_admins.times do |n|
  name1 = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email_address = Faker::Internet.email(name: name1)

  Admin.create!(name: name1,
                username: "admin-faker#{n + 1}",
                email: email_address, password: 'Daytona 500',
                password_confirmation: 'Daytona 500',
                confirmed_at: Time.now)
  pbar.increment
end

###########################
# FINISHED: creating admins
###########################

#######################
# BEGIN: creating users
#######################

puts '-----------------------------'
puts 'Creating user (Ellie Arroway)'
User.create!(name: 'Ellie Arroway',
             username: 'earroway',
             email: 'ellie_arroway@rubyonracetracks.com',
             password: '3.14159265',
             password_confirmation: '3.14159265',
             confirmed_at: Time.now)

puts '----------------------------'
puts 'Creating user (Example User)'
User.create!(name: 'Example User',
             username: 'example_user',
             email: 'example@railstutorial.org',
             password: 'Daytona 500',
             password_confirmation: 'Daytona 500',
             confirmed_at: Time.now)

n_users = 52
puts '------------------------------------------'
puts "Creating the first #{n_users} random users"
pbar = ProgressBar.create(total: n_users)
n_users.times do |n|
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email_address = "example-#{n + 1}@railstutorial.org"

  User.create!(name: name,
               username: "user#{n + 1}", email: email_address,
               password: 'Daytona 500',
               password_confirmation: 'Daytona 500',
               confirmed_at: Time.now)
  pbar.increment
end

n_users = 53
puts '-------------------------------------------'
pbar = ProgressBar.create(total: n_users)
puts "Creating the second #{n_users} random users"
n_users.times do |n|
  name1 = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email_address = Faker::Internet.email(name: name1)

  User.create!(name: name1,
               username: "user-faker#{n + 1}", email: email_address,
               password: 'Daytona 500',
               password_confirmation: 'Daytona 500',
               confirmed_at: Time.now)
  pbar.increment
end

##########################
# FINISHED: creating users
##########################
