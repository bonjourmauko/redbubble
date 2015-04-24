require 'thor'

module Redbubble
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    option :filepath,
           desc: "Path to Redbubble's XML file.",
           type: :string,
           required: true,
           aliases: ['-f']

    option :output,
           desc: 'Path to write the HTML files.',
           type: :string,
           required: true,
           aliases: ['-o']

    desc 'htmlify', "Creates a set of static HTML files from a Redbubble's XML file."

    def htmlify
      works      = Parser.new(options[:filepath]).parse
      collection = WorksCollection.new(works)
    end

    default_task :htmlify
  end
end
