require 'rails_helper'

RSpec.describe "records" do
  describe "GET #records_with_month" do
    it "get list_with_month" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},nickname=#{user.nickname}")
      }
      project = create(:project)
      record = create(:record, user_id: user.id, date: Date.today, project_id: project.id)

      get "/api/records/list_with_month", {month: Date.today.to_s(:month_and_year)}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)

      expect(json.count).to eq 1
      expect(json.first["date"]).to eq record.date.to_s
      expect(json.first["projects"]).to eq [project.name]
    end

    it "failed to get list_with_month: wrong month" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},nickname=#{user.nickname}")
      }
      project = create(:project)
      record = create(:record, user_id: user.id, date: Date.today, project_id: project.id)

      get "/api/records/list_with_month", {month: Date.today.to_s(:month_and_year).succ}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)

      expect(json.count).to eq 0
    end

    it "get list_with_month without month" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},nickname=#{user.nickname}")
      }
      project = create(:project)
      record = create(:record, user_id: user.id, date: Date.today, project_id: project.id)

      get "/api/records/list_with_month", {}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)

      expect(json.count).to eq 1
      expect(json.first["date"]).to eq record.date.to_s
      expect(json.first["projects"]).to eq [project.name]
    end
  end

  describe "POST #create" do
    it "add a record" do
      Record.delete_all
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},nickname=#{user.nickname}")
      }

      project = create(:project)
      post "/api/records", {project_ids: ["#{project.id}"], date: Date.today}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(Record.count).to eq 1
      record = Record.first
      expect(record.project_id).to eq project.id
      expect(record.user_id).to eq user.id
    end
  end
end