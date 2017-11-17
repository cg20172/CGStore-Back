class AutomatizationsController < ApplicationController

  def create
    cotizacionId = -1
    my_array = Array.new
    cotizacion = Hash.new
    recibido = params[:state]
    recibido2 = params[:productid]
    query = "select
               quotes.id as pedidoid,
               quotes.date as fecha,
               attributeproducts.typeproduct_id as productoid,
               quotes.quantity as cantidad,
               concat(users.firstname,' ',users.lastname) as nombre,
               users.document as cedula,
               users.address as direccion,
               users.phone as telefono,
               users.enterprise as empresa,
               users.email as email,
               users.nit as nit,
               users.role as cargo,
               features.name as nombrecampo,
               informationquotes.value as valorcampo
             from
               users, quotes, informationquotes, features, attributeproducts, typeproducts
             where
               users.id = quotes.user_id and quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and attributeproducts.typeproduct_id = " + recibido2.to_s + " and quotes.state like '" + recibido.to_s + "'
             order by
               quotes.id asc"
    puts(query)
    results = ActiveRecord::Base.connection.execute(query)
    if results.present?
      results.each do |row|
        if row['pedidoid'] != cotizacionId
          my_array.push(cotizacion)
          cotizacion = Hash.new
          cotizacion["pedidoid"] = row['pedidoid']
          cotizacion["fecha"] = row['fecha']
          cotizacion["productoid"] = row['productoid']
          cotizacion["cantidad"] = row['cantidad']
          cotizacion["nombre"] = row['nombre']
          cotizacion["cedula"] = row['cedula']
          cotizacion["direccion"] = row['direccion']
          cotizacion["telefono"] = row['telefono']
          cotizacion["email"] = row['email']
          cotizacion["empresa"] = row['empresa']
          cotizacion["nit"] = row['nit']
          cotizacion["cargo"] = row['cargo']
          cotizacionId = row['pedidoid']
        end
        cotizacion[row['nombrecampo']] = row['valorcampo']
      end
      my_array.push(cotizacion)
      my_array.slice!(0)
      render json: my_array
    else
      render json: false
    end
  end
end
