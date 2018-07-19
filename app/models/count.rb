class Count < ApplicationRecord

   def update_count
     new_count = Count.new 
     count = Count.last
     new_count.count = count.count + 1
     new_count.save
   end 

   def current_count 
     Count.last.count
   end
end
