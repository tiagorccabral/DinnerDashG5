class User < ActiveRecord::Base

   has_secure_password

   validates :username, presence: true, # deve ser diferente de uma string vazia
                        uniqueness: {case_sensitive: false}, # deve ser único, independente de letra maiúscula ou mínuscula
                        length: {minimum: 5, maximum: 25}
   validate :username_cant_be_not_logged_in

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  # expressão regular para determinar a validade do email

   validates :email, presence: true,
                     length: {maximum: 110},
                     format: { with: VALID_EMAIL_REGEX }

   validates :name, presence: true,
                    length: {maximum: 120}

   validates_confirmation_of :password

   validates :address, presence: true,
                      uniqueness: true,
                      length: {minimum: 5, maximum: 160}

  def username_cant_be_not_logged_in
    if username == "not_logged"
      errors.add(:username, "has invalid words that prevent creation")
    end
  end
end
