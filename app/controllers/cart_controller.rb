class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @book = Book.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(book_id: @book.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <=0
      current_orderable.destroy
    else
      @cart.orderables.create(book: @book, quantity: quantity)
  end
  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: [turbo_stream.replace('cart',
                                                 partial: 'cart/cart',
                                                 locals: { cart: @cart })]
    end
  end
end


  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
end