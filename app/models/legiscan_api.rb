class LegiScanApi
  def initialize (state, bill)
    @state = state
    @bill = bill
  end

  def call
    response = Faraday.get("http://api.legiscan.com/?key=2577f3697e3597ca2363909f55f143c8&op=getBill&state=#{@state}&bill=#{@bill}")
    JSON.parse(response.body)
  end
end