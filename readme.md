所有api接口都用http方式访问，http头为.json
action method 没有特别说明，默认为'GET'

采用restful形式组织
返回结果为json，按照updated时间从现在到以前排序

调试工具：我是firefox，用poster                                                       

图片处理见
http://docs.qiniu.com/api/image-process.html

##updated: 2013-09-02
## 增加rake task upload_pic_to_qiniu ，用来上传图片到qiniu
rake upload_pic_to_qiniu\["/home/xiaolong/11","http://127.0.0.1:3000/api/dailyposts.json",1,1\] 

## updated: 2013-8-08
## 增加分享接口 share api
    action:post
    curl -X POST "HTTP://127.0.0.1:3000/api/shares.json?auth_token=nWqBypyDe9deup5gFDkY" -d "id=18"
    #id为dailypost的id
    #分享的链接为 http://localhost:3000/shares/33  
    #33为share_id

## dailypost增加share_time，可以查看照片被分享的次数
## 增加查看当前用户已分享的照片列表
    action:GET
    curl -X GET "HTTP://127.0.0.1:3000/api/shares.json?auth_token=nWqBypyDe9deup5gFDkY"


##updated: 2013-7-31
## dailypost: 增加了一个node: totoal_favor
每张照片的总喜欢数

### updated: 2013-7-29
## aboutme， 获取当前帐号的基本信息，包括帐号余额
    action:GET
    curl "http://127.0.0.1:3000/api/losers/aboutme.json?auth_token=BfVsBvt5Wm6kDzftihUp"

    {"user":{"id":14,"username":null,"email":"aaa@test.com","credit":{"id":13,"created_at":"2013-07-22T23:23:55Z","balance":"0.0","start_balance":"0.0"}}}%             

## 为指定帐号创建订单并充值 create order,
    action: POST
    参数：price ，需要充值的金额
    url: credits/13 这里的13 来自aboutme api中的 credit.id
    curl -X POST "http://127.0.0.1:3000/credits/13/orders.json?auth_token=BfVsBvt5Wm6kDzftihUp&price=120&content=recharge"
    
    {"created_at":"2013-07-29T06:03:02Z","credit_id":13,"credit_quantity":"120.0","id":31,"number":"K384480586","state":"credit_owed","total":null,"updated_at":"2013-07-29T06:03:02Z"}

## 看图扣款 create order
这时候的price是负数

    curl -X POST "http://127.0.0.1:3000/credits/13/orders.json?auth_token=BfVsBvt5Wm6kDzftihUp&price=-1&content='payment:DailypostId:99'"

创建dailypost扣款订单后，需要执行 pay_it改变照片payment_state状态

### updated: 2013-7-28
pay_it 和 toggle_favor 返回的dailypost都是不完整json
访问get a post, /api/dailypost/:id可以获得完整json。
## pay_it, 支付照片cost，返回payment_state状态
    curl -X POST "http://127.0.0.1:3000/api/dailyposts/18/pay_it.json?auth_token=BfVsBvt5Wm6kDzftihUp"

    {"dailypost":{"content":"","cost":0,"created_at":"2013-06-17T03:31:17Z","girl_id":1,"id":18,"linkto":null,"photo":{"url":"http://kongkong.qiniudn.com/kongkong/dailypost/photo/18/605b98f623353d959f809322ff10c054.jpg"},"state":"published","updated_at":"2013-06-17T07:35:06Z"},"payment_state":"paid"}
## add favor action api:toggle_favor, 返回favor_state
    curl -X POST "http://127.0.0.1:3000/api/dailyposts/18/toggle_favor.json?auth_token=BfVsBvt5Wm6kDzftihUp" 
    
    {"dailypost":{"content":"","cost":0,"created_at":"2013-06-17T03:31:17Z","favor_state":"unlike","girl_id":1,"id":18,"linkto":null,"photo":{"url":"http://kongkong.qiniudn.com/kongkong/dailypost/photo/18/605b98f623353d959f809322ff10c054.jpg"},"state":"published","updated_at":"2013-06-17T07:35:06Z"},"favor_state":"unlike"}

## show dailypost api， 在dailypost中多了一个node:favor_state
    curl "http://127.0.0.1:3000/api/dailyposts/18.json?auth_token=BfVsBvt5Wm6kDzftihUp"

    {"dailypost":{"id":18,"updated_at":"2013-06-17T07:35:06Z","girl_id":1,"content":"","cost":0,"linkto":"http://kongkong.qiniudn.com/kongkong/dailypost/photo/18/605b98f623353d959f809322ff10c054.jpg","photo_url":"http://kongkong.qiniudn.com/kongkong/dailypost/photo/18/605b98f623353d959f809322ff10c054.jpg","favor_state":"unlike"}}%                                 

### updated: 2013-7-24
# token
## 获取token，参数email, password, 返回一个json格式的token字符串 
    curl -X POST "http://127.0.0.1:3000/api/tokens.json" -d "email=aaa@test.com&password=12345678"

## 注销token， api后面直接放返回的token字符串
    curl -X DELETE "http://127.0.0.1:3000/api/tokens/3hZ7vLKUA9kWMKz2ZUxA" 

## 使用token， 直接在需要访问的url后面跟参数auth_token
    curl -X GET "http://127.0.0.1:3000/api/dailyposts/my_girls.json?auth_token=3hZ7vLKUA9kWMKz2ZUxA"

### updated: 2013-7-22

# 登录登出

##注册用户：
    curl -X POST 'http://42.120.9.87:3020/api/users.json' -d 'user[email]=aaa@test.com&user[password]=12345678&user[password_confirmation]=12345678' 

或者

    http://42.120.9.87:3020/users/sign_up

## 编辑用户
    curl -X PUT 'http://42.120.9.87:3020/api/users/1.json' -d 'user[email]=aaa@test.com&user[password]=12345678&user[password_confirmation]=12345678'

## login
    http://42.120.9.87:3020/users/sign_in

## logout
    http://42.120.9.87:3020/users/sign_out


#dailyposts

## post all list, /api/dailyposts
    http://42.120.9.87:3020/api/dailyposts.json

## get a post, /api/dailypost/:id
    http://42.120.9.87:3020/api/dailyposts/6.json

## get home list
    http://42.120.9.87:3020/api/dailyposts/home.json

## get by_days
    http://42.120.9.87:3020/api/dailyposts/by_days.json

## get my girls(必须登录)
    http://42.120.9.87:3020/api/dailyposts/my_girls.json


