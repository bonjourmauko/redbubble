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
      write(works, template('index.html'), 'index.html').makes.each do |make|
        write(works.where(make: make.name), template('make.html'), make.href).models.each do |model|
          write(works.where(make: make.name, model: model.name), template('model.html'), model.href)
        end
      end

      puts 'Yeeah Boi!!!'
    end

    default_task :htmlify

    private

    def write(view, template, output)
      File.open(File.join(outpath, output), 'w+') do |file|
        file.write(rendered(view, template))
      end && view
    end

    def works
      Redbubble::View::Works.new(parsed)
    end

    def parsed
      Redbubble::Model::Work.parse(file)
    end

    def file
      File.read(File.expand_path(options[:filepath]))
    end

    def rendered(view, template)
      Redbubble::Renderer.new(view, template).render
    end

    def template(filename)
      File.read(File.join('lib', 'redbubble', 'template', filename))
    end

    def outpath
      File.expand_path(options[:output])
    end
  end
end
