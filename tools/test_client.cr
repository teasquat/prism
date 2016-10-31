require "socket"

client = UDPSocket.new
client.connect "0.0.0.0", 1337

slice = Slice.new(9) { |i|
  (200 + i).to_u8
}

client.puts slice
