namespace :server do
  desc "Runs rails migrations on one instance and starts all instances"
  task :start => :environment do
    require "timeout"
    require "json"

    instance_number = JSON.parse(ENV["VCAP_APPLICATION"])["instance_index"]
    if instance_number == 0
      Rake::Task["db:migrate"].invoke
    end

    exec("bundle exec rails server -p $PORT")
  end
end