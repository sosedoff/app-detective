module AppDetective
  module Matchers
    def detect_ruby
      result = Result.new

      if files.include_all?(['Gemfile', 'config.ru', 'Rakefile'])
        result.language  = 'ruby'
        result.framework = 'rack'

        gemfile = read_file('Gemfile')
        case gemfile
          when /^gem ('|")rails('|")/i
            result.framework = 'rails'
          when /^gem ('|")sinatra('|")/i
            result.framework = 'sinatra'
        end
      end
      result
    end

    def detect_nodejs
      result = Result.new
      if files.include_all?(['package.json']) && files.include_any?(%w(app.js web.js server.js))
        result.language  = 'javascript'
        result.framework = 'nodejs'
      end
      result
    end

    def detect_php
      result = Result.new
      if files.include_all?(['index.php'])
        result.language = 'php'
        if files.include_all?(['wp-config.php', 'wp-settings.php'])
          result.framework = 'wordpress'
        end
      end
      result
    end

    def detect_python
      result = Result.new
      if files.include_any?(['setup.py'])
        result.language = 'python'
      end
      result
    end
  end
end