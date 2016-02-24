module RamlRubyClient
  class Parser
    attr_reader :raml_object

    def initialize(raml_file)
      @raml_object = Raml.parse_file(raml_file)
    end

    def base_uri
      raml_object.base_uri
    end

    def config_keys
      ['endpoint']
    end

    def apis
      @apis ||= raml_object.resources.map {|key, resource| parse_apis(key, resource) }.flatten
    end

    def namespace
      @namespace ||= raml_object.title.gsub(" ", "/")
    end

    def module_name
      namespace.camelize.gsub('::', '')
    end

    def library_path
      namespace.gsub("/", "_").downcase
    end

    private

    def parse_apis(key, resource)
      resource.children.map {|method| build_api(method, key) }
    end

    def build_api(method, key)
      OpenStruct.new({ method_name: "#{method.name}#{key.gsub('/', '_')}", verb: method.name, path: key })
    end
  end
end
