require 'jwt'
class SessionsController < ApplicationController

	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to(:action => 'home')


		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

  def update
    check_user = User.updaterelationship(params[:username_or_email],params[:user_relationship])
    head 200, content_type: "text/html"
  end

	def getcontext
  	context = params[:data_value]
  	context = context.chop
  	context = context.reverse
  	context = context.chop
  	context = context.reverse

  	ENV['context'] = context
  	puts "Select Widget: " + context
		head 200, content_type: "text/html"
  end

	def generatetoken
		context = ENV['context']
		puts context
		exp = Time.now.to_i + 8 * 60
		iat = Time.now.to_i
		header = {:typ => 'JOSE', :kid => ENV['APIKEY']}
		payload ={:sub => '1234567890', :name => 'John Doe', :admin => true, :iat => iat, :exp => exp, :context => context}
		ENV['token'] = JWT.encode payload, 'secret', 'HS256', header

    head 200, content_type: "text/html"
  end
end
