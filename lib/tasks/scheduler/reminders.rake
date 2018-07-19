namespace :goal_reminders do
  task :send_encouragement => :environment do
    desc 'Send reminder for encouragement for a goal'
     require 'twilio-ruby'
  
     buddies = Buddy.where(optin: true)
     new_count = Count.new
     current_quote = Quote.where(id: new_count.current_count)
     new_count.update_count


     account_sid = ENV['ACCOUNT_SID']
     auth_token = ENV['AUTH_TOKEN']
     client = Twilio::REST::Client.new(account_sid, auth_token) 
    
     buddies.each do |buddy|
       client.messages.create(from: '+17326381269', to: buddy.phone_number,
       body: current_quote.phrase + "     -HustleBuddy" 
       )
     end 

  end 
end 

quotes = ["There is only one thing that makes a dream impossible to achieve: the fear of failure.",
"Everything you’ve ever wanted is on the other side of fear.",
"Hardships often prepare ordinary people for an extraordinary destiny.",
"Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine.",
"I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear.",
"It’s not whether you get knocked down. It’s whether you get up.",
"Your true success in life begins only when you make the commitment to become excellent at what you do.",
"Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going.",
"Definiteness of purpose is the starting point of all achievement",
"Too many of us are not living our dreams because we are living our fears.",
"If you believe it will work out, you’ll see opportunities. If you believe it won’t, you will see obstacles",
"Permanence, perseverance and persistence in spite of all obstacles, discouragements, and impossibilities: It is this, that in all things distinguishes the strong soul from the weak.",
"Success means doing the best we can with what we have. Success is the doing, not the getting; in the trying, not the triumph. Success is a personal standard, reaching for the highest that is in us, becoming all that we can be.",
"If you set goals and go after them with all the determination you can muster, your gifts will take you places that will amaze you.",
"Hard times don’t create heroes. It is during the hard times when the ‘hero’ within us is revealed.",
"Believe you can and you’re halfway there.",
"Your mind is a powerful thing. When you fill it with positive thoughts, your life will start to change.",
"Start by doing what’s necessary; then do what’s possible; and suddenly you are doing the impossible.",
"I attribute my success to this: I never gave or took any excuse.",
"Whatever you hold in your mind on a consistent basis is exactly what you will experience in your life.",
" Most of the important things in the world have been accomplished by people who have kept on trying when there seemed to be no hope at all.",
"Strength does not come from physical capacity. It comes from an indomitable will.",
"Perseverance is the hard work you do after you get tired of doing the hard work you already did.",
"The future belongs to those who believe in the beauty of their dreams ",
"I am not a product of my circumstances. I am a product of my decisions.",
"Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart.",
"You’re going to go through tough times – that’s life. But I say, ‘Nothing happens to you, it happens for you.’ See the positive in negative events.",
"Character cannot be developed in ease and quiet. Only through experience of trial and suffering can the soul be strengthened, ambition inspired, and success achieved.",
"If you can tune into your purpose and really align with it, setting goals so that your vision is an expression of that purpose, then life flows much more easily.",
"Whatever the mind can conceive and believe, it can achieve. ",
"Don’t wish it were easier. Wish you were better.",
"It is during our darkest moments that we must focus to see the light.",
"It’s not about perfect. It’s about effort. And when you bring that effort every single day, that’s where transformation happens. That’s how change occurs.",
"Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do.",
"Strength doesn’t come from what you can do. It comes from overcoming the things you once thought you couldn’t.",
"Learn from the past, set vivid, detailed goals for the future, and live in the only moment of time over which you have any control: now.",
"We don’t develop courage by being happy every day. We develop it by surviving difficult times and challenging adversity.",
"Fortune always favors the brave, and never helps a man who does not help himself.",
"Go confidently in the direction of your dreams. Live the life you have imagined.",
"If you can dream it, then you can achieve it. You will get all you want in life if you help enough other people get what they want.",
"The only person you are destined to become is the person you decide to be.",
"Perfection is not attainable, but if we chase perfection we can catch excellence.",
"Life is 10% what happens to you and 90% how you react to it.",
"If you don’t like something, change it. If you can’t change it, change your attitude. ",
"You control your future, your destiny. What you think about comes about. By recording your dreams and goals on paper, you set in motion the process of becoming the person you most want to be. Put your future in good hands – your own",
"Failure will never overtake me if my determination to succeed is strong enough.",
"Inaction breeds doubt and fear. Action breeds confidence and courage. If you want to conquer fear, do not sit home and think about it. Go out and get busy.",
"Limitations live only in our minds. But if we use our imaginations, our possibilities become limitless.",
"Setting goals is the first step into turning the invisible into the visible.",
"Only those who dare to fail greatly can ever achieve greatly.",
"Remember that not getting what you want is sometimes a wonderful stroke of luck. ",
"Staying positive does not mean that things will turn out okay. Rather it is knowing that you will be okay no matter how things turn out.",
"You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face. You are able to say to yourself, ‘I lived through this horror. I can take the next thing that comes along.",
"No matter how hard times may get, always hold your head up and be strong; show them you’re not as weak as they think you are.",
"We may encounter many defeats but we must not be defeated.",
"Twenty years from now you will be more disappointed by the things you didn’t do than by the things you did.",
"Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy.",
"In order to carry a positive action we must develop here a positive vision. ",
"Your time is limited, so don’t waste it living someone else’s life.",
"Be so happy that when others look at you they become happy too.",
"Challenges are what make life interesting and overcoming them is what makes life meaningful.",
"I never dreamed about success. I worked for it.",
"You cannot afford to live in potential for the rest of your life; at some point, you have to unleash the potential and make your move.",
"It is never too late to be what you might have been.",
"There is no greater disability in society than the inability to see a person as more.",
"The best way to gain self-confidence is to do what you are afraid to do. ",
"When obstacles arise, you change your direction to reach your goal, you do not change your decision to get there.",
"The Secret of Change Is to Focus All of Your Energy, Not on Fighting the Old, But on Building the New",
"The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.",
"You will never find time for anything. If you want time you must make it.",
"The greatest danger for most of us is not that our aim is too high and we miss it, but that it is too low and we reach it.",
"The two most important days in your life are the day you are born and the day you find out why.",
"Free yourself from your past mistakes, by forgiving yourself for what you have done or went through. Every day is another chance to start over.",
"Life is not about waiting for the storm to pass but learning to dance in the rain.",
"When you know what you want, and want it bad enough, you’ll find a way to get it.",
"If you can see yourself as an artist, and you can see that your life is your own creation, then why not create the most beautiful story for yourself?",
"Challenges are what make life interesting and overcoming them is what makes life meaningful.",
"In essence, if we want to direct our lives, we must take control of our consistent actions. It’s not what we do once in a while that shapes our lives, but what we do consistently.",
"Who you spend your time with will have a great impact on what kind of life you live. Spend time with the right people.",
"Experience is the teacher of all things.",
"Success is not final; failure is not fatal: It is the courage to continue that counts.",
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


