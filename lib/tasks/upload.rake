require 'rake'


desc "upload_pic_to_qiniu"
task :upload_pic_to_qiniu, [:arg1] => :environment do |t, args|
	puts args.arg1
	if FileTest::exist?(args.arg1)
		upload_file(args.arg1)
	else
		puts "dir is not exist,please resumeload"
	end
end

def upload_file(path)
	Dir.chdir("#{path}")
	photo_url = Dir.glob("*.{jpg,png}")
	if photo_url.size > 50
		arr=[]
		if photo_url.size%50 == 0
			t = photo_url.size/50
		else
			t = photo_url.size + 1
		end
		t.times do |i|
			arr[i] = Thread.new{
				save_photo(path,photo_url,i,thread_size)
			}
		end
		arr.each do |t|
			t.join
		end
	else
		Dir.glob("*.{jpg,png}") do |f|
			dailypost = Dailypost.new
			dailypost.girl_id = 1
			dailypost.cost = 1
			dailypost.photo = File.open("#{path}/"+"#{f}")
			dailypost.save!
		end
	end
end

def save_photo(path,photo_url,i,size)
	for k in i*size..((i+1)*size-1)
		dailypost = Dailypost.new
		dailypost.girl_id = 1
		dailypost.cost = 1
		dailypost.photo = File.open("#{path}/"+"#{photo_url[k]}")
		dailypost.save!
	end
end
