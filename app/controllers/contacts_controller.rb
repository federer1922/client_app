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
    result = HTTP.post("http://localhost:3000/contacts", json:
{
        "type": params["type"],
        "name": params["name"],
        "lastname": params["lastname"],
        "mobile": params["mobile"],
        "email": params["email"],
        "phone": params["phone"],
        "website": params["website"]
    })

    redirect_to action: "index"
  end

  def delete
    result = HTTP.delete("http://localhost:3000/contacts", json: { "id": params["id"] })

    redirect_to action: "index"
  end


end