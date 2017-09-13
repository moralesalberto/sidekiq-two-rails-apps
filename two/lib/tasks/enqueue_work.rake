namespace :enqueue do
  task work: :environment do
    while true do
      # the different priorities
      priorities = ['high_priority', 'medium_priority', 'low_priority']

      # randomnly enqueue work
      priority_queue = priorities.sort_by { rand }.first
      klass = "#{priority_queue.classify}Worker"

      # enqueue work on the other rails app
      job_hash = { 'class' => klass, 'args' => [Time.now.to_s], 'queue' => priority_queue }
      Rails.logger.info("Enqueuing a job: #{job_hash.inspect}")
      Sidekiq::Client.push(job_hash)

      # keep doing it
      sleep(1)
    end
  end
end
