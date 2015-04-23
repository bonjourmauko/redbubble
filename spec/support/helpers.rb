module Helpers
  def file(filename)
    File.expand_path(File.join('spec', 'fixtures', 'files', filename))
  end
end

RSpec.configure do |config|
  config.include Helpers
end
