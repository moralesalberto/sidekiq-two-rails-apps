namespace :jobs do
  task load: :environment do
    while true do
      Sidekiq::Client.push('class' => 'LoaderWorker', 'args' => [Time.now.to_s], 'queue' => 'default')
      sleep(2)
    end
  end
end
