#this might fail db migration on heroku in some way
#require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    #PUT HERE!!
    require 'faker'
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@mmmumami.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@mmmumami.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
