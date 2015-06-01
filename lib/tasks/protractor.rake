namespace :protractor do
  desc "Prepares the db for test"
  task reset: :environment do
    puts 'Setup the db for tests'
    system "rake db:purge RAILS_ENV=test"
    system "rake db:seed RAILS_ENV=test"
    puts 'Db setup for tests'
  end

  desc "Runs protractor tests"
  task run: :environment do
    system "rake protractor:reset"
    system "rails s -e test -p 3001 --pid tmp/pids/server2.pid > /dev/null &"
    system "protractor spec/javascripts/protractor-conf.js"
    system "kill -9 $(cat tmp/pids/server2.pid) > /dev/null"
  end
end
