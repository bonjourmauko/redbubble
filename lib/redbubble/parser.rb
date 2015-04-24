require 'redbubble/parser/exif'
require 'redbubble/parser/work'
require 'redbubble/parser/root'

module Redbubble
  class Parser
    def self.parse(filepath)
      Root.parse(File.read(filepath)).works
    end
  end
end
