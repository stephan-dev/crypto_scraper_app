class HomeController < ApplicationController
	def initialize
		#StartScrape.new.perform
	end

	def index
		@rate = Rate.new
		puts
		puts "ceci est params dans la méthode index #{params}"
		puts
		rate = params[:rate]
		#@namec = params[rate][:name]
	end

	# def display
	# 	puts
	# 	puts "ceci est params dans la méthode display #{params}"
	# 	puts
	# 	rate = params[:rate]
	# 	@namec = params[:name]
	# 	redirect_to '/'
	# end

	def result

		puts
		puts "ceci est params dans la méthode result #{params}"
		puts
		rate = params[:rate]

		db = Rate.new

		@userresult = db.find_by(rate[:id])
		puts userresult

	end
	
end
