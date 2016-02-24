require "raml_ruby_client/generator/version"
require "raml_ruby_client/generator/template"
require "raml_ruby_client/generator/parser"
require "raml_ruby_client/generator/writer"
require 'raml'
require 'fileutils'

require 'pry'

module RamlRubyClient
  class Generator
    TEMP_DIR = File.expand_path("../../../samples", __FILE__)
    LIBRARY_FILES = %w{http.rb client.rb configuration.rb}

    def generate(raml_file, output)
      parser = Parser.new(raml_file)
      writer = Writer.new(output)

      writer.write_root_file('Gemfile', Template.load('Gemfile').render({}))
      writer.write_lib_file("#{parser.library_path}.rb", Template.load('class.rb').render(parser: parser))
      LIBRARY_FILES.each do |template_name|
        writer.write_lib_file(
          File.join(parser.library_path, template_name),
          Template.load(template_name).render(parser: parser)
        )
      end

      writer.flush
    end

  end
end
