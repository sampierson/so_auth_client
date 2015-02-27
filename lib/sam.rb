class Sam
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "\nSAM: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']}"
    retval = @app.call(env)
    status_code, options = retval
    msg = "\nSAM: code = #{status_code}"
    msg << ", Location #{options['Location']}" if status_code == 302
    puts msg
    retval
  end
end
