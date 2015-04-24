module Redbubble
  Collection = Struct.new(:collection)

  class WorksCollection < Collection
    alias_method :all, :collection

    def limit(method, n)
      send(method)[0..(n - 1)]
    end

    def pluck(attribute)
      order(all.map { |work| work.exif.send(attribute) }.uniq)
    end

    def where(filters = {})
      filters.each_with_object(all) do |filter, result|
        result.select! { |work| work.exif.send(filter.first) == filter.last }
      end
    end

    private

    def order(array)
      array.sort do |a, b|
        if a && b
          a <=> b
        else
          a ? -1 : 1
        end
      end
    end
  end
end
