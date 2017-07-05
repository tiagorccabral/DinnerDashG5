class WelcomeController < ApplicationController
	def home
		if User.all.any? == false
			@user = User.new(username: "admin", email: "admin@admin.com", name: "admin",
			 password: "admin", password_confirmation: "admin", address: "admin", admin: true)
			@user.save
		end
	end
end
