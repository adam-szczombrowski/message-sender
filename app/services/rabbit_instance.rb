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
end
