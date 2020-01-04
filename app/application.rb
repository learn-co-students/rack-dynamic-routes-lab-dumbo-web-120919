require 'pry'
class Application
    pear = Item.new("pear", 3.42)
    @@item = ["Figs"]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      
      if req.path.match(/items/)
        item_add = req.path.split("/items/").last
        #binding.pry
        if @@item.include?(item_add)
            resp.write "#{"3.42"}"
        else
            resp.write "Item not found"
            resp.status = 400
        end

      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end