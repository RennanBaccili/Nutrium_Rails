# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = if params[:query].present? # se tiver query nos params passado no input
               User.where('UPPER(full_name) LIKE ?', "%#{params[:query].upcase}%")
             # ele faz uma busca transformando todos os nomes em uppercase
             else
               User.all
             end
    # é nessario  enviar respostas diferente, se conter turbo fram ou não conter turbo farm
    respond_to do |format|
      # Se tiver vindo o conteúdo de um turbo_farm
      # manda só a parte do turbo frame
      if turbo_frame_request?
        format.html { render partial: "search_users", locals: { users: @users } }
        #Assim
      else
        format.html
      end
    end
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    @user.save ? (redirect_to professionals_url(user_id: @user)) : (render :new)
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    redirect_to users_url, notice: 'User was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:full_name, :email, :password, :gender, :country, :date_of_birth, :phone,
                                 :profession, :status)
  end
end
