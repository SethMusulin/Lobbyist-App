class NotesController < SignedinController

  def index
    @user = User.find(session[:user_id])
    #@notes = Note.order(:created_at)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new
    @note.title = params[:note][:title]
    @note.tag = params[:note][:tag]
    @note.note = params[:note][:note]
    @note.user_id = session[:user_id]
    if @note.save
      redirect_to "/notes/#{@note.id}"
    else
      render "/notes/new"
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])

  end

  def update
    @note = Note.find(params[:id])
    @note.title = params[:note][:title]
    @note.tag = params[:note][:tag]
    @note.note = params[:note][:note]
    @note.save
    redirect_to "/notes/#{@note.id}"

  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end


end


