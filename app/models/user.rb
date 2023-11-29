class User < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 } # Ajuste o comprimento conforme necessário
  validates :gender, :country, :date_of_birth, :phone, :status, :profession, presence: true
end


