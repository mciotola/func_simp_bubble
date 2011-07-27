###############################################################################
#                                                                             #
# SIMPLE BUBBLE BY FUNCTIONS SIUMLATOR version 1.01                           #
#_____________________________________________________________________________#
#                                                                             #
# Copyright 2011 by Mark Ciotola                                              #
# Distributed under the terms of the GNU General Public license               #
# Last revised on 26 July 2011                                                #
# Contact information: mpaciotola@gmail.com                                   #
# Further information at: http://www.fastentropy.org                          #
#_____________________________________________________________________________#
#                                                                             #
# Developed with Ruby 1.8.7                                                   #
#                                                                             #
###############################################################################
   
  
# Include libraries
  include Math


# Create Bubble class

  class Bubble

    attr_accessor :growthfactor, :period, :efficiency, :rawproduction, :netproduction

	# Initialize parameters

    def initialize(attributes = {})
      
      @growthfactor = 0.25
      @period = 1
      @efficiency = 1 
      @rawproduction = 1.0
      @netproduction = 1
    end

	# Define actions

    def growthfactor
      return @growthfactor
    end

    def period
      return @period
    end

    def efficiency
      return @efficiency
    end

    def rawproduction
      return @rawproduction
    end

    def netproduction
      return @netproduction
    end

  end

# Create bubble instance

  bubble = Bubble.new


# Simulation Banner

puts "\n\n"
puts "#########################################################################"
puts "#                                                                       #"
puts "# SIMPLE BUBBLE SIUMLATOR version 1.01                                  #"
puts "#_______________________________________________________________________#"
puts "#                                                                       #"
puts "# Copyright 2011 by Mark Ciotola; dist under GNU General Public License #"
puts "#                                                                       #"
puts "#########################################################################"


# Introduction and Instructions

  puts "\n\n"
  puts "The program generates a thermodynamic bubble by discounting exponential growth by thermodynamic efficiency.  "
  puts "The exponential growth function is of the form F = e^(growth factor * period).  "
  puts "The form of the efficiency function, G (period), can vary linearly, exponentially, or not at all.  "
  puts "Net production is F * G.  "
  puts "\n\n"
  puts "You will be asked to enter the desired number of periods, growth factor and decay type.  "
  puts "This will allow you to try different assumptions or better fit your own data to the genrated model."
  puts "Values for the first parameters are recommended, but can be varied. However, the growth factor must be over zero.  "
  puts "If you don't have a desired efficiency decay type, first try linear decay to get a feel for this approach."
  puts "Some choices of parameters and decay type will result in a explosion or quick decline rather than a bubble."
  
  puts "\n\n"
   
  
  
# User Inputs Simulation Parameters

  puts "\n\n"
  puts "Provide desired number of periods (integer under 20 is best): \n\n"
  periods = gets.chomp

  puts "\n\n"
  puts "Provide desired growth factor (about 0.2 works well): \n\n"
  bubble.growthfactor = gets.chomp

  puts "\n\n"
  puts "Provide desired efficiency decay type (l = linear, e = exponential, n = none): \n\n"
  efficiency_decay = gets.chomp


# Display Initial Parameter Values

  puts "\n\n"
  puts "PARAMETERS AND INITIAL VALUES: \n\n"
  puts sprintf "Periods: \t %3d" , periods
  puts sprintf "Growth Factor: \t %3.3f" , bubble.growthfactor
  puts sprintf "Efficiency: \t %3.3f " , bubble.efficiency

  if efficiency_decay === "e"
    puts sprintf "Effic. Decay: \t %s" , "exponential, over 5 time constant periods." 
  elsif efficiency_decay === "n"
    puts sprintf "Effic. Decay: \t %s" , "none"
  else efficiency_decay === "l"
    puts sprintf "Effic. Decay: \t %s" , "linear" 
  end

       
# Display Simulation Banner
 
  puts "\n\n"  
  puts "RESULTS: \n\n"

  puts "PERIOD\t\tRAW PROD\t\tEFFICIENCY\t\tNET PROD"
  puts "------\t\t--------\t\t----------\t\t-------- \n"


# Calculate and Display Simulation Results (this is a loop)

  while bubble.period < (periods.to_f + 1.0) do

    if efficiency_decay === "e"
      bubble.efficiency = exp( - 6 * ((bubble.period - 1)/periods.to_f ) )
    elsif efficiency_decay === "n"
      bubble.efficiency =  1.0
    else efficiency_decay === "l"
      bubble.efficiency =  1.0 - (bubble.period/periods.to_f)
    end
   
    bubble.netproduction = bubble.rawproduction * bubble.efficiency

    per = bubble.period
    raw = bubble.rawproduction
    eff = bubble.efficiency
    net = bubble.netproduction

    mystring = ("%d \t  %13.3f \t\t  %1.3f \t %13.3f")
    puts sprintf mystring, per.to_s, raw.to_s, eff.to_s, net.to_s

    bubble.rawproduction = bubble.rawproduction * exp(bubble.growthfactor.to_f)
    bubble.period = bubble.period + 1
  
  end


# Indicates loop has executed and completed.

  puts "\nDone. \n"
  
  
# Possible Future Improvements: choice of amount of time constants for decay.
# Please feel free to contact the author with comments or further suggestions for improvements.

