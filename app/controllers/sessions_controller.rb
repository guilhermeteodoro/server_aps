class SessionsController < ApplicationController
  def new
    redirect_to(root_path, notice: "Você já está logado.") if current_user
  end

  def create
    user = User.where(username: params[:signin][:username].strip).first

    if user && user.authenticate(params[:signin][:password])

      session[:user_id] = user.id
      redirect_to admin_root_path, notice: "Logado."
    else
      flash[:error] = "Erro: username/senha."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Deslogou."
  end

end
