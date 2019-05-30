class Mutations::CreateUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :name, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(name:, email:)
    user = User.new(name: name, email: email)
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
