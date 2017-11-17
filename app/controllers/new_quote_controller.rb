class NewQuoteController < ApplicationController
    def index
        @quotes = Quote.all
    
        render json: @quotes
    end

    def create
        new_quote = params[:new_quote]
        user_id = new_quote[:user_id]
        product_id = new_quote[:product_id]
        date = new_quote[:date]
        params = new_quote[:params]
        quote_to_send = {"date":date, "state":1,"quantity":1, "user_id": user_id, "product_id": product_id}

        @quote = Quote.new(quote_to_send);
        if @quote.save
            quote_id = @quote[:id]
            params.each do |param|
                info_to_send = {"value":params[param], "quote_id":quote_id,"attributeproduct_id":param};
                @info = Informationquote.new(info_to_send)
                if !@info.save
                    render json: @infor.errors, status: :unprocessable_entity
                    end
            end
            render json: @quote, status: :created, location: @quote
        else
            render json: @quote.errors, status: :unprocessable_entity
        end
    end
end
