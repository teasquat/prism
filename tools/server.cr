require "socket"
require "option_parser"

# all data sent through the server
# - must be offset by one as
# - the first element in the bytes
# - will be treated as command.

# structure:
# - [0] : command
# - [1] : id
# - [2 .. #bytes] : data

host = "0.0.0.0"
port = 1337

clients = {} of UInt8 => Socket::IPAddress

OptionParser.parse! do |opts|
  opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
    port = opt.to_i
  end
end

server = UDPSocket.new
server.bind host, port

while !server.closed?
  bytes = Slice(UInt8).new(32)
  message, client = server.receive(bytes)

  # join
  if bytes[0] == 200
    # handle new clients
    clients[bytes[1]] = client
  end

  # pass offset data
  if bytes[0] == 201
    # pass bytes to all connected clients
    if clients[bytes[1]] == client
      clients.each_value do |c|
        server.send(bytes, c)
      end
    end
  end

  # leave
  if bytes[0] == 202
    # handle leaving clients
    if clients[bytes[1]] == client
      clients.reject!(bytes[1])
    end
  end
end

server.close
