require 'legiscan_api'

class BillTrackersController < SignedinController

  def create
    @search = Search.new
    @search.bill=params[:bill]
    @search.state=params[:state]
    @search.user_id=current_user.id
  end

  def show
    @note = Note.new
    if params[:state] && params[:bill]
      @state = params[:state]
      @bill = params[:bill].gsub(/\d\d-/i, "").delete(' ').delete('-')
      @search = LegiScanApi.new(ENV['LEGISCAN'])
      @bill_results = @search.call(@state, @bill)
      # creates a search record if the LegiScan API call returns results
      if @bill_results["status"] != "ERROR"
        create_search_record(params[:state], params[:bill], current_user.id)

      end
    end
  end

  def create_search_record(state, bill, user)
    search = Search.new
    search.state = state.upcase
    search.bill = bill.gsub(/\d\d-/i, "").delete(' ').delete('-').upcase
    search.user_id = user
    search.save
  end
end