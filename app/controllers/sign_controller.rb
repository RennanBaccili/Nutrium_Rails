class SignController< ApplicationController
  def new
    @sign_form = SignForm.new
  end
  #new Cria e enviar para o create
  def create
    @sign_form = SignForm.new(login_params)
    #validate envia para actions sign_up.rb
    SignUp.call(@sign_form) do |action|
      action.on(:sucess) do
        redirect_to check_your_inbox_path
      end
      action.on(:error) do
        render :new
      end
    end

    render :new
  end

  private def login_params
    #formulario que vai ser passado
    params.require(:sign).permit(:email)
  end
end