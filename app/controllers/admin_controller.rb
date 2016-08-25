class AdminController < ApplicationController
  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin

    respond_to do |format|
      if @admin.update_attributes(admin_params)
        format.html { redirect_to :back, notice: 'Atualizado com sucesso' }
      else
        format.html { redirect_to :back, notice: 'Falha ao atualizar' }
      end
    end
  end

  def change_password
    @admin = current_admin
  end

  def update_password
    @admin = current_admin
    password = encrypt(admin_params["password"])
    email = admin_params["email"]
    respond_to do |format|
      if @admin.update_attributes(password: password, email: email)
        format.html { redirect_to :back, notice: 'Atualizado com sucesso' }
      else
        format.html { redirect_to :back, notice: 'Falha ao atualizar' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:truck_id, :user_id, :status, :password, :email, :aleatory_truck, :price_per_km, :distance_limit, :address)
    end
end
