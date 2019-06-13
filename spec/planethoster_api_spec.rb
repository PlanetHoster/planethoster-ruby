RSpec.describe PlanethosterApi do

  before do
    PlanethosterApi.configure do |config|
      config.api_key = "123"
      config.api_user = "123"
    end
  end
  
  it "has a version number" do
    expect(PlanethosterApi::VERSION).not_to be nil
  end

  it "has an api key" do
    config = PlanethosterApi.configuration
    expect(config.api_key).to eq("123")
  end

  it "has an api user" do
    config = PlanethosterApi.configuration
    expect(config.api_user).to eq("123")
  end
  
end
