namespace :goal_reminders do
  task :send_encouragement => :environment do
    desc 'Send reminder for encouragement for a goal'
     require 'twilio-ruby'
  
     buddies = Buddy.where(optin: true)
     new_count = Count.new
     current_quote = Quote.where(id: new_count.current_count)

     account_sid = ENV['ACCOUNT_SID']
     auth_token = ENV['AUTH_TOKEN']
     client = Twilio::REST::Client.new(account_sid, auth_token) 
    
     buddies.each do |buddy|
       client.messages.create(from: '+17326381269', to: buddy.phone_number,
       body: current_quote[0].phrase + "     -HustleBuddy" 
       )
     end
     
     new_count.update_count

  end 
end 

