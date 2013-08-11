require 'rake'

desc "upload_pic_to_qiniu"
task :upload_pic_to_qiniu, [:arg1] => :environment do |t, args|
	if FileTest::exist?(args.arg1)
		upload_file(args.arg1)
	else
		puts "dir is not exist,please resumeload"
	end
end

def upload_file(path)
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
				save_photo(photo_url, i*thread_size,(i+1)*thread_size-1)
			}
		end
		arr[2] = Thread.new{
			save_photo(photo_url,2*thread_size,photo_url.size-1)
		}
		arr.each do |t|
			t.join
		end
		puts "multithread finished is #{Time.now}"
	else
		puts "singlethread start is #{Time.now}"
		save_photo(photo_url,0,photo_url.size-1)
		puts "singlethread stop is #{Time.now}"
	end
end

def save_photo(photo_url,start,finished)
	for k in start..finished
		dailypost = Dailypost.new
		dailypost.girl_id = 1
		dailypost.cost = 1
		dailypost.photo = File.open("#{photo_url[k]}")
		dailypost.save!
		puts dailypost.photo.url
	end
end
