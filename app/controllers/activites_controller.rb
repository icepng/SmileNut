class ActivitesController < ApplicationController

	def show
		id = params[:id]
		@activity = Activity.find(id)
	end


	

	def all_events
		puts "************************************************"

		@activities = Activity.all()
		@activities.each do |activity|
			puts activity.start_date
		end
		'''
		@all_ratings=Movie.ratingcollection
		puts "************************************************"
		puts @all_ratings
		if params[:ratings]
			@ratings=params[:ratings].keys
		else
			@ratings=@all_ratings
		end
		@movies=Movie.where(rating:@ratings)
		@sorted=0
		@select="wait"
		if params[:select]
			@select=params[:select]
			@movies=@movies.sort_by{|movie| movie[@select]}
			if params[:sort].to_i==1
				@movies=@movies.reverse
				@sorted=0
			else
				@sorted=1
			end
		end
		'''
	end

	#------其他def-------
	def add
	
		@activity = Activity.find params[:acid]
		puts @activity.start_date
		puts "$$$$$$$$$$$$"
		puts "^^^^^^^^^^^^"
		if (params[:type] == "recommend")
			@activity.update_attributes(:recommend => (@activity.recommend + 1))
		else
			@activity.update_attributes(:want_join => (@activity.want_join + 1))
		end
		
		redirect_to :back
	end




end
