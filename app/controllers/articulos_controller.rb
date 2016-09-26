class ArticulosController < ApplicationController
	#before_action :validate_user, except: [:show,:index]
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_articulos, except: [:index,:new,:create]
	#GET /articulos
	def index
	 @articulos = Articulo.all
	end
	#GET /articulos/:id
	def show
		#@articulos = Articulo.find(params[:id])
		@articulos.update_visits_count
		@comment = Comment.new
	end
	#GET /acticulos/new
	def new
		@articulos = Articulo.new
	end

	def edit
		#@articulos = Articulo.find(params[:id])
	end
	#POST /articulos
	def create
		#@articulos = Articulo.new(titulo:params[:articulo][:titulo], body:params[:articulo][:body])
		@articulos = current_user.articulos.new(articulo_params)
		if @articulos.save
			redirect_to @articulos
		else
			render :new
		end
	end

	

	def destroy
		#@articulos = Articulo.find(params[:id])
		@articulos.destroy
		redirect_to articulos_path
	end
	#PUT /articulos/:id
	def update
		respond_to do |format|
      if @articulos.update(articulo_params)
        format.html { redirect_to @articulos, notice: 'Articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @articulos}
      else
        format.html { render :edit }
        format.json { render json: @articulos.errors, status: :unprocessable_entity }
      end
    end
	end


	private
	def set_articulos
		@articulos = Articulo.find(params[:id])
	end
	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
	end

	def articulo_params
		params.require(:articulo).permit(:titulo,:body,:cover)
	end
end

