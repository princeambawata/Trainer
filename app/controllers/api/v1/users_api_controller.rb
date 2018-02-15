module Api
  module V1
    class UsersApiController < ::ApiController

      def sign_in
        email = params["email"]
        password = params["password"]
        user = User.find_by_email(email)
        if user
          if user.valid_password? password
            data = Hash.new
            data["access_token"] = user.access_token
            return response_data(data, "Signed In", 200)

          else
            return response_data({}, "Password Invalid", 200)

          end

        else
          return response_data({}, "User doesn't exist", 200)


        end
        return response_data({}, "Signed In", 200)
      end

      def sign_up
        name = params["name"]
        email = params["email"]
        password = params["password"]
        coach_id = params["coach_id"]
        user = User.find_by_email(email)
        if user
           return response_data({}, "User exist", 200)
        else
           @user = User.create(email: email,name: name,password: password,coach_id: coach_id);
           data = Hash.new
           data["access_token"] = @user.access_token
           return response_data(data, "Signed up", 200)
        end
      end


    end
  end
end
