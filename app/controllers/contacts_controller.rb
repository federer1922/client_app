class ContactsController < ApplicationController
  def index
    if params["page_token"]
      page_token = params["page_token"]
    else
      page_token = nil
    end

    connector_response = HTTP.get("http://localhost:3000/contacts", json: { page_token: page_token })

    connector_result = MultiJson.load(connector_response.body.to_s) 
    @next_page_token = connector_result["next_page_token"]
    @contacts = connector_result["data"]   
  end

  def create
    connector_response = HTTP.post("http://localhost:3000/contacts", json: { "type": params["type"], "name": params["name"], "lastname": params["lastname"], "mobile": params["mobile"], "email": params["email"], "phone": params["phone"], "website": params["website"] })

    redirect_to action: "index"
  end

  def delete
    connector_response = HTTP.delete("http://localhost:3000/contacts", json: { "id": params["id"] })

    redirect_to action: "index"
  end

  def show
    connector_response = HTTP.get("http://localhost:3000/contacts/#{params['id']}", json: { "id": params["id"] })

    result = MultiJson.load(connector_response.body.to_s) 
    
    @contact = result["data"]
  end




end