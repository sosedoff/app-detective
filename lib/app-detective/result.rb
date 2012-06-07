require 'hashr'

module AppDetective
  class Result < Hashr
    def initialize(data={})
      if data.empty?
        data[:language] = 'none'
        data[:framework] = 'none'
      end
      super(data)
    end
  end
end