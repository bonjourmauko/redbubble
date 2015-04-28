require 'aruba'
require 'aruba/api'

RSpec.configure do |config|
  config.include Aruba::Api

  config.before(:each) do
    restore_env

    if RUBY_PLATFORM =~ /java/ || defined?(Rubinius)
      @aruba_timeout_seconds = 60
    else
      @aruba_timeout_seconds = 10
    end

    @dirs = ['.']
  end
end

root = File.expand_path('../../..', __FILE__)

ENV['PATH'] = "#{File.join(root, 'ext')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

Aruba.configure do |config|
  config.before_cmd do
    set_env('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
  end
end if RUBY_PLATFORM == 'java'

Aruba.configure do |config|
  config.before_cmd do
    set_env('RBXOPT', "-Xint=true #{ENV['RBXOPT']}") # disable JIT since these processes are so short lived
  end
end if defined?(Rubinius)
