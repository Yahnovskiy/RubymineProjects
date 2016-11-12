require 'socket'

def main
  client_socket = TCPSocket.new("127.0.0.1",5555)
  message = gets
  client_socket.puts(message)

  answer = client_socket.gets
  puts answer

  client_socket.close
end

main