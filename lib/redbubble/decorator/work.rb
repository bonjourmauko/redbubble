module Redbubble
  module Decorator
    class Work < SimpleDelegator
      def initialize(work)
        @work = work
        super
      end

      def make
        get(:make)
      end

      def model
        get(:model)
      end

      private

      def get(attribute)
        exif.send(attribute)
      rescue
        'Unknown'
      end
    end
  end
end
