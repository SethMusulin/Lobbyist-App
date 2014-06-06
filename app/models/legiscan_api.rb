class LegiScanApi
  def initialize (state, bill)
    @state = state
    @bill = bill
  end

  def call
    response = Faraday.get("http://api.legiscan.com/?key=#{ENV['LEGISCAN']}&op=getBill&state=#{@state}&bill=#{@bill}")
    JSON.parse(response.body)
  end
end