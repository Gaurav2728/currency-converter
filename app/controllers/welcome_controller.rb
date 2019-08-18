require "uri"
require 'net/http'

class WelcomeController < ApplicationController
  before_action :authenticate_user!

  CURRENCY = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG",
              "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND",
              "BOB", "BRL", "BSD", "BTC", "BTN", "BWP", "BYN", "BYR", "BZD",
              "CAD", "CDF", "CHF", "CLF", "CLP", "CNY", "COP", "CRC", "CUC",
              "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN",
              "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS", "GIP",
              "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF",
              "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD",
              "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD",
              "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL",
              "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO",
              "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO",
              "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR",
              "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD",
              "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD",
              "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY",
              "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF",
              "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XCD", "XDR", "XOF",
              "XPF", "YER", "ZAR", "ZMK", "ZMW", "ZWL"]

  def index
    latest_rates
  end

  def historical_rates
    previous_date = Date.today - 4
    @data = []
    date_range = previous_date..Date.today
    date_range.each do |date|
      uri = URI.parse("http://data.fixer.io/api/#{date}?access_key=9a0efc9c94318de60c2e71c144681251")
      response = Net::HTTP.get(uri)
      @data << JSON.parse(response).merge(date: date)
    end
    @data
  end

  def latest_rates
    uri = URI.parse("http://data.fixer.io/api/latest?access_key=9a0efc9c94318de60c2e71c144681251")
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
  end

  def calculate
    params.permit(:from,:to,:number)
    data = latest_rates
    if params['number'].blank?
      @new_rate = "Please enter value."
    elsif !data["rates"].keys.include?(params['from']) || !data["rates"].keys.include?(params['to'])
      @new_rate = "Currency not present !"
    else
      @new_rate = data["rates"]["#{params['to']}"]
    end
  end

  def user_index
    @users = User.all.select(:avatar, :name, :email)
  end
end
