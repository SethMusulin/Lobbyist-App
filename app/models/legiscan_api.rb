class LegiScanApi
  def initialize (token, state, bill, year=Time.now.year)
    @token = token
    @state = state
    @bill = bill
    @year = year
  end


  def retrieve_bill_info
    if @year ==Time.now.year
      response = Faraday.get("http://api.legiscan.com/?key=#{@token}&op=getBill&state=#{@state}&bill=#{@bill}")
      JSON.parse(response.body)
    else
      response = Faraday.get("http://api.legiscan.com/?key=#{@token}&op=getSessionList&state=#{@state}")
      body = JSON.parse(response.body)
      sesh = body["sessions"].select { |session| session["name"].include?(@year) }
      response2= Faraday.get("http://api.legiscan.com/?key=#{@token}&op=getMasterList&id=#{sesh[0]["session_id"]}")
      body2 = JSON.parse(response2.body)

      bill_id= nil
      body2["masterlist"].each do |result|
        result.each do |bill|
          bill_id = bill["bill_id"] if bill["number"] == @bill
        end
      end
      response3 = Faraday.get("http://api.legiscan.com/?key=#{@token}&op=getBill&id=#{bill_id}")
      JSON.parse(response3.body)
    end
  end
end