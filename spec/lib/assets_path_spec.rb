require "spec_helper"

describe "Asset search paths" do
  it "includes `theme_a`: images, javascripts, stylesheets" do
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_a\/assets\/images/)
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_a\/assets\/javascripts/)
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_a\/assets\/stylesheets/)
  end

  it "includes `theme_b`: images, javascripts, stylesheets" do
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_b\/assets\/images/)
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_b\/assets\/javascripts/)
    expect(Rails.application.config.assets.paths.to_s).to match(/theme_b\/assets\/stylesheets/)
  end
end