class NotesController < ApplicationController
  def index
    @notes = Note.order(:created_at)
  end

  def new
    @note = Note.new
  end

  def create
    @note       = Note.new
    @note.title = params[:note][:title]
    @note.tag   = params[:note][:tag]
    @note.note  = params[:note][:note]
    @note.save

    redirect_to "/notes/#{@note.id}"
  end


  def show
    @note = Note.find(params[:id])
  end

end


