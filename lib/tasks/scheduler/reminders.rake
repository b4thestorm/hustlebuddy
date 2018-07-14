namespace :goal_reminders do
  task :send_encouragement => :environment do
    desc 'Send reminder for encouragement for a goal'
     require 'twilio-ruby'

   quotes = ["Success is not final; failure is not fatal: It is the courage to continue that counts.",
"It is better to fail in originality than to succeed in imitation.",
"The road to success and the road to failure are almost exactly the same.",
"Success usually comes to those who are too busy to be looking for it.",
"Opportunities don't happen. You create them.",
"Don't be afraid to give up the good to go for the great.",
"I find that the harder I work, the more luck I seem to have.",
"There are two types of people who will tell you that you cannot make a difference in this world: those who are afraid to try and those who are afraid you will succeed.",
"Successful people do what unsuccessful people are not willing to do. Don't wish it were easier; wish you were better.",
"Try not to become a man of success. Rather become a man of value.",
"Never give in except to convictions of honor and good sense.",
"Stop chasing the money and start chasing the passion.",
"Success is walking from failure to failure with no loss of enthusiasm."]

    
     buddies = Buddy.where(optin: true)

     account_sid = ENV['ACCOUNT_SID']
     auth_token = ENV['AUTH_TOKEN']
     client = Twilio::REST::Client.new(account_sid, auth_token) 
    
     buddies.each do |buddy|
       client.messages.create(from: '+17326381269', to: buddy.phone_number,
       body: quotes[rand(12)]
       )
     end 

  end 
end 

