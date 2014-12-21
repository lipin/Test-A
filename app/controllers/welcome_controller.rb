class WelcomeController < ApplicationController
	def index
	    response = App.create_menu
	    body = JSON.parse response.body
	    	logger.info '**********************'
	        logger.info body.inspect
	        logger.info '----------------------'
	    if body['message'] 
	      render :text => "#{body['message']}"
	    end
 	 end
 	
end
