class LowPriorityWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'low_priority'

  def perform(*args)
    Rails.logger.debug("LOW PRIORITY WORK: started at #{Time.now}, params=#{args.inspect}")
    sleep(30) # let's assume it takes 5 seconds to do work
    Rails.logger.debug("LOW PRIORITY WORK: ended at #{Time.now}, params=#{args.inspect}")
  end
end
