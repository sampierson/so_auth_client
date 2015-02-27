module Kernel
  GEM_FILE_LINE_METHOD_REGEX = /.*\/gems\/([^\/]+).*\/(.+):([\d]+):in `(.+)'/
  FILE_LINE_METHOD_REGEX = /.*\/(.+):([\d]+):in `(.+)'/

  def pretty_caller
    Kernel.caller.map do |line|
      # "/Users/sam/.rvm/gems/ruby-2.1.0@so_auth/gems/omniauth-oauth2-1.1.2/lib/omniauth/strategies/oauth2.rb:93:in `build_access_token'"
      if matchdata = GEM_FILE_LINE_METHOD_REGEX.match(line)
        gem, file, line, method = matchdata[1], matchdata[2], matchdata[3], matchdata[4]
        "From gem #{gem} #{file}:#{line} in #{method}"
      elsif matchdata = FILE_LINE_METHOD_REGEX.match(line)
        file, line, method = matchdata[1], matchdata[2], matchdata[3]
        "From #{file}:#{line} in #{method}"
      else
        line
      end
    end
  end
end
