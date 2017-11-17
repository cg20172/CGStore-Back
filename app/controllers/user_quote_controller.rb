class UserQuoteController < ApplicationController
    def create
        user_id = -1
        my_array = Array.new
        cotizacion = Hash.new
        user_id = params[:user_id]
        cotizacionId = -1
        query = "select
            quotes.id as pedidoid,
            quotes.date as fecha,
            products.name as familiaproducto,
            typeproducts.name as tipoproducto,
            quotes.quantity as cantidad,
            quotes.state as estado,
            features.name as nombrecampo,
            informationquotes.value as valorcampo
        from
            users, quotes, informationquotes, features, attributeproducts, typeproducts, products
        where
            products.id = quotes.product_id and typeproducts.id = attributeproducts.typeproduct_id and users.id = '" + user_id.to_s + "' and users.id = quotes.user_id and quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id
        order by
            quotes.id asc"

        results = ActiveRecord::Base.connection.execute(query)
        if results.present?
            results.each do |row|
            if row['pedidoid'] != cotizacionId
                my_array.push(cotizacion)
                cotizacion = Hash.new
                cotizacion["pedidoid"] = row['pedidoid']
                cotizacion["fecha"] = row['fecha']
                cotizacion["familiaproducto"] = row['familiaproducto']
                cotizacion["tipoproducto"] = row['tipoproducto']
                cotizacion["cantidad"] = row['cantidad']
                cotizacion["estado"] = row['estado']
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
