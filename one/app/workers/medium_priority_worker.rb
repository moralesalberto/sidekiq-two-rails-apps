class MediumPriorityWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'medium_priority'

  def perform(*args)
    Rails.logger.info("MEDIUM PRIORITY WORK: started at #{Time.now}, params=#{args.inspect}")
    sleep(30)
    Rails.logger.info("MEDIUM PRIORITY WORK: ended at #{Time.now}, params=#{args.inspect}")
  end
end
