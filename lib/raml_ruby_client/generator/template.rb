require 'erb'
require 'ostruct'
require 'active_support/inflector'

module RamlRubyClient
  class Generator
    TEMPLATE_DIR = File.expand_path("../templates", __FILE__)

    module TemplateHelper
      def include(partial, context)
        template = Template.new(sprintf("_%s.tmpl", partial))
        template.render(context)
      end

      def indent(str, spaces)
        pre = ' ' * spaces
        str = pre + str.split(/\n/).join("\n" + pre) + "\n"
        return str unless str.strip.empty?
        nil
      end
    end

    class Context < OpenStruct
      include TemplateHelper

      def to_binding
        binding
      end
    end

    class Template
      def self.load(template_name)
        Template.new(sprintf('%s.tmpl', template_name))
      end

      def initialize(template_name)
        file = File.join(TEMPLATE_DIR, template_name)
        @erb = ERB.new(File.read(file), nil, '-')
      end

      def render(context)
        ctx = Context.new(context)
        @erb.result(ctx.to_binding)
      end
    end
  end
end
