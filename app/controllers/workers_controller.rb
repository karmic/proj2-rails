# app/controllers/workers_controller.rb
class WorkersController < ApplicationController
  def index
    @workers = Worker.all
    # new lines
    respond_to do |format|
      format.html { render :html => @workers }
      format.json { render :json => @workers }
    end
    # new lines ends
<<<<<<< HEAD
  end
=======

  def createWorker
    nm = params[:name]
    um = params[:username]
    pwd = params[:password]
    dpt = params[:department]
    @worker = Worker.new(:name => nm,:username => um;:password => pwd;:department => dpt)
    @worker.save
  end

  def newWorker
  end

  def deleteWorker
    id = params[:worker_id]
    @worker = Worker.find_by_id(id)
    if @worker.delete
    redirect_to :controller => "workers",:action =>"selectWorker"
  end

  def editWorker
    id = params[:worker_id]
    @worker = Worker.find_by_id(id)
  end

  def updateWorker
    id = params[:worker_id].to_i
    nm = params[:name]
    um = params[:username]
    pwd = params[:password]
    dpt = params[:department]
    Worker.update(id,{:name => nm, :username => um, :password => pwd, :department => dpt})
    redirect_to :controller => "workers",:action => "index"
  end

>>>>>>> f4ea481fc892138b6368a065703e1023ef648690
  def login
    if params[:username] == nil
      username = password = ""
    else
      username = params[:username]
      password = params[:password]
    end
    conn = ActiveRecord::Base.connection
    idString = conn.select_value("select get_id('" +
      username + "','" + password + "')")
    id = idString.to_i
    cookies.signed[:id] = id
    if id == 1
      redirect_to :controller => "workers", 
        :action => "admin"
    elsif id > 1
      redirect_to :controller => "workshops", :action => "index"
    end 
  end
<<<<<<< HEAD
=======

>>>>>>> f4ea481fc892138b6368a065703e1023ef648690
  def logout
    cookies.signed[:id] = nil;
    redirect_to :controller => "workshops", :action => "summary"
  end
end
