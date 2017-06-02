class CompaniesController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @companies = User.where(type: "Company").each{ |user| user.becomes(user.type.constantize) }
  end

  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @company = User.find(params[:id])
    end
end
