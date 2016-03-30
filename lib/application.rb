# encoding: utf-8

require 'singleton'

class Application
  include Singleton
    
  attr_reader :name, :version
  attr_accessor :global

  def initialize
    @name="sysadmin-game"
    @version="0.8.2"
    @global={}
  end

end
