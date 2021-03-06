class ArticulosController < ApplicationController
	#before_action :validate_user, except: [:show,:index]
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_articulos, except: [:index,:new,:create]
	before_action :authenticate_editor!, only: [:new,:create,:update]
	before_action :authenticate_admin!, only: [:destroy,:publish]
	#GET /articulos
	def index
	 
	 @articulos = Articulo.paginate(page: params[:page], per_page:5).publicados.ultimos
	
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
		@articulos.categories = params[:categories]
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

	def publish
		@articulos.publish!
		redirect_to @articulos
	end


	private
	def set_articulos
		@articulos = Articulo.find(params[:id])
	end
	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
	end

	def articulo_params
		params.require(:articulo).permit(:titulo,:body,:cover,:categories)
	end
end

