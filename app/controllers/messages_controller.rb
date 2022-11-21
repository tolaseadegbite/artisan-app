class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        # @profile = Profile.find(params[:profile_id])
        @message = current_user.messages.new(message_params)

        if !@message.save
            flash[:notice] = @message.errors.full_messages.to_sentence
        end
        redirect_to profile_path(@message.profile)
    end

    private

    def message_params
        params.require(:message)
        .permit(:content, :parent_id)
        .merge(profile_id: params[:profile_id])
    end
end
