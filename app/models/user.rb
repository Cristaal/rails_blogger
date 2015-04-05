class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :email, :presence => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def send_message
   begin
     response = RestClient::Request.new(
     :method => :post,
     :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
     :user => ENV['TWILIO_ACCOUNT_SID'],
     :password => ENV['TWILIO_AUTH_TOKEN'],
     :payload => { :Body => body,
       :To => to,
       :From => from }
       ).execute
     rescue
       false
     end
   end
end
