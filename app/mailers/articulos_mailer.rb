class ArticulosMailer < ApplicationMailer
	def new_articulo(articulo)
		@articulos = articulo

		User.all.each do |user|
			mail(to: user.email, subject: "Nuevo Articulo en blog")
		end
	end
end