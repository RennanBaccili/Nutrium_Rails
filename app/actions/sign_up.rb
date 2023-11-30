class SignUp
  #Signal.call utilizada para enviar um email para o email cadastrado
  include Signal.call

  attr_reader :form
  def initialize (form)
    @form = form
  end
  def call
    return emit(:error) unless form.valid?
    #criação do envio de email

    #Classe SignLink, modelo da criação para o login
    link = SignLink.create(email)
    SignLink.valid?(link)
    #1. generate login  link
    #2. send email
    #3. emit :success signal
  end
end