class ConversationsController < ApplicationController
  protect_from_forgery :except => :create 

  def create
    conversation_id = params[:conversation_id] 
    sender_id = params[:sender_id]
    recipient_id = params[:recipient_id]
    if params['conversation_id']
      @conversation = Conversation.find(conversation_id)
    elsif Conversation.between(sender_id, recipient_id).present?
      @conversation = Conversation.between(sender_id, recipient_id).first
    else
      @conversation = Conversation.create!(
                                    sender_id: sender_id,
                                    recipient_id: recipient_id)
    end
    render json: { conversation: @conversation }
  end
end
