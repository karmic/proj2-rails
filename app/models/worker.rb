# app/models/worker.rb
class Worker < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name, :username, :password, :department
  has_many :worker_workshop, :dependent => :delete_all
=======
>>>>>>> f4ea481fc892138b6368a065703e1023ef648690
end
