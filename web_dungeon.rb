require "webrick"
require_relative "dungeon"

class DungeonServlet < WEBrick::HTTPServlet::AbstractServlet
  
  @@html = %q{
    <html>
      <head>
        <title>The Dungeon</title>
      <body>
        <form method="get">
          <p>
            <input type="text" name="line" size="40"/>
            What would you like to do
            <input type="submit"/>
          </p>
          
        </form>
      </body>
    </html>
  }
  
  def do_GET
    response.status = 200
    response.content_type = "text/html"
    
    if request.query['line'] && request.query['line'].length > 1
      #have to change the dungeon methods around to accept external calls.
      