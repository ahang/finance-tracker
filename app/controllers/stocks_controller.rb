class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = 'Invalid Ticker Symbol'
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'Please enter in a search string'
      redirect_to my_portfolio_path
    end
  end
end