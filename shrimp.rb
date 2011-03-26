class Shrimp
  SHRIMP_STRING = "ITS A SHRIMP"                                               

  def initialize(app)
    @app = app       
  end                

  def call(env)
    puts SHRIMP_STRING
    status, headers, response = @app.call(env)

    response_body = []
    response.each { |part| response_body << part }
    response_body << "<pre>#{SHRIMP_STRING}</pre>"
    
    headers["Content-Length"] = response_body.inject(:+).length.to_s
    puts response_body
    [status, headers, response_body]  
  end                 
end