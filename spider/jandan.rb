# coding: utf-8
require_relative "util"
begin
  puts "give a num:"
  num = gets().to_i 
  #start_url = "http://jandan.net/ooxx/page-#{num}\#comments"
  start_url = "http://pic.kdslife.com/list_70_0___#{num}.html"
  while start_url != nil && !start_url.empty? do
    print "开始下载#{start_url}\n"
    content = query_url(start_url)
    num += 1
    next_url = nil
    next_url = "http://pic.kdslife.com/list_70_0___#{num}.html" if num < 70

    imgs = content.scan(/<img src="(http:\/\/.*?)" \/>/)
    for img in imgs
      url = img[0];
      save_url(url,"/Users/dreamlinx/SkyDrive/kongkong/kds/",nil)
    end

    start_url = next_url;
    #    break;
  end

end
