module Helpers
  def file(filename)
    File.join('spec', 'fixtures', 'files', filename)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
