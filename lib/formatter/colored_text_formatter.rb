# encoding: utf-8

require 'rainbow'
require 'terminal-table'
require_relative 'base_formatter'

class ColoredTextFormatter < BaseFormatter
	
  def initialize(pReport)
    super(pReport)
  end
		
  def process
    tab="  "
    w Rainbow("INITIAL CONFIGURATIONS").bg(:blue)+"\n"
    my_screen_table = Terminal::Table.new do |st|
      @head.each { |key,value| st.add_row [ key.to_s, value.to_s] }
    end
    w my_screen_table.to_s+"\n"

    w Rainbow("TARGETS HISTORY").bg(:blue)+"\n"
    @lines.each do |i|
      if i.class.to_s=='Hash' then
        lValue=0.0
        color=:red
        if i[:check]
          lValue=i[:weight]
          color=:green 
        end
        w tab+"%02d"%i[:id]+" ("+Rainbow(lValue.to_s+"/"+i[:weight].to_s).color(color)+")\n"       
        w tab+"\t\t"+Rainbow("Description").bright+" : #{i[:description].to_s}\n"
        w tab+"\t\t"+Rainbow("Command    ").bright+" : #{i[:command].to_s}\n"
        w tab+"\t\t"+Rainbow("Expected   ").bright+" : #{i[:expected].to_s} (#{i[:expected].class.to_s})\n"
        w tab+"\t\t"+Rainbow("Result     ").bright+" : #{i[:result].to_s} (#{i[:result].class.to_s})\n"
      else
        w tab+"- "+i.to_s+"\n"
      end
    end

    w Rainbow("FINAL VALUES").bg(:blue)+"\n"
    my_screen_table = Terminal::Table.new do |st|
      @tail.each do |key,value| 
        if key.to_s=='grade'
          key=Rainbow(key.to_s).bright 
          value=Rainbow(value.to_s).bright 
        end
        if key.to_s=='unique_fault' and value.to_i!=0
          key=Rainbow(key.to_s).bg(:red) 
          value=Rainbow(value.to_s).bg(:red) 
        end
        st.add_row [ key.to_s, value.to_s] 
      end
    end
    w my_screen_table.to_s+"\n"
    
    deinit
  end
  
end

