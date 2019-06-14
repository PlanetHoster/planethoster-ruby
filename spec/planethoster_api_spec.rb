RSpec.describe PlanethosterApi do

  before do
    PlanethosterApi.configure do |config|
      config.api_user = "API_USER"
      config.api_key = "API_KEY"
    end
  end
  
  it "has a version number" do
    expect(PlanethosterApi::VERSION).not_to be nil
  end

  it "has an api user" do
    config = PlanethosterApi.configuration
    expect(config.api_user).to eq("API_USER")
  end

  it "has an api key" do
    config = PlanethosterApi.configuration
    expect(config.api_key).to eq("API_KEY")
  end

  it "initializing a domain object" do
    domain = PlanethosterApi.domain
    expect(domain.class).to eq(PlanethosterApi::Domain)
  end

  it "initializing a world object" do
    domain = PlanethosterApi.world
    expect(domain.class).to eq(PlanethosterApi::World)
  end
end
