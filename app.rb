require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Testing infrastructure"
  end


  run! if app_file == $0
end
