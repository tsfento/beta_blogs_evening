module UserService
  module Base
    def self.create(params)
      user = User.new(params)

      begin
        user.save!
      rescue ActiveRecord::RecordInvalid => e
        return ServiceContract.error(user.errors.full_messages) unless user.valid?
      end

      ServiceContract.success(user)
    end
  end
end
