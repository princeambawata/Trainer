module Api
  module V1
    class UsersLoggedInController < ::ApiController

      # include ActionController::HttpAuthentication::Token::ControllerMethods

      # before_action :authenticate_user, except: [:authenticate_user,:feed]
      

      def feed
        data = Coach.all
        return response_data(data, "Your Feed",200)
      end

      def coach_profile
         data = Coach.find(params["coach_id"]);
         return response_data(data, "Coach profile",200)
      end

      def user_profile
         data = current_user_api.id
         return response_data(data, "Coach profile",200)
      end

      def update_details
         current_user_api.update_attributes(height: params["height"],weight: params["weight"],
          lifestyle: params["lifestyle"],goal: params["goal"], gender: params["gender"])
          return response_data({}, "updated profile",200)
      end
      
      def select_trainer
         trainer_id = params["trainer_id"]
         trainer = Coach.find(trainer_id)
         if trainer
            current_user_api.coach_id =  trainer_id
            return response_data({}, "trainer selected",200)
         else
         end
      end

      def authenticate_user
        authenticate_with_http_token do |token, options|
          @current_user_api = User.find_by_access_token(token)
        end

        unless current_user_api
          return response_data({},"Yo YO Authorised",401)
        end
      end

      def current_user_api
          @current_user_api
      end

    end
  end
end