class MessagesController < ApplicationController
  # default post request will go to this method
  protect_from_forgery :except => [:create, :index]

  def index
    @messages = nil
    @conversation = Conversation.find(params['conversation_id'])
    @messages = @conversation.messages
    render json: {messages: @messages}
  end

  def create
    @messages = nil
    render json: {messages: @messages}
  end

  def new
    @message = nil
    conversation = Conversation.find(params['conversation_id'])
    @message = conversation.messages.build(
                                      user_id: params['user_id'],
                                      body: params['message_params']['body']
                                    )
    @message.save!                        
    render json: {message: @message}
  end
end
