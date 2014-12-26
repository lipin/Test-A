class WelcomeController < ApplicationController
	def index
			player_id='ping.li1688@gmail.com'
			build_menus=Jbuilder.encode do |json|
				json.key_format! camelize: :lower
				json.player_id  player_id
				json.action  "startGame"
			 end
			response = App.create_menu(build_menus)

			@body=JSON.parse response.body
			cookies['sessionId'] = @body['sessionId']
		
  	end 
  	def nextword

  		build_menus=Jbuilder.encode do |json|
			json.key_format! camelize: :lower
			json.session_id  cookies['sessionId']
			json.action  'nextWord'
		 end

		response = App.create_menu(build_menus)

		@body=JSON.parse response.body
  	end
  	def guess

  		build_menus=Jbuilder.encode do |json|
			json.key_format! camelize: :lower
			json.session_id  cookies['sessionId']
			json.action  'guessWord'
			json.guess params['word']
		 end


		response = App.create_menu(build_menus)

		@body=JSON.parse response.body
  	end
  	def result
  		build_menus=Jbuilder.encode do |json|
			json.key_format! camelize: :lower
			json.session_id  cookies['sessionId']
			json.action  'getResult'
		 end

		response = App.create_menu(build_menus)

		@body=JSON.parse response.body
  	end
  	def ltresult
  		build_menus=Jbuilder.encode do |json|
			json.key_format! camelize: :lower
			json.session_id  cookies['sessionId']
			json.action  'submitResult'
		 end

		response = App.create_menu(build_menus)

		@body=JSON.parse response.body
		cookies['sessionId']=nil
  	end
end
