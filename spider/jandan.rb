# coding: utf-8
require_relative "util"
begin
  num = gets().to_i # page 85
  start_url = "http://jandan.net/ooxx/page-#{num}\#comments"
  while start_url != nil && !start_url.empty? do
    print "开始下载#{start_url}\n"
    content = query_url(start_url)
    num += 1
    next_url = nil
    next_url = "http://jandan.net/ooxx/page-#{num}\#comments" if num < 866

    imgs = content.scan(/<img src="(http:\/\/.*?)" \/>/)
    for img in imgs
      url = img[0];
      save_url(url,"/Users/dreamlinx/SkyDrive/kongkong/jandan/",nil)
    end

    start_url = next_url;
    #    break;
  end

end
