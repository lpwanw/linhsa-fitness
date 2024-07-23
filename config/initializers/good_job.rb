# frozen_string_literal: true

Rails.application.configure do
  config.good_job.enable_cron = true
  config.good_job.cleanup_preserved_jobs_before_seconds_ago = 1.hour
  config.good_job.cron = {
    save_my_self: { # each recurring job must have a unique key
      cron: "*/1 * * * *", # cron-style scheduling format by fugit gem
      class: "KeepMeAliveJob", # name of the job class as a String; must reference an Active Job job class
      description: "Keep the service running on Render", # optional description that appears in Dashboard
    },
  }
end
