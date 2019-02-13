require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do
  it "displays the widget" do
    assign(:event, Event.create!(:title => "Of Human Bondage", :start_date => DateTime.now + 9999, :duration => 50, :description => "je test tes teste tettet et tet et et ett et", :price => 90, :location => "firminy"))

    render :template => "events/index.html.erb"

    expect(rendered).to match /Of Human Bondage/
  end
end