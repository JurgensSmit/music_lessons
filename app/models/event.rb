class Event < ActiveRecord::Base
  attr_accessible :agreed, :name, :start_time

  belongs_to :user, :dependent => :destroy

  validates :name, :start_time, :presence => true

  validates :start_time, :uniqueness => true

end
