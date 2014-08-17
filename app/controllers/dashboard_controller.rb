class DashboardController < SignedinController
  def index
    @notes=current_user.notes.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @searches=current_user.searches.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

end
