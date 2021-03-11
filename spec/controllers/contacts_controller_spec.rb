require "rails_helper"

describe ContactsController, type: :controller do

  it "creates person " do

    get :create,  params: { type: "person", name: "Olaf", lastname: "Lubicz", mobile: "+48500550333", email: "Olaf@lubicz.com" }
  end

  it "creates company " do

    get :create,  params: { name: "Biedronka", phone: "+4618005503", website: "https://www.biedronka.pl" }
  end
end