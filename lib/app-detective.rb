require 'app-detective/version'
require 'app-detective/core_ext'
require 'app-detective/result'
require 'app-detective/matchers'
require 'app-detective/tree'

module AppDetective
  def self.version
    AppDetective::VERSION
  end
end