require "spec_helper"

describe "Asset search paths" do
  it "includes `basic_blue`: images, javascripts, stylesheets" do
    expect(Rails.application.assets.paths.to_s).to match(/basic_blue\/assets\/images/)
    expect(Rails.application.assets.paths.to_s).to match(/basic_blue\/assets\/javascripts/)
    expect(Rails.application.assets.paths.to_s).to match(/basic_blue\/assets\/stylesheets/)
  end

  it "includes `professional_blue`: images, javascripts, stylesheets" do
    expect(Rails.application.assets.paths.to_s).to match(/professional_blue\/assets\/images/)
    expect(Rails.application.assets.paths.to_s).to match(/professional_blue\/assets\/javascripts/)
    expect(Rails.application.assets.paths.to_s).to match(/professional_blue\/assets\/stylesheets/)
  end
end