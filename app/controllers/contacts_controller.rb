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

    new_contact = HTTP.post("https://arek.scoro.com/api/v2/contacts/modify", json:
{
    "apiKey": "ScoroAPI_a4e5e6ad85ecdcc",
    "company_account_id": "arek",
    "request": {
        "contact_type": params["type"],
        "name": params["name"],
        "lastname": params["lastname"],
        "means_of_contact": {"mobile"=>[params["mobile"]], "email"=>[params["email"]], "phone"=>[params["phone"]], "website"=>[params["website"]]},
        "birthday": "",
        "position": "",
        "comments": "",
        "sex": "",
    }
})

    redirect_to action: "index"
  end
end