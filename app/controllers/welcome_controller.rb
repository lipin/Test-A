class WelcomeController < ApplicationController
	def index
	    response = App.create_menu
	    body = JSON.parse response.body
	    	logger.info '**********************'
	        logger.info body.inspect
	        logger.info '----------------------'
	    if body['sessionId']
	      authentication = User.find_or_initialize_by session_id: body['sessionId']
	      authentication.play_id="ping.li1688@gmail.com"
	      authentication.attributes = ({
	        session_id:  body['sessionId'],
	        total_word_count: body['data']['numberOfWordsToGuess']
	      })
	      authentication.save
	      return authentication
	    else
	      # logger.info body
	      raise body
	    end
 	 end
 	 def new 
 	 	authentication =User.last
 	 	
 	 end
 	
end
