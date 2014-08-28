require "spec_helper"

describe PostsController do
  render_views

  context "theme :theme_b" do
    it "renders with provided theme :theme_b" do
      get :index, theme: "theme_b"

      expect(response.body).to match(/<h1>Listing posts: theme_b<\/h1>/)
    end

    it "renders with layout :theme_b" do
      get :index, theme: "theme_b"

      expect(response).to render_template("layouts/theme_b")
    end
  end

  context "theme :theme_a" do
    it "renders with provided theme :theme_a" do
      get :index, theme: "theme_a"

      expect(response.body).to match(/<h1>Listing posts: theme_a<\/h1>/)
    end

    it "renders with layout :theme_a" do
      get :index, theme: "theme_a"

      expect(response).to render_template("layouts/theme_a")
    end
  end

  context "theme :theme_c" do
    it "renders with provided theme :theme_c" do
      get :index, theme: "theme_c"

      expect(response.body).to match(/<h1>Listing posts: theme_c<\/h1>/)
    end

    it "renders with layout :theme_c" do
      get :index, theme: "theme_c"

      expect(response).to render_template("layouts/theme_c")
    end

    it "renders with partial" do
      get :index, theme: "theme_c"

      expect(response.body).to match(/Theme_C_Partial/)
    end
  end

  context "default views" do
    it "renders with default views" do
      get :new, theme: "theme_a"

      expect(response.body).to match(/<h1>New post<\/h1>/)
    end

    it "renders with layout :theme_a" do
      get :new, theme: "theme_a"

      expect(response).to render_template("layouts/application")
    end
  end
end