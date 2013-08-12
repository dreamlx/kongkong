require 'rake'

desc "upload_pic_to_qiniu"
task :upload_pic_to_qiniu, [:dir_path,:server_path] => :environment do |t, args|
	if FileTest::exist?(args.dir_path)
		upload_file(args.dir_path,args.server_path)
	else
		puts "dir is not exist,please resumeload"
	end
end

def upload_file(path,server_path)
	has_upload_pic = path + "_has_upload"
	if FileTest::exist?(has_upload_pic)
		puts "has_upload_pic is exist"
	else
		Dir.mkdir("#{has_upload_pic}")
	end
	Dir.chdir("#{path}")
	photo_url = Dir.glob("*.{jpg,png}")
	for j in 0..photo_url.size-1
		photo_url[j]="#{path}/#{photo_url[j]}"
	end
	if photo_url.size > 16
		puts "multithread start is #{Time.now}"
		arr=[]
		if photo_url.size%3 == 0
			thread_size=photo_url.size/3
		else
			thread_size=photo_url.size/3+1
		end

		2.times do |i|
			arr[i] = Thread.new{
				save_photo(photo_url, i*thread_size,(i+1)*thread_size-1,server_path,has_upload_pic)
			}
		end
		arr[2] = Thread.new{
			save_photo(photo_url,2*thread_size,photo_url.size-1,server_path,has_upload_pic)
		}
		arr.each do |t|
			t.join
		end
		puts "multithread finished is #{Time.now}"
	else
		puts "singlethread start is #{Time.now}"
		save_photo(photo_url,0,photo_url.size-1,server_path,has_upload_pic)
		puts "singlethread stop is #{Time.now}"
	end
end

def save_photo(photo_url,start,finished,server_path,has_upload_pic)
	for k in start..finished
		puts "photo_url is #{photo_url[k]}"
		`curl -F "action=upload" -F "filename=@#{photo_url[k]}" '#{server_path}'`
		move_pic(photo_url[k],has_upload_pic)
	end
end

def move_pic(photo_url,has_upload_pic)
	`mv #{photo_url} #{has_upload_pic}`
end
