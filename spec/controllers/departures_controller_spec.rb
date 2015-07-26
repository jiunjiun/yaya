require 'spec_helper'

describe DeparturesController do

  describe "GET 'today'" do
    it "returns http success" do
      get 'today'
      response.should be_success
    end
  end

  describe "GET 'tomorrow'" do
    it "returns http success" do
      get 'tomorrow'
      response.should be_success
    end
  end

end
