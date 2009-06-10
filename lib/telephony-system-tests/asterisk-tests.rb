module AsteriskTests

  #Method that connects to the Asterisk Manager API, logins in and then sends a ping command
  def ping_asterisk_manager
    begin
      @socket = TCPSocket.open(@config['asterisk']['hostname'], @config['asterisk']['port'])
    rescue => err
      return err
    end
    
    response = @socket.gets
    if response.match /Asterisk Call Manager/
      if @socket
        command = { 'Action'   => 'login',
                    'Username' => @config['asterisk']['username'],
                    'Secret'   => @config['asterisk']['secret'] }
          
        result = write_to_ami command
        if result.match /Message: Authentication accepted/
          command = { 'Action' => 'ping' }
          result = write_to_ami command
        end
      end
    end
    
    @socket.close
    result.rstrip
  end
  
  private
  
  #Method to write to the Asterisk Manager Interface and return the full result
  def write_to_ami(data)
    data.each do |k,v|
      @socket.write("#{k}: #{v}\r\n")
    end
    @socket.write("\r\n")
    result = ''
    loop do
      partial_data = @socket.read(1)
      result = result + partial_data
      #Match on the Asterisk message terminator '\r\n\r\n'
      if result.match /\W\W\W\W/
        break
      end
    end
    result
  end
  
end
