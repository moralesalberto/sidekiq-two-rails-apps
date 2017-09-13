namespace :jobs do

  task run: :environment do
    1000.times { LoaderWorker.perform_async(Time.now) }
  end

end
