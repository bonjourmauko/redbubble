module Redbubble
  module View
    class Works < SimpleDelegator
      attr_reader :all

      def initialize(works)
        @all = works.map { |work| Work.new(work) }
        super
      end

      def makes
        pluck(:make).uniq(&:name)
      end

      def models
        pluck(:model).uniq(&:name)
      end

      def thumbnails
        pluck(:thumbnail)
      end

      def limit(method, n)
        send(method)[0..(n - 1)]
      end

      def where(filters = {})
        filters.each_with_object(all) do |filter, result|
          result.select! do |work|
            work.send(filter.first).name == filter.last
          end
        end
      end

      private

      def pluck(attribute)
        all.map { |work| work.send(attribute) }
      end
    end
  end
end
