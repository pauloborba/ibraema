class PersonsController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @persons = User.where(type: "Person").each{ |user| user.becomes(user.type.constantize) }
  end

  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @person = User.find(params[:id])
    end
end
