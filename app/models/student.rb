class Student < ActiveRecord::Base
  has_many :class_infos, :dependent => :destroy
  accepts_nested_attributes_for :class_infos
  
  def self.search(search)
    if search
      find(:all, :conditions => ['upper(last_name) LIKE ?', "%#{search.upcase}%"])
    else
      find(:all)
    end
  end  
    
  def validate   
    @credits = 0
    @time_range = []    
    class_infos.each do |class_info|
      temp_range = []
      credit = class_info.credits
      day = class_info.day
      start_time = class_info.start_time
      stop_time = class_info.stop_time
      temp_range = [day, start_time, stop_time]
      
      @credits = @credits + credit.to_i
      @time_range << temp_range unless temp_range.empty?
    end
    count = @time_range.size
    
    (1..count).each do |i|
      first_day = @time_range.first
      @time_range.delete_at(0)
      @time_range.each do |time|
        if time.first.include?(first_day.first) || first_day.first.include?(time.first)
          first_start_time = first_day[1]
          first_stop_time = first_day[2]
          second_start_time = time[1]
          second_stop_time = time[2]
          if (second_start_time.between?(first_start_time, first_stop_time) || second_stop_time.between?(first_start_time, first_stop_time) || first_start_time == second_start_time)
            @time_conflict = true unless (first_stop_time == second_start_time if first_start_time != second_start_time)
          end
        end
      end
    end
    max_credit = true if @credits > 17   
  
   if max_credit && @time_conflict
    errors.add_to_base "CANT REGISTER FOR MORE THAN 17 CREDITS FOR EACH SEMESTER"
    errors.add_to_base "TIME CONFLICT"
   elsif max_credit
    errors.add_to_base "CANT REGISTER FOR MORE THAN 17 CREDITS FOR EACH SEMESTER"        
   elsif @time_conflict
    errors.add_to_base "TIME CONFLICT"
   else
    return false
   end  
  end
end