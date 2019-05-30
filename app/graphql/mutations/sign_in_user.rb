class Mutations::SignInUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(email:, password:)
    encrypted_password = User.encrypt(password)
    user = User.find_by(email: email, password: encrypted_password)
    if user.nil?
      return {
        user: nil,
        errors: ['Wrong Email or Password']
      }
    end

    {
      user: user,
      errors: []
    }
  end
end
