class AdminsController < ApplicationController

  def edit
    @admin = current_admin
  end

  def index
    @admins = Admin.all
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

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save(admin_params)
        format.html { redirect_to admins_path, notice: 'Criado com sucesso' }
      else
        format.html { redirect_to :back, notice: 'Falha ao criar' }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])

    if @admin == current_admin
      redirect_to root_path, notice: "Administrador apagado"
    else
      redirect_to admins_path, notice: "Administrador apagado"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:password, :email)
    end
end
