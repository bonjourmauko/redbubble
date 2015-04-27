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
      works    = Redbubble::Model::Work.parse(file)
      view     = Redbubble::View::Works.new(works)
      template = File.read(File.join('lib', 'redbubble', 'template', 'works.html'))
      rendered = Redbubble::Renderer.new(view, template).render

      File.open(File.join(outpath, 'index.html'), 'w+') do |f|
        f.write(rendered)
      end
    end

    default_task :htmlify

    private

    def file
      File.read(File.expand_path(options[:filepath]))
    end

    def outpath
      File.expand_path(options[:output])
    end
  end
end
