module App
	extend self
 def create_menu(build_menus)
  	conn = get_conn

  	conn.post do |req|
      req.url "/game/on"
      req.headers['Content-Type'] = 'application/json'
      req.body = build_menus
    end
  end

  def get_conn
    conn = Faraday.new(:url => "https://strikingly-hangman.herokuapp.com") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end