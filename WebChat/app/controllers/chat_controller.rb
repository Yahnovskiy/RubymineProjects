class ChatController < ApplicationController
  include Tubesock::Hijack

  def index
    if session[:login] == nil
      redirect_to :root
    else
      @login = session[:login]
    end
  end

  def chat_handler
    hijack do |client_sock|
      client_sock.onmessage do |data|
        data_array = data.split(':')
        if data_array[0] == 'name'
          puts 'OK'
          $chat_users[data_array[1]] = client_sock
          client = ChatUser.where(:login => data_array[0]).first
          messages = Message.where(:receiver => client)
          # send private messages from SQL DB
          puts 'before SQL DB OK'
          if (messages.size != 0)
            messages.each do |message|
              sender_login = ChatUser.where(:id => message.sender_id).first
              mess = message.body
              client_sock.send_data(sender_login.login + ':' + mess)
            end
          end
          # send broadcast messages from NoSQL DB
          puts 'before NoSQL DB OK'
          broadcast_messages = $redis.lrange('broadcast', 0, -1)
          if (broadcast_messages.size != 0)
            broadcast_messages.each do |broadcast_mess|
              client_sock.send_data('broadcast:' + broadcast_mess)
            end
          end
        elsif (data_array[0] == 'list')
          puts 'LIST START'
          output = ''
          users = $chat_users.keys
          users.each do |user|
            output += user + "\n"
          end
          puts output
          client_sock.send_data('list:' + output)
          puts 'LIST FINISH'
        elsif (data_array[0] == 'broadcast')
          socket_list = $chat_users.values
          socket_list.each do |sock|
            sock.send_data('broadcast:' + data_array[1])
          end
          $redis.lpush('broadcast', data_array[1])
        elsif (data_array[0] == 'disconnect')
          login = $chat_users.index(client_sock)
          $chat_users.delete(login)
          session.clear
        else
          receiver_name = data_array[0]
          sender_name = $chat_users.index(client_sock)
          if ($chat_users[receiver_name] != nil)
            output_message = sender_name + ':' + data_array[1]
            receiver_sock = $chat_users[receiver_name]
            receiver_sock.send_data(output_message)
          else
            sender_client = ChatUser.where(:login => sender_name).first
            receiver_client = ChatUser.where(:login => receiver_name).first
            mess = Message.new(:body => data_array[1])
            mess.sender = sender_client
            mess.receiver = receiver_client
            mess.save
          end
        end
      end
    end
  end
end