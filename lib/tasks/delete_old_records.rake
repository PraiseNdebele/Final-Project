namespace :delete do
  desc 'Delete old importants'
  task :old_records => :environment do
    Important.where('date < ?', Time.now.to_date).each do |p|
      p.destroy
    end
  end
end