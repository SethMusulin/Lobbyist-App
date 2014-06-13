require 'legiscan_api'

class BillTrackersController < SignedinController


  def show
    @note = Note.new
    if params[:state] && params[:bill]
      @state = params[:state]
      @bill = params[:bill].gsub(/\d\d-/i, "").delete(' ').delete('-')
      @search = LegiScanApi.new(ENV['LEGISCAN'])
      @bill_results = @search.call(@state, @bill)

    end
  end
end