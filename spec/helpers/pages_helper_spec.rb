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
describe PagesHelper, :type => :helper do
  describe "bookmarklet_javascript" do
    it "should respond_to bookmarklet_javascript" do
      expect(helper).to respond_to(:bookmarklet_javascript)
    end
    
    it "should return the a javascript string" do
      js_string = %(javascript:(function(){__script=document.createElement('SCRIPT');__script.type='text/javascript';__script.src='http://test.host/bookmarklet.js?service=yelp';document.getElementsByTagName('head')[0].appendChild(__script);})();)
      expect(helper.bookmarklet_javascript("yelp")).to eq(js_string)
    end
    
    it "should return the a javascript string with a new_window argument" do
      js_string = %(javascript:(function(){__script=document.createElement('SCRIPT');__script.type='text/javascript';__script.src='http://test.host/bookmarklet.js?new_window=true&service=yelp';document.getElementsByTagName('head')[0].appendChild(__script);})();)
      expect(helper.bookmarklet_javascript("yelp", true)).to eq(js_string)
    end
  end
end
