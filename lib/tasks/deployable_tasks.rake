require 'dotenv'
Dotenv.load

namespace :db do
  desc "DEPLOYABLE: backup using mongodump"
  task :backup => :environment do
    app = ENV['APP'] || raise("APP not set, add to .env")
    db = "#{app}_#{Rails.env}"
    time = Time.now.strftime("%Y%m%d-%H%M%S")
    dir = "/srv/apps/db/#{app}/#{time}"
    %x{mongodump -d #{db} -o #{dir} && cd /srv/apps/db/#{app} && tar cfz #{time}.tgz #{time} && rm -rf #{time}}
    puts "backed up: #{time} -> #{dir}.tgz"
  end

  desc "DEPLOYABLE: pull db backup from server, specify timestamp as argument"
  task :pull, [:host] => :environment do |_, args|
    #TODO: FIX THIS
    app = ENV['APP'] || raise("APP not set, add to .env")
    host = args.host || "kagero"
    time = nil

    unless time
      puts "running 'cap database:backup'..."
      output = %x{cap database:backup 2>&1}
      #puts "output: #{output}"
      output.match(/backed up: ([\d-]+)/) do |m|
        time = m[1]
        puts "time: #{time}"
      end
    end

    raise "specify time" unless time
    file = "/srv/apps/db/#{app}/#{time}.tgz"

    cmd = <<-CMD
    scp shawn@#{host}:#{file} . && \
    tar xvfz #{time}.tgz && \
    rm -rf #{time}.tgz && \
    rake db:drop && \
    mongorestore -d #{app}_development #{time}/#{app}_production
    CMD
    %x{#{cmd}}
    %x{rm -rf #{time}*}
    Rails.cache.clear
  end
end

