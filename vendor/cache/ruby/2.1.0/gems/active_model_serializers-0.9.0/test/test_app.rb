class TestApp < Rails::Application
  if Rails.version.to_s.first >= '4'
    config.eager_load = false
    config.secret_key_base = 'abc123'
  end

  # Set up a logger to avoid creating a log directory on every run.
  config.logger = Logger.new(nil)
end

TestApp.initialize!
