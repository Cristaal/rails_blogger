class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :phone, :password, :password_confirmation)
  end

  #Ended up not needing this other set of strong params, decided to just use them on sign-up params. May fix at a later date.
  def account_update_params
    params.require(:user).permit(:email, :phone, :password, :password_confirmation)
  end
end
