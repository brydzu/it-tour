# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include SpecSupport::Controllers::RespondWith, type: :controller
  config.extend  SpecSupport::Controllers::StubCurrentUser, type: :controller
  config.extend  SpecSupport::Controllers::StubCurrentConference, type: :controller
  config.include  SpecSupport::UploaderHelper, type: :uploader
end
