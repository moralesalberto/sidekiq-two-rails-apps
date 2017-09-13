class HighPriorityWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high_priority'

  def perform(*args)
    Rails.logger.error("HIGH PRIORITY WORK: started at #{Time.now}, params=#{args.inspect}")
    sleep(30) # let's assume it takes 5 seconds to do work
    Rails.logger.error("HIGH PRIORITY WORK: ended at #{Time.now}, params=#{args.inspect}")
  end
end
