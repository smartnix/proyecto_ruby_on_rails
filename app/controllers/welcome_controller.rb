class WelcomeController < ApplicationController
  before_action :authenticate_admin!, only: [:dashboard]
  def index
  end
  def dashboard
  	@articulos = Articulo.all
  end
end
