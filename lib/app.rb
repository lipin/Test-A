module App
	extend self
 def create_menu
  	conn = get_conn

  	conn.post do |req|
      req.url "/game/on"
      req.headers['Content-Type'] = 'application/json'
      req.body = build_menus
    end

  end
  def build_menus
  	 Jbuilder.encode do |json|
		json.key_format! camelize: :lower
		json.player_id  "ping.li1688@gmail.com"
		json.action  "startGame"
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