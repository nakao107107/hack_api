# frozen_string_literal: true

require 'httpclient'

class GooglesController < ActionController::Base
  def search
    @client = HTTPClient.new

    url = 'https://maps.googleapis.com/maps/api/place/textsearch/json'
    query = {
      query: params['place'],
      key: 'AIzaSyCvuYSSbkq7rSo6bRuSEsm4TOi5zeaYpF0'
    }
    header = {}

    response = @client.get(url, query, header)

    p JSON.parse(response.body)

    render json: JSON.parse(response.body)['results']
  end

  def search_restaurant
    @client = HTTPClient.new

    #夜ご飯の検索条件変更
    case params['atmosphere'].to_i
    when 1 then
      p "1 selected"
      name= "小料理屋"
    when 2 then
      p "2 selected"
      name= "イタリアン"
    when 3 then
      p "3 selected"
      name= "個室"
    when 4 then
      p "4 selected"
      name= "フランス"
    end
    


    # レストラン検索
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3'
    query = {
      keyid: '8abb69dc6062a59f5c4cf747d237256f',
      latitude: params['latitude'],
      longitude: params['longitude']
    }
    header = {}

    response = @client.get(url, query, header)

    lunch = Hash.from_xml(response.body)['response']['rest']

    # カフェ検索

    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3'
    query = {
      keyid: '8abb69dc6062a59f5c4cf747d237256f',
      latitude: params['latitude'],
      longitude: params['longitude'],
      name: 'カフェ'
    }
    header = {}

    response = @client.get(url, query, header)

    cafe = Hash.from_xml(response.body)['response']['rest']

    # 晩御飯検索

    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3'
    query = {
      keyid: '8abb69dc6062a59f5c4cf747d237256f',
      latitude: params['latitude'],
      longitude: params['longitude'],
      name: name
    }
    header = {}

    response = @client.get(url, query, header)

    p Hash.from_xml(response.body)['response']
    dinner = Hash.from_xml(response.body)['response']['rest']

    render json: {
      lunch: lunch,
      cafe: cafe,
      dinner: dinner
    }
  end
end
