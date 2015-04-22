require 'thor'

module Redbubble
  class CLI < Thor
    option :filepath,
           desc: "Path to Redbubble's XML file.",
           default: 'works.xml',
           type: :string,
           aliases: ['-f']

    desc 'htmlify', "Creates a set of static HTML files from a Redbubble's XML file."

    def htmlify
      true
    end

    default_task :htmlify
  end
end
