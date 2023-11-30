class User < ApplicationRecord
  # Você pode usar a deterministic: opção de gerar vetores de inicialização de forma determinística, permitindo efetivamente a consulta de dados criptografados.
   encrypts :email, deterministic: true, downcase:true

  validates :full_name, presence: true
  validates :password, presence: true, length: { minimum: 6 } # Ajuste o comprimento conforme necessário
  validates :gender, :country, :date_of_birth, :phone, :status, :profession, presence: true
end


