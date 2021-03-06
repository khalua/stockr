require 'pry'
require 'yahoofinance'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'

get '/' do
  params[:ticker].blank? ? @ticker = "AAPL" : @ticker = params[:ticker]

      begin
        @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker]
      rescue
        puts "Oh oh. Yahoo is out to lunch"
      end

    @price = @quote.lastTrade
    @name = @quote.name

    erb :stock

end