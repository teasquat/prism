require "socket"

server = UDPSocket.new
server.bind "localhost", 3001

#array with positions and velocities of each id/player

while true
  bytes = Slice(UInt8).new(32)
  message_size, client_addr = server.receive(bytes)

  if  bytes[0]==200
    #a bunch of code where it uses the rest of the bytes to modify the data of a specific id, that id should also be specified in the data, and should not use the ip
  if  bytes[0]==201
    #hand out new id
  elsif  bytes[0]==202
    #give info on all other id/players
  elsif  bytes[0]==203
    #delete id
  end
end

server.close
