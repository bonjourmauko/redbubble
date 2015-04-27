module Redbubble
  module View
    class Work < SimpleDelegator
      attr_reader :make, :model

      def initialize(work)
        @make  = Redbubble::View::Make.new(work.exif)
        @model = Redbubble::View::Model.new(work.exif)
        super
      end
    end
  end
end
