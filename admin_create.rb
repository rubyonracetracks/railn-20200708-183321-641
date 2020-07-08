arg_username = ''
arg_email = ''
arg_name = ''
arg_pwd = ''
arg_pwd_conf = ''

puts '***********************'
puts 'Creating the admin user'

while arg_username == ''
  puts
  puts 'Enter the username of the new admin:'
  arg_username = gets.chomp
end

while arg_email == ''
  puts
  puts 'Enter the email address of the new admin:'
  arg_email = gets.chomp
end

while arg_name == ''
  puts
  puts 'Enter the name of the new admin:'
  arg_name = gets.chomp
end

while arg_pwd == ''
  puts
  puts
  puts 'Using the same password for all of your accounts is risky.'
  puts 'Limiting yourself to passwords that you can easily remember is risky.'
  puts 'You should use a password management program like KeePassXC'
  puts '(http://www.keepassxc.org/) to create much better passwords AND '
  puts 'store them in encrypted form.'
  puts
  puts 'Enter the password of the new admin:'
  arg_pwd = gets.chomp
end

while arg_pwd_conf == ''
  puts
  puts 'Confirm the password of the new admin:'
  arg_pwd_conf = gets.chomp
end

puts
puts 'DEFAULT: no'
puts 'Do you wish to make this user a superadmin?'
puts "Enter 'Y' or 'y' to answer yes."
arg_super = gets.chomp

puts
if %w[Y y].include? arg_super
  Admin.create!(username: arg_username, name: arg_name,
                email: arg_email, password: arg_pwd,
                password_confirmation: arg_pwd_conf,
                super: true, confirmed_at: Time.now)
  puts 'Admin type: super'
else
  Admin.create!(username: arg_username, name: arg_email,
                email: arg_email, password: arg_pwd,
                password_confirmation: arg_pwd_conf,
                super: false, confirmed_at: Time.now)
  puts 'Admin type: regular'
end
puts "Username: #{arg_username}"
puts "Name: #{arg_name}"
puts "Email: #{arg_email}"
puts "Password: #{arg_pwd}"
