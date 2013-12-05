require 'spec_helper'

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
describe ApplicationHelper do
  describe "bootstrap_alert_type" do
    it "should return 'danger' when given 'alert'" do
      helper.bootstrap_alert_type("alert").should == "danger"
      helper.bootstrap_alert_type(:alert).should == "danger"
    end

    it "should return 'danger' when given 'error'" do
      helper.bootstrap_alert_type("error").should == "danger"
      helper.bootstrap_alert_type(:error).should == "danger"
    end

    it "should return 'warning' when given 'notice'" do
      helper.bootstrap_alert_type("notice").should == "warning"
      helper.bootstrap_alert_type(:notice).should == "warning"
    end

    it "should return 'success' when given 'success'" do
      helper.bootstrap_alert_type("success").should == "success"
      helper.bootstrap_alert_type(:success).should == "success"
    end
  end
  
  describe "title_helper" do
    let(:base) { "RevTilt" }
    it "should return 'Revtilt'" do
      @title = nil
      helper.title.should == base
      @title = ""
      helper.title.should == base
    end
    
    it "should return 'RevTilt | Home'" do
      @title = "Home"
      helper.title.should == "#{base} | Home"
    end
  end
end