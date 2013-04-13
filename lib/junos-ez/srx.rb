require "junos-ez/provider"

module Junos::Ez::SRX; end
  
module Junos::Ez::SRX::Zones

  PROPERTIES = [
    :host_inbound_services,       ## array of service names | nil
    :host_inbound_protocols,      ## array of protocol names | nil
    :interfaces                   ## R/O array of interface names, will not catalog deeply
  ]  

  def self.Provider( ndev, varsym )       
    newbie = Junos::Ez::SRX::Zones::Provider.new( ndev )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( ndev, varsym, newbie )
  end
    
end

module Junos::Ez::SRX::Interfaces 
  
  PROPERTIES = [
    :host_inbound_services,
    :host_inbound_protocols,
  ]  
  
  def self.Provider( on_obj, varsym, opts = {} )     
    newbie = Junos::Ez::SRX::Interfaces::Provider.new( on_obj, nil, opts )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( on_obj, varsym, newbie )    
  end
  
end

module Junos::Ez::SRX::AddressBookEntries
  
  PROPERTIES = [:ip_prefix]
  
  def self.Provider( on_obj, varsym, opts = {} )     
    newbie = Junos::Ez::SRX::AddressBookEntries::Provider.new( on_obj, nil, opts )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( on_obj, varsym, newbie )    
  end
  
end

module Junos::Ez::SRX::AddressBookSets
  
  PROPERTIES = [:list]         # array of addresses
  
  def self.Provider( on_obj, varsym, opts = {} )     
    newbie = Junos::Ez::SRX::AddressBookSets::Provider.new( on_obj, nil, opts )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( on_obj, varsym, newbie )    
  end
  
end

module Junos::Ez::SRX::Policies
  
  PROPERTIES = [
    :rules_count,         # Number of rules in this policy context
    :rules                # Provider to Junos::Ez::SRX::PolicyRules
  ]
  
  def self.Provider( on_obj, varsym, opts = {} )     
    newbie = Junos::Ez::SRX::Policies::Provider.new( on_obj, nil, opts )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( on_obj, varsym, newbie )    
  end  
  
end

module Junos::Ez::SRX::PolicyRules
  
  PROPERTIES = [
    :description,           # string description
    :match_srcs,            # array of sources
    :match_dsts,            # array of destinations
    :match_apps,            # array of apps
    :action,                # [ :permit, :reject, :deny ]
    :count,                 # true | nil
    :log_init,              # true | nil
    :log_close              # true | nil
  ]  
  
  def self.Provider( on_obj, varsym, opts = {} )     
    newbie = Junos::Ez::SRX::PolicyRules::Provider.new( on_obj, nil, opts )     
    newbie.properties = Junos::Ez::Provider::PROPERTIES + PROPERTIES
    Junos::Ez::Provider.attach_instance_variable( on_obj, varsym, newbie )    
  end  
  
end

require 'junos-ez/srx/policies'
require 'junos-ez/srx/policyrules'
require 'junos-ez/srx/abooke'
require 'junos-ez/srx/abooks'
require 'junos-ez/srx/interfaces'
require 'junos-ez/srx/zones'



