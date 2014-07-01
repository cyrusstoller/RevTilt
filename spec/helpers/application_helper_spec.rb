require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper, :type => :helper do
  describe "bootstrap_alert_type" do
    it "should return 'danger' when given 'alert'" do
      expect(helper.bootstrap_alert_type("alert")).to eq("danger")
      expect(helper.bootstrap_alert_type(:alert)).to eq("danger")
    end

    it "should return 'danger' when given 'error'" do
      expect(helper.bootstrap_alert_type("error")).to eq("danger")
      expect(helper.bootstrap_alert_type(:error)).to eq("danger")
    end

    it "should return 'warning' when given 'notice'" do
      expect(helper.bootstrap_alert_type("notice")).to eq("warning")
      expect(helper.bootstrap_alert_type(:notice)).to eq("warning")
    end

    it "should return 'success' when given 'success'" do
      expect(helper.bootstrap_alert_type("success")).to eq("success")
      expect(helper.bootstrap_alert_type(:success)).to eq("success")
    end
  end
  
  describe "title_helper" do
    let(:base) { "RevTilt" }
    it "should return 'Revtilt'" do
      @title = nil
      expect(helper.title).to eq(base)
      @title = ""
      expect(helper.title).to eq(base)
    end
    
    it "should return 'RevTilt | Home'" do
      @title = "Home"
      expect(helper.title).to eq("#{base} | Home")
    end
  end
end