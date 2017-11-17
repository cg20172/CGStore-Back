class ConsultproductsController < ApplicationController

  def index
    query = "select products.name as producto, products.description as descripcion, typeproducts.name as tipo, features.name as caracteristica, features.typefeature as tipodato, attributeproducts.id as identificador, attributeproducts.range as rango
             from products, typeproducts, features, attributeproducts
             where products.id = typeproducts.product_id and typeproducts.id = attributeproducts.typeproduct_id and features.id = attributeproducts.feature_id"
    puts(query)
    results = ActiveRecord::Base.connection.execute(query)
    if results.present?
      render json: results
    else
      render json: false
    end
  end

  def create
    recibido1 = params[:parametro1]
    recibido2 = params[:parametro2]
    query = "select * from products"
    if (recibido1 == 1 && recibido2 == 0)
      query = "select * from products"
    end
    if (recibido1 == 2)
      query = "select * from typeproducts where product_id = " + recibido2.to_s
    end
    if (recibido1 == 3)
      query = "select attributeproducts.id, features.name, features.typefeature, attributeproducts.range from attributeproducts, features where features.id = attributeproducts.feature_id and typeproduct_id = " + recibido2.to_s
    end
    results = ActiveRecord::Base.connection.execute(query)
    if results.present?
      render json: results
    else
      render json: false
    end
  end
end
