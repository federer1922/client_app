class ContactsController < ApplicationController
  def index
    page_token = 2
    result = HTTP.get("http://localhost:3000/contacts", json: { page_token: page_token })

    result_json = MultiJson.load(result.body.to_s)
    @contacts = result_json["data"]
    
  end
end