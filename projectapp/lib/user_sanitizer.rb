class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
#     def sign_up
#         default_params.permit(:user_display_name, :email, :password, :password_confirmation, :current_password)
#     end
# 
#     def sign_in
#         default_params.permit(:user_display_name, :email, :password, :password_confirmation, :current_password)
#     end
end