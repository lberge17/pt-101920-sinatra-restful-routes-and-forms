class UsersController < ApplicationController

    # render form to create account
    get '/signup' do
        erb :"users/new"
    end

    # create new account
    post '/signup' do
        # validate email, validate password, email not in database
        if !params["email"].empty? && !params["password"].empty? && !User.find_by_email(params["email"])
            User.create(email: params["email"], password: params["password"])
            session["user_id"] = user.id
            redirect "/notes"
        else
            redirect "/signup"
        end

    end

    # render login form
    get '/login' do
        erb :"users/login"
    end

    # create session/log a user in
    post '/login' do
        user = User.find_by_email(params["email"])
        if user.authenticate(params["password"])
            session["user_id"] = user.id
            redirect "/notes"
        else
            "Invalid login"
            sleep 1
            redirect "/login"
        end
    end

    # log out/destroy session
    delete '/logout' do
    end

end