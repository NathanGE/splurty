class QuotesController < ApplicationController
  def index
    @quote = Quote.order('RANDOM()').first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] =
        '<strong>Could not save</strong> the data you entered in invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  def show
    @quote = Quote.where(id: params[:id]).first
    return render text: 'Not Found', status: :not_found if @quote.blank?
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
