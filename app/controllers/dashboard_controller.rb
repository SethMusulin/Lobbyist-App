class DashboardController < SignedinController
  def index
    @notes=current_user.notes
    @searches=current_user.searches
  end

end