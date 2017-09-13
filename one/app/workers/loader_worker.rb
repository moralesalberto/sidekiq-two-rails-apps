class LoaderWorker
  include Sidekiq::Worker

  def perform(*args)
    Rails.logger.info(args[0])
  end
end
