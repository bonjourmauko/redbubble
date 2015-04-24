require 'redbubble/parser/exif'
require 'redbubble/parser/work'
require 'redbubble/parser/root'

module Redbubble
  class Parser
    def initialize(filepath)
      @file = File.read(filepath)
    end

    def parse
      Root.parse(@file).works
    end
  end
end
