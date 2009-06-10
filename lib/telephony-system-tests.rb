require 'drb'

$: << File.join(File.expand_path(File.dirname(__FILE__)), '/telephony-system-tests')
require 'libs'
require 'adhearsion-tests'
require 'asterisk-tests'
require 'sip-tests'

class TelephonySystemTests

  include AdhearsionTests
  include AsteriskTests
  include SipTests
  
  #Initiliaze the configuration
  def initialize
    config_file = File.join(File.expand_path(File.dirname(__FILE__)), '../config/application.yml')
    @config = YAML::load(File.open(config_file))
  end
  
end