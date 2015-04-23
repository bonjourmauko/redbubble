module Redbubble
  class Parser < Nori
    def self.parse(filepath)
      new.parse(File.read(filepath))['works']['work']
    end
  end
end
