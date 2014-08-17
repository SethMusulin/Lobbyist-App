class NotesController < SignedinController

  def index
    @notes=current_user.notes

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
      client = EvernoteOAuth::Client.new(token: session[:authtoken])
      note_store = client.note_store
      make_note(note_store, @note.title, @note.note)
      redirect_to "/dashboard"
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

  def make_note(note_store, note_title, note_body, parent_notebook=nil)

    n_body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    n_body += "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
    n_body += "<en-note>#{note_body}</en-note>"

    ## Create note object
    our_note = Evernote::EDAM::Type::Note.new
    our_note.title = note_title
    our_note.content = n_body


    ## Attempt to create note in Evernote account
    begin
      note = note_store.createNote(our_note)
    rescue Evernote::EDAM::Error::EDAMUserException => edue
      ## Something was wrong with the note data
      ## See EDAMErrorCode enumeration for error code explanation
      ## http://dev.evernote.com/documentation/reference/Errors.html#Enum_EDAMErrorCode
      puts "EDAMUserException: #{edue}"
    rescue Evernote::EDAM::Error::EDAMNotFoundException => ednfe
      ## Parent Notebook GUID doesn't correspond to an actual notebook
      puts "EDAMNotFoundException: Invalid parent notebook GUID"
    end
    ## Return created note object
    note

  end

end

