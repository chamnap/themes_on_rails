require "spec_helper"

describe PostsController do
  render_views

  context "theme :professional_blue" do
    it "renders with provided theme :professional_blue" do
      get :index, theme: "professional_blue"

      expect(response.body).to match(/<h1>Listing posts: professional_blue<\/h1>/)
    end

    it "renders with layout :professional_blue" do
      get :index, theme: "professional_blue"

      expect(response).to render_template("layouts/professional_blue")
    end
  end

  context "theme :basic_blue" do
    it "renders with provided theme :basic_blue" do
      get :index, theme: "basic_blue"

      expect(response.body).to match(/<h1>Listing posts: basic_blue<\/h1>/)
    end

    it "renders with layout :basic_blue" do
      get :index, theme: "basic_blue"

      expect(response).to render_template("layouts/basic_blue")
    end
  end

  context "default views" do
    it "renders with default views" do
      get :new, theme: "basic_blue"

      expect(response.body).to match(/<h1>New post<\/h1>/)
    end

    it "renders with layout :basic_blue" do
      get :new, theme: "basic_blue"

      expect(response).to render_template("layouts/application")
    end
  end
end