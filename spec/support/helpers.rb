module Helpers
  def file(filename)
    File.open(File.join('spec', 'fixtures', 'files', filename))
  end

  def templates(filename)
    File.join('lib', 'templates', filename)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
