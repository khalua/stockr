require 'pry'
require 'yahoofinance'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/stock' do
    @ticker = params[:ticker]

    def get_quote(ticker)
        begin
          YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
        rescue
          puts "Oh oh. Yahoo is out to lunch"
        end
    end

    @price = get_quote(@ticker)
    erb :stock


end