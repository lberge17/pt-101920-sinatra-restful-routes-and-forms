class NotesController < ApplicationController
    # index route all notes - READ
    get '/notes' do
        @notes = Note.all
        erb :"notes/index"
    end

    # render form to create note - CREATE
    get '/notes/new' do
        erb :"notes/new"
    end

    # show route singular note - READ
    get '/notes/:id' do
        @note = Note.find_by(id: params[:id])
        erb :"notes/show"
    end

    # create note - CREATE
    post '/notes' do
        binding.pry
        note = Note.create(params["note"])
        redirect "/notes/#{note.id}"
    end

    # render form to edit existing note - UPDATEs
    get '/notes/:id/edit' do
        @note = Note.find_by(id: params[:id])
        erb :"notes/edit"
    end

    # update note - UPDATE
    patch '/notes/:id' do
        binding.pry
        note = Note.find_by(id: params[:id])
        note.update(params["note"])
        redirect "/notes/#{note.id}"
    end

    # delete existing note - DELETE
    delete '/notes/:id' do
        note = Note.find_by(id: params[:id])
        note.delete
        redirect "/notes"
    end


end