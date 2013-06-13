
所有api接口都用http方式访问，http头为.json
action method 没有特别说明，默认为'GET'

采用restful形式组织
返回结果为json，按照updated时间从现在到以前排序

调试工具：我是firefox，用poster

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


#dailyposts

## post list, /api/dailyposts
    http://42.120.9.87:3020/api/dailyposts.json

## get a post, /api/dailypost/:id
    http://42.120.9.87:3020/api/dailyposts/6.json

