module Redbubble
  Array.class_eval do
    def order
      sort do |a, b|
        if a && b
          a <=> b
        else
          a ? -1 : 1
        end
      end
    end
  end
end
