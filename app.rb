require './environment'
require 'sinatra/base'
module FormsLab
    class App < Sinatra::Base


        get '/' do
          
     		erb :root
     	end

    	 get '/pirates' do
           @pirates =Pirate.all
     		erb :'pirates/index'
     	end

     	 get  '/new' do
     		
     		erb :'pirates/new'
     	 end

     	 get 'pirates/:id' do
     	 	@pirate = Pirate.find(params[:id])
     	    erb :'pirates/show'
     	 end

     	post '/pirates' do
     	      @pirate = Pirate.new(params[:pirate])

            # @pirate = Pirate.new(name: params[:pirate][:name], 
            # 	height: params[:pirate][:height], weight: params[:pirate][:weight], ship: params[:pirate][:ship][][:type])
     
            params[:pirate][:ships].each do |ship_details|
               @ship = Ship.new(ship_details)
               # @ship.pirate = @pirate
                 # @ships.all << @ship
            end
                   # @ships = Ship.all
     			# redirect to'pirates/#{pirate.id}'
     
             erb :'pirates/show'
      end
     	 	
    end
end
 # Pirate Name: <input type="text" name="pirate[name]">
 #  Pirate Weight: <input type="text" name="pirate[weight]">
 #  Pirate Height: <input type="text" name="pirate[height]" />
 #  Ship Name <input id="ship_name_1" type="text" name="pirate[ships][][name]" >
 #  Ship Type <input id="ship_name_1" type="text" name="pirate[ships][][type]" >
 #  Ship Booty <input id="ship_name_1" type="text" name="pirate[ships][][booty]" >
 #  Ship Name <input id="ship_name_2" type="text" name="pirate[ships][][name]" >
 #  Ship Type <input id="ship_name_2" type="text" name="pirate[ships][][type]" >
 #  Ship Booty <input id="ship_name_2" type="text" name="pirate[ships][][booty]" >
