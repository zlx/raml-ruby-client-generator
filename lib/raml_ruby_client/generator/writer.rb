module RamlRubyClient
  class Writer
    attr_reader :target_dir

    TEMP_DIR = File.expand_path("../../../../samples", __FILE__)

    def initialize(target_dir)
      @target_dir = target_dir
      @temp = File.join(TEMP_DIR, Time.now.to_i.to_s)
    end

    def write_root_file(name, content)
      write_file(File.join(@temp, name), content)
    end

    def write_test_file(path, content)
      write_file(File.join(@temp, 'test', path), content)
    end

    def write_lib_file(path, content)
      write_file(File.join(@temp, 'lib', path), content)
    end

    def flush
      FileUtils.mkdir_p(@target_dir)
      FileUtils.mv Dir.glob(File.join(@temp, '*')), @target_dir

      FileUtils.rm_rf(@temp)
    end

    private

    def write_file(path, content)
      FileUtils.mkdir_p File.dirname(path)

      File.open(path, 'wb') {|file| file.write content }
    end

  end
end
