require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do
  it "displays the widget" do
    assign(:event, Event.create!(:title => "Of Human Bondage"))

    render :template => "events/index.html.erb"

    expect(rendered).to match /Of Human Bondage/
  end
end