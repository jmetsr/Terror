class HomeController < ApplicationController
	def public
		excel_date = Date.today.jd - 2415019
		theta = [-4.0343634, -0.0889245, 0.1147820, 0.0050976, 0.1586932, 0.1665620, 0.0555014, 0.2661704, 0.2988567, -0.0053075, 0.0186723, 0.0722412, 0.3303643]
		f1 = 1
		i = excel_date - 1
		terror_attacks = TerrorAttack.all.map{|x|x.date}
		f2 = terror_attacks.select{|x| x==i}.size
		f3 = terror_attacks.select{|x| x==(i-1)}.size
		f4 = terror_attacks.select{|x| x==(i-2)}.size
		f5 = terror_attacks.select{|x| (x<(i-3) && x>(i-4))}.size
		f6 = terror_attacks.select{|x| (x<(i-5) && x>(i-7))}.size
		f7 = terror_attacks.select{|x| (x<(i-8) && x>(i-12))}.size
		f8 = terror_attacks.select{|x| (x<(i-13) && x>(i-20))}.size
		f9 = terror_attacks.select{|x| (x<(i-21) && x>(i-33))}.size
		f10 = terror_attacks.select{|x| (x<(i-34) && x>(i-54))}.size
		f11 = terror_attacks.select{|x| (x<(i-55) && x>(i-88))}.size
		f12 = terror_attacks.select{|x| (x<(i-89) && x>(i-143))}.size
		day_on_cal = excel_date%354
		if day_on_cal >= 228 && day_on_cal <= 257
			is_ram = 1
		else
			is_ram = 0
		end
		
		features = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,is_ram]
		sum = 0
		for i in 0..12
			sum = (sum + theta[i]*features[i])
		end
		@prob = 1/(1+2.71828**(-sum))


		render :public
	end
	def explination
		render :explination
	end

end