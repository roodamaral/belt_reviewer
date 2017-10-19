class CommentsController < ApplicationController

	def create
		@event = Event.find(params['event_id'])
		current_user.comments.create(content:params['content'], event: @event)
		redirect_to '/show/'+@event.id.to_s
	end

	def destroy
		comment = Comment.find(params['comment_id'])
		current_user.comments.destroy(comment)
		redirect_to '/show/'+@event.id.to_s
	end





end

