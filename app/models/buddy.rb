class Buddy < ApplicationRecord
  require 'net/http'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :goal, presence: true

 
  def subscribe_to_list(name, email)
     connect = Faraday.new(:url => "http://us18.api.mailchimp.com/3.0/lists/38b980b4d4/members") do |faraday|
             faraday.request  :url_encoded             # form-encode POST params
             faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
             end 

      connect.headers['Content-Type'] = 'application/json'
      connect.headers['Authorization'] = "apiKey " + ENV['MAILCHIMP']
      post_params = URI.encode_www_form({ 'FNAME' => name, 'email_address' => email })
      connect.post post_params
  end 

  def get_list
    connect = Faraday.new(:url => "http://us18.api.mailchimp.com/3.0/lists/38b980b4d4/members") do |faraday|
              faraday.request  :url_encoded             # form-encode POST params
              faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
              end 

     connect.headers['Content-Type'] = 'application/json'
     connect.headers['Authorization'] = "apiKey " + ENV['MAILCHIMP']
     resp = connect.get
     content = JSON.parse(resp.body)
  end
  
end 


