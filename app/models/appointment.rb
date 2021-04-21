class Appointment < ApplicationRecord
  belongs_to :user

    
  def doneBool
    done ? 'Done' : 'Pending'
  end

  def doneClass
    done ? 'blueText' : 'brownText'
  end

  def dateCaption
    datetime ? datetime.strftime("%A, %B %d, %Y, %H:%M") : 'date not set'
  end
end
