
所有api接口都用http方式访问，http头为.json
action method 没有特别说明，默认为'GET'

采用restful形式组织
返回结果为json，按照updated时间从现在到以前排序

调试工具：我是firefox，用poster

图片处理见
http://docs.qiniu.com/api/image-process.html
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

###updated:2013-6-6
#about me 获取当前登录用户帐号和余额信息 /api/losers/aboutme
    http://42.120.9.87:3020/api/losers/aboutme.json

#payment 充值 /api/orders/payment?price=num 
    action:PUT
    http://42.120.9.87:3020/api/order/payment?price=5.json

#orders 订单记录 /api/orders

###updated:2013-6-2
#girls:
## get girl list, /api/girls
    http://42.120.9.87:3020/api/girls.json

## get a girl, /api/girls/:id
    http://42.120.9.87:3020/api/girls/2.json

