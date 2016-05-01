class CreateAdminService
  def call
    user = User.find_or_create_by!(email: ENV["adminr_email"]) do |user|
    		user.admin = true
        user.name = ENV["adminr_name"]
        user.password = ENV["adminr_password"]
        user.password_confirmation = ENV["adminr_password"]
      end
  end
end
