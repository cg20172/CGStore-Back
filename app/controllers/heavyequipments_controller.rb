class HeavyequipmentsController < ApplicationController

  # POST
  def create
    recibido1 = params[:parametro1]
    recibido2 = params[:parametro2]
    recibido3 = params[:parametro3]
    recibido4 = params[:parametro4]
    cotizacionId = -1
    my_array = Array.new
    cotizacion = Hash.new
    if (recibido1 == 2)
      query = "select
                 quotes.id as pedidoid,
                 features.name as nombrecampo,
                 informationquotes.value as valorcampo
               from
                 quotes, informationquotes, features, attributeproducts
               where
                 quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'  and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 19 and value like '" + recibido2.to_s + "')
               order by
                 quotes.id asc, attributeproducts.id asc"
      puts(query)
    elsif (recibido1 == 3)
      query = "select
                 quotes.id as pedidoid,
                 features.name as nombrecampo,
                 informationquotes.value as valorcampo
               from
                 quotes, informationquotes, features, attributeproducts
               where
                 quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'  and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 22 and value like '" + recibido2.to_s + "')
               order by
                 quotes.id asc, attributeproducts.id asc"
      puts(query)
    elsif (recibido1 == 4)
      query = "select
                 quotes.id as pedidoid,
                 features.name as nombrecampo,
                 informationquotes.value as valorcampo
               from
                 quotes, informationquotes, features, attributeproducts
               where
                 quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'  and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 23 and value like '" + recibido2.to_s + "')
               order by
                 quotes.id asc, attributeproducts.id asc"
    elsif (recibido1 == 5)
      query = "select
                 quotes.id as pedidoid,
                 features.name as nombrecampo,
                 informationquotes.value as valorcampo
               from
                 quotes, informationquotes, features, attributeproducts
               where
                 quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'  and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 24 and value like '" + recibido2.to_s + "')
               order by
                 quotes.id asc, attributeproducts.id asc"
    elsif (recibido1 == 6)
      if (recibido2 == 1)
        query = "select
                   quotes.id as pedidoid,
                   features.name as nombrecampo,
                   informationquotes.value as valorcampo
                 from
                   quotes, informationquotes, features, attributeproducts
                 where
                   quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 19 and value like '" + recibido3.to_s + "')
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 22 and value like '" + recibido4.to_s + "')
                 order by
                   quotes.id asc, attributeproducts.id asc"
      elsif (recibido2 == 2)
        query = "select
                   quotes.id as pedidoid,
                   features.name as nombrecampo,
                   informationquotes.value as valorcampo
                 from
                   quotes, informationquotes, features, attributeproducts
                 where
                   quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 19 and value like '" + recibido3.to_s + "')
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 23 and value like '" + recibido4.to_s + "')
                 order by
                   quotes.id asc, attributeproducts.id asc"
      else
        query = "select
                   quotes.id as pedidoid,
                   features.name as nombrecampo,
                   informationquotes.value as valorcampo
                 from
                   quotes, informationquotes, features, attributeproducts
                 where
                   quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 19 and value like '" + recibido3.to_s + "')
                   and quotes.id in (select quote_id from informationquotes where attributeproduct_id = 24 and value like '" + recibido4.to_s + "')
                 order by
                   quotes.id asc, attributeproducts.id asc"
      end
    else
      query = "select
                 quotes.id as pedidoid,
                 features.name as nombrecampo,
                 informationquotes.value as valorcampo
               from
                 quotes, informationquotes, features, attributeproducts
               where
                 quotes.id = informationquotes.quote_id and informationquotes.attributeproduct_id = attributeproducts.id and attributeproducts.feature_id = features.id and quotes.state like '0'
               order by
                 quotes.id asc, attributeproducts.id asc"
    end
    results = ActiveRecord::Base.connection.execute(query)
    if results.present?
      results.each do |row|
        if row['pedidoid'] != cotizacionId
          my_array.push(cotizacion)
          cotizacion = Hash.new
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
