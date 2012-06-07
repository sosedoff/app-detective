module AppDetective
  class Tree
    include AppDetective::Matchers

    attr_reader :root

    def initialize(path)
      @root = File.expand_path(path)

      if !File.exists?(@root)
        raise ArgumentError, "Path does not exist."
      end

      if !File.directory?(@root)
        raise ArgumentError, "Path is not a directory."
      end
    end

    def files(path='')
      entries(path).
        select { |p| !File.directory?(p) }.
        map { |p| File.basename(p) }
    end

    def dirs(path='')
      entries(path).
        select { |p| File.directory?(p) }.
        map { |p| File.basename(p) }
    end

    def entries(path='')
      Dir["#{relative_path(path)}/*"]
    end

    def read_file(path)
      File.read(relative_path(path))
    end

    def detect
      [
        detect_ruby,
        detect_nodejs,
        detect_php,
        detect_python
      ]
    end

    private

    def relative_path(path='')
      path.empty? ? root : File.join(root, path)
    end
  end
end