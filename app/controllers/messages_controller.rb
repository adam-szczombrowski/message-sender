class MessagesController < ApplicationController
  def display
  end

  def send_to_queue
    message = params[:message]
    flash[:notice] = 'Message sent'
    send_message(message)
    redirect_to root_path
  end

  private

  def send_message(message)
    RabbitInstance.instance.channel.default_exchange.publish(message, routing_key: "hello")
    puts "Sent #{message} to queue 'hello'"
  end
end
