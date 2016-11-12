require 'socket'

class ClientHandler
  def initialize(client_socket)
    @client_socket = client_socket
  end

  def execute
    message = @client_socket.gets.chop()
    message += " from Server"
    puts "message from Server = *#{message}*"
    @client_socket.puts(message)
    @client_socket.close
  end
end

def main
  server_socket = TCPServer.new("0.0.0.0",5555)
  while(true)
    client_socket = server_socket.accept #open new socket and port

    client_handler = ClientHandler.new(client_socket)

    Thread.new(client_handler) do |handler|
      handler.execute
    end
  end
end

main