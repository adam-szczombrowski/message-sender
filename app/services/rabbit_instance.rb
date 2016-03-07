class RabbitInstance
  include Singleton

  def initialize
    conn = Bunny.new
    conn.start
    @ch = conn.create_channel
    @q = @ch.queue("hello")
  end

  def channel
    @ch
  end

  def queue
    @q
  end

  def send_message(message)
    self.channel.default_exchange.publish(message, routing_key: "hello")
    puts "Sent #{message} to queue 'hello'"
  end
end
