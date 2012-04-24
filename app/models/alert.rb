class Alert < ActiveRecord::Base
  attr_accessible :active, :end, :start, :url, :user
end
