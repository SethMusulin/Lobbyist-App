class DashboardController < SignedinController
  def index
    @notes=current_user.notes
  end

end