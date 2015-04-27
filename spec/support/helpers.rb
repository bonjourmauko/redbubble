module Helpers
  def file(filename)
    File.read(File.join('spec', 'fixtures', 'files', filename))
  end

  def templates(filename)
    File.read(File.join('lib', 'redbubble', 'template', filename))
  end
end

RSpec.configure do |config|
  config.include Helpers
end
