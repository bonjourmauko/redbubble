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
      parsed   = Redbubble::Model::Work.parse(file)
      works    = Redbubble::View::Works.new(parsed)

      write(works, template('index.html'), 'index.html')

      works.makes.each do |make|
        makes = Redbubble::View::Works.new(parsed).where(make: make.name)

        write(makes, template('make.html'), make.href)

        makes.models.each do |model|
          models = Redbubble::View::Works.new(parsed).where(make: make.name).where(model: model.name)

          write(models, template('model.html'), model.href)
        end
      end

      puts 'Yeeah Boi!!!'
    end

    default_task :htmlify

    private

    def write(view, template, output)
      File.open(File.join(outpath, output), 'w+') do |file|
        file.write(rendered(view, template))
      end
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
