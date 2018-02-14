module Api
  module V1
    class CoachApiController < ::ApiController

      def sign_in
        email = params["email"]
        password = params["password"]
        coach = Coach.find_by_email(email)
        if coach
          if coach.password == password
            data = Hash.new
            data["access_token"] = coach.access_token
            return response_data(data, "Signed In", 200)

          else
            return response_data({}, "Password Invalid", 200)

          end

        else
          return response_data({}, "Coach doesn't exist", 200)


        end
        return response_data({}, "Signed In", 200)
      end

      def sign_up
        name = params["name"]
        email = params["email"]
        password = params["password"]
        coach = Coach.find_by_email(email)
        if coach
           return response_data({}, "Coach exist", 200)
        else
           @coach = Coach.create(email: email,name: name,password: password)
           data = Hash.new
           data["access_token"] = @coach.access_token
           return response_data(data, "Signed up", 200)
        end
      end


    end
  end
end
