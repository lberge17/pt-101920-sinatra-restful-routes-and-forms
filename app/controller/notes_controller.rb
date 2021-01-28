class NotesController < ApplicationController
    # index route all notes - READ
    get '/notes' do
        redirect_if_not_logged_in
        @user = User.find(session["user_id"])
        @notes = @user.notes
        erb :"notes/index"
    end

    # render form to create note - CREATE
    get '/notes/new' do
        redirect_if_not_logged_in
        erb :"notes/new"
    end

    # show route singular note - READ
    get '/notes/:id' do
        redirect_if_not_logged_in
        @note = Note.find_by(id: params[:id])
        erb :"notes/show"
    end

    # create note - CREATE
    post '/notes' do
        redirect_if_not_logged_in
        redirect_error_if_not_authorized
        note = Note.create(params["note"])
        redirect "/notes/#{note.id}"
    end

    # render form to edit existing note - UPDATEs
    get '/notes/:id/edit' do
        redirect_if_not_logged_in
        redirect_error_if_not_authorized
        @note = Note.find_by(id: params[:id])
        erb :"notes/edit"
    end

    # update note - UPDATE
    patch '/notes/:id' do
        redirect_if_not_logged_in
        redirect_error_if_not_authorized
        note = Note.find_by(id: params[:id])
        note.update(params["note"])
        redirect "/notes/#{note.id}"
    end

    # delete existing note - DELETE
    delete '/notes/:id' do
        redirect_if_not_logged_in
        redirect_error_if_not_authorized
        note = Note.find_by(id: params[:id])
        note.delete
        redirect "/notes"
    end

    private

    def redirect_error_if_not_authorized
        redirect "/error"
    end

end