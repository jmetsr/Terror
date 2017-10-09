class TerrorAttacksController < ApplicationController
	http_basic_authenticate_with :name => "frodo", :password => "6tablesAndAChair"
	def create
		@terror_attack = TerrorAttack.new(terror_attack_params)
		@terror_attack.save
		redirect_to(terror_attacks_url)
	end
	def new
		@terror_attack = TerrorAttack.new
		render :new
	end
	def index
		@terror_attacks = TerrorAttack.all
		render :index
	end
	def show
	end
	def terror_attack_params
    	params.require(:terror_attack).permit(:date)
  	end

end