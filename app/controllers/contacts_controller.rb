class ContactsController < ApplicationController
  def index
    if params["page_token"]
      page_token = params["page_token"]
    else
      page_token = nil
    end

    result = HTTP.get("http://localhost:3000/contacts", json: { page_token: page_token })

    result_json = MultiJson.load(result.body.to_s)
    @next_page_token = result_json["next_page_token"]
    @contacts = result_json["data"]   
  end

  def create

  https://#companyname#.scoro.com/api/contacts/modify 
{
    "apiKey": "API_hash",
    "lang": "eng",
    "company_account_id": "tutorial",
    "request": {
        "name": "Testing 123",
        "lastname": "",
        "bankaccount": null,
        "birthday": "0000-00-00",
        "position": "",
        "comments": "",
        "sex": null,
        "id_code": null,
        "is_client": null,
        "is_supplier": null,
        "vatno": null
    }
}


    redirect_to action: "index"
  end
end