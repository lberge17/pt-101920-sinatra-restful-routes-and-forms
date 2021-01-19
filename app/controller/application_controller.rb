class ApplicationController < Sinatra::Base
    # set :views, Proc.new { File.join(root, "../views") }

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end

    get '/' do
        erb :index
    end

end