module Redbubble
  module Decorator
    class Works < SimpleDelegator
      attr_reader :works
      alias_method :all, :works

      def initialize(works)
        @works = works.map { |work| Work.new(work) }
        super
      end

      %i(makes models thumbnails).each do |method|
        define_method(method) { pluck(method.to_s.chop) }
      end

      def limit(method, n)
        send(method)[0..(n - 1)]
      end

      def where(filters = {})
        filters.each_with_object(all) do |filter, result|
          result.select! { |work| work.send(filter.first) == filter.last }
        end
      end

      private

      def pluck(attribute)
        all.map { |work| work.send(attribute) }.uniq
      end
    end
  end
end
