# Sidekiq and two rails apps

One sidekiq enqueues work, other sidekiq retrieves it

## Example

One is the one that performs the work, so tail the log and run; One has three queues: high, medium, low.
It will take 30 seconds to perform each job.

```
bundle exec sidekiq
```

Two is the one that enqueues work, so tail the log and run the rake task:
Two will randomly add work to each of the queues every second

```
bundle exec rake enqueue:work
```

## Monitoring
You can see the queues build up at:
```
http://localhost:3000/sidekiq/queues
```
