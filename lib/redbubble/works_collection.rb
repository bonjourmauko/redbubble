module Redbubble
  class WorksCollection < Collection
    alias_method :all, :collection

    def limit(method, n)
      send(method)[0..(n - 1)]
    end

    def makes
      all.map { |work| work.exif.make }.uniq.order
    end

    def models
      all.map { |work| work.exif.model }.uniq.order
    end
  end
end
