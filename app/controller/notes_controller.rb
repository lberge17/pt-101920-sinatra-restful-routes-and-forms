class NotesController < ApplicationController
    # index route all notes
    get '/notes' do
        @notes = Note.all
        erb :"notes/index"
    end

    # render form to create note
    get '/notes/new' do
        erb :"notes/new"
    end

    # show route singular note
    get '/notes/:id' do
        @note = Note.find_by(id: params[:id])
        erb :"notes/show"
    end

    # create note
    post '/notes' do
        note = Note.create(title: params["title"], content: params["content"])
        redirect "/notes/#{note.id}"
    end

    # render form to edit existing note
    get '/notes/:id/edit' do
        @note = Note.find_by(id: params[:id])
        erb :"notes/edit"
    end

    # update note
    patch '/notes/:id' do
        note = Note.find_by(id: params[:id])
        note.update(title: params["title"], content: params["content"])
        redirect "/notes/#{note.id}"
    end

    # delete existing note
    delete '/notes/:id' do
        note = Note.find_by(id: params[:id])
        note.delete
        redirect "/notes"
    end


end