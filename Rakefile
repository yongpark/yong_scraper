# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "import metrics"
task metrics: :environment do
  ["80dc51b4-190c-11e4-b890-c30b71c99604","97d3c9d4-27de-11e4-ad58-ebaf01495130","b4296fa6-1ead-11e4-9846-8fb3d1da0f4d","d47bbc5a-4e64-11e4-b621-6baa5647e981","e3bf785a-1ead-11e4-8204-b73f286fa147","5780c83a-1ead-11e4-9113-97be02cdb9c8","a7281ac2-4e60-11e4-be1c-9f8657a674f6"].each do |app_id|
    raw_records = `curl --include --header "Authorization: Basic YjQyOTcxOTAtMWVhZC0xMWU0LWIzN2UtYTMyZjIwYzU1ZDU1" https://gamethrive.com/api/v1/notifications?app_id={#{app_id}}`
    records = JSON.parse(raw_records)
    binding.pry
    records.each do |record|
      metric = Metric.find_or_create_by(records)
      record.each do |k, v|
        unless k == '_id'
          begin
            if metric.send(k).blank?
              metric.send(k+"=", v)
            else
              unless v.blank?
                metric.send(k+"=", v)
              end
            end
          rescue
            puts "missing attribute #{k}"
          end
        end
      end
      metric.save
    end
  end
end
