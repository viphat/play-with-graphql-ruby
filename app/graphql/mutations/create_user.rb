class Mutations::CreateUser < Mutations::BaseMutation
  description 'Create User'
  argument :email, String, 'Email that will be used to sign in (must be unique)', required: true
  argument :name, String, "User's name", required: true
  argument :password, String, 'Password used to sign in (At least 6 characters)', required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(name:, email:, password:)
    user = User.new(name: name, email: email, password: password)
    if user.save
      return {
        user: user,
        errors: []
      }
    end

    {
      user: nil,
      errors: user.errors.full_messages
    }
  end
end
