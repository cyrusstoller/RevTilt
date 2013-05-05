module PagesHelper
  def bookmarklet_javascript(service = nil, new_window = nil)
    "javascript:(function(){__script=document.createElement('SCRIPT');__script.type='text/javascript';__script.src='#{bookmarklet_url(:service => service, :format => :js, :new_window => new_window)}';document.getElementsByTagName('head')[0].appendChild(__script);})();"
  end
end
