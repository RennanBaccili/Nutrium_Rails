class ProfessionalsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @time = time
    end
  end
  private
  def time
    current_time = Time.now
    @formatted_time = current_time.strftime("%d de %B de %Y às %H:%M")
  end
end