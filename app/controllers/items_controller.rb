class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!
  
  def index
  end

  def new
  end

  def create
  end
  
end
