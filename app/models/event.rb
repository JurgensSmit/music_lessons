class Event < ActiveRecord::Base
  attr_accessible :agreed, :name, :start_time

  belongs_to :user, :dependent => :destroy
end
