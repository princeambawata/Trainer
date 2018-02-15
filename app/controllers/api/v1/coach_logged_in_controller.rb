module Api
  module V1
    class CoachLoggedInController < ::ApiController

      # include ActionController::HttpAuthentication::Token::ControllerMethods

      # before_action :authenticate_coach, except: [:authenticate_coach, :feed]

      def feed
         data = User.all
         return response_data(data, "Your Feed",200)
      end

      def schedule
          user_id = params["user_id"]
          schedule = params["schedule"]
          user = User.find(user_id)
          if user
            user.update_attributes(schedule: schedule)
            return response_data({}, "schedule updated",200)
          else
            return response_data({}, "user not exist",200)
          end
      end

      
      def authenticate_coach
        authenticate_with_http_token do |token, options|
          @current_coach_api = Coach.find_by_access_token(token)
        end

        unless current_coach_api
          return response_data({},"Not Authorised",401)
        end
      end

      def current_coach_api
          @current_coach_api
      end

    end
  end
end