class ServicesController < ApplicationController
  respond_to :js

  def index
    @services = Service.where(classification: params["classification"])
    @type = params["classification"]
  end
end
