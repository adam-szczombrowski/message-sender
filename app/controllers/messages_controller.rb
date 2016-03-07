class MessagesController < ApplicationController
  def display
  end

  def send_to_queue
    message = params[:message]
    flash[:notice] = 'Message sent'
    RabbitInstance.instance.send_message(message)
    redirect_to root_path
  end

end
