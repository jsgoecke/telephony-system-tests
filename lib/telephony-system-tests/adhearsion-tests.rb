module AdhearsionTests

  #Method that connects to Adhearsion via DRb and sends a ping
  def ping_adhearsion_ami
    begin
      adhearsion = DRbObject.new_with_uri @config['adhearsion']['druby']
      result = adhearsion.ping
      result
    rescue => err
      return err
    end
  end
  
end