require 'aruba'
require 'aruba/api'

RSpec.configure do |config|
  config.include Aruba::Api

  config.before(:each) do
    restore_env
    clean_current_dir
  end
end

root = File.expand_path('../../..', __FILE__)

ENV['PATH'] = "#{File.join(root, 'ext')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
