module Helpers
  def filepath(filename)
    File.join('spec', 'fixtures', 'files', filename)
  end

  def file(filename)
    File.read(filepath(filename))
  end

  def templates(filename)
    File.read(File.join('lib', 'redbubble', 'template', filename))
  end
end

RSpec.configure do |config|
  config.include Helpers
end
