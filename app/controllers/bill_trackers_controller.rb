require 'legiscan_api'

class BillTrackersController < ApplicationController


  def show
    @note = Note.new
    if params[:state] && params[:bill]
      @state = params[:state]
      @bill = params[:bill].gsub(/\d\d-/i, "")
      @search = LegiScanApi.new(@state, @bill)
      @bill_results = @search.call

    end
  end
end