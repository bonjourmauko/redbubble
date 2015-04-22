require 'active_support/dependencies/autoload'

module Redbubble
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :CLI
    autoload :Version
  end
end
