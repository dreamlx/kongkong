
所有api接口都用http方式访问，http头为.json
action method 没有特别说明，默认为'GET'

采用restful形式组织
返回结果为json，按照updated时间从现在到以前排序

调试工具：我是firefox，用poster

图片处理见
http://docs.qiniu.com/api/image-process.html

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

