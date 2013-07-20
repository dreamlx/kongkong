# coding: utf-8
require 'net/http'
def query_url(url)
  return Net::HTTP.get(URI.parse(url));
end

def save_url(url,dir,filename)
  begin
  filename = url[url.rindex('/')+1, url.length-1] if filename == nil || filename.empty?
  require 'open-uri'
  Dir.mkdir("#{dir}") if dir != nil && !dir.empty? && !FileTest.exist?(dir)
  print "#{url}\n"
  open(url) do |fin|
    if true
      File.new("#{dir}#{filename}","wb").close
      open("#{dir}#{filename}","wb") do |fout|
        while buf = fin.read(1024) do
          fout.write buf
          STDOUT.flush
        end
      end
    end
  end
  rescue 
    puts "unknow"
  end
end