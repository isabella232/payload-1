# lib/tasks/scheduler.rake
task :update_btc_tx_statuses => :environment do
  UpdateBtcTxStatusJob.perform_now
end
