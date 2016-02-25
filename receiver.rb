require "bunny"
conn = Bunny.new
conn.start
ch = conn.create_channel
q = ch.queue("hello")
puts " [*] Waiting for messages in #{q.name} queue. To exit press CTRL+C"
q.subscribe(block: true) do |delivery_info, properties, body|
  puts "Message received: #{body}"
end
