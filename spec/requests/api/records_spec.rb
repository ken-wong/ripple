require 'rails_helper'

RSpec.describe "records" do
  describe "GET #records_with_month" do
    it "get records_with_month" do
      user = create(:user)
      project = create(:project)
      record = create(:record, user_id: user.id, date: Date.today, project_id: project.id)
    end
  end
end