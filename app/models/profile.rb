class Profile < ApplicationRecord
  belongs_to :user
end


# for Profiles controller
# def index
#   @users = User.all
#   if params[:min_age] && params[:max_age]
#   @users = @users.where(params[:max_age].to_i, params[:min_age].to_i)
#   end
# end
