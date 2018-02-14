class CoachController < ApplicationController
  
  def signin_get
  end

  def signup_get
  end

  def signin
     email = params["email"]
     password = params["password"]
     coach = Coach.find_by_email(email)
     if coach
        if coach.password == password
           session[:user_id] = coach.id
           return redirect_to '/coach/profile'
        else
        	return redirect_to '/coach/signin'
        end
     else
     	return redirect_to '/coach/signup'
     end
  end

  def signup
  	email = params["email"]
  	password = params["password"]
  	name = params["name"]
  	coach = Coach.find_by_email(email)
  	if coach
  		return redirect_to '/coach/signin'
  	else
  	  @coach = Coach.create(email:email, password: password, name: name);
  	  session[:user_id] = @coach.id
  	  return redirect_to '/coach/profile'
  	end
  end

  def logout
     Coach.find(session[:user_id]).destroy      
     session[:user_id] = nil          
     return redirect_to '/coach/signin'
  end
end
