  function boxid() {
    var p = Number($("#box_status").html());
    var q = Number($("#box_open_status").html());
    if(q == 2) {
      return p;
    } else {
      return q;
    }
  }
  function reward(a){
    $.ajax({
        type: "POST",
        cache: false,
        url: "reward.php",
        data: "id="+a+"&&reward="+encodeURIComponent(htmlspecialchars($("#reward"+a).val()))+"&&t=" + Math.random()
    });
  }
  function htmlspecialchars(str) {
    str = str.replace(/&/g, '&amp;');
    str = str.replace(/</g, '&lt;');
    str = str.replace(/>/g, '&gt;');
    str = str.replace(/"/g, '&quot;');
    str = str.replace(/'/g, '&#039;');
    str = str.replace(/ /g, '&nbsp;');
    str = str.replace(/\n/g, '<br>');
    return str;
  }

  function len(s) {

    var l = 0;
    var a = s.split("");
    for(var i = 0; i < a.length; i++) {
      if(a[i].charCodeAt(0) < 299) {
        l++;
      } else {
        l += 2;
      }
    }
    return l;
  }

  function scrolltop() {
    $("#box" + boxid()).animate({
      scrollTop: 0
    });
  }

  function addbox(a) { //多出一个页面！
    if(a == $("#F5").html()) {
      scrolltop();
    } else {
      $(".box").css({"overflow-x":"hidden","overflow-y":"hidden"});
      var x = Number($("#box_open_status").html()) + 1;
      var y = Number($("#box_status").html());
      var z = Number($("#box_open_status").html());
      $("#box").append("<div id='box" + x + "' class='box'></div>");
      findDimensions();
      $("#box_open_status").html(x);
      $("#F5").html(a);
      if(z == 2) {
        $("#box" + y).animate({
          left: -winWidth
        }, function() {
          $(".box").css("overflow-y", "auto");
        });
      } else {
        $("#box" + z).animate({
          left: -winWidth
        }, function() {
          $(".box").css("overflow-y", "auto");
        });
      }
      $("#box" + x).addClass("box").css({
        "top": 0,
        "left": winWidth
      }).animate({
        left: 140
      }, function() {
        $("#box" + x).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(a);
      });
    }
  }
    function addchangebox(a) { //多出一个页面！没有动画效果
    if(a == $("#F5").html()) {
      scrolltop();
    } else {
      $(".box").css({"overflow-x":"hidden","overflow-y":"hidden"});
      var x = Number($("#box_open_status").html()) + 1;
      var y = Number($("#box_status").html());
      var z = Number($("#box_open_status").html());
      $("#box").append("<div id='box" + x + "' class='box'></div>");
      findDimensions();
      $("#box_open_status").html(x);
      $("#F5").html(a);
      if(z == 2) {
        $("#box" + y).css("left", -winWidth);
      } else {
        $("#box" + z).css("left", -winWidth);
      }
      $("#box" + x).addClass("box").css({"top": 0,"left": 140}).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(a);
    }
  }

  function addListener(element, e, fn) { //监听点击的ID
    if(element.addEventListener) {
      element.addEventListener(e, fn, false);
    } else {
      element.attachEvent("on" + e, fn);
    }
  }

addListener(document,"click",function(evt){ 
  var evt = window.event?window.event:evt,target=evt.srcElement||evt.target; 
  if(target==$("#box"+boxid()+" .face")[0]){
  }else if(target==$("#box"+boxid()+" .face_open")[0]){
  }else{ 
    $("#box"+boxid()+" .face_open").hide();
  }
}) 
  
  
  function logout(a) {
    if(confirm("欢迎下次再来玩。")) {
      location.href = "http://nian.so/?re";
    }
  }



  function boxscroll(c, d) { //c是决定上滚下滚，d是加载页面
    var z = Number($("#box_open_status").html());
    if(Number($("#box_status").html()) == 1) {
      a = 1;
      b = 2;
    } else {
      a = 2;
      b = 1;
    }
    $("#box_status").html(String(b));
    if(c == 1) { //上滚
      $("#box" + a).css({
        "top": "auto",
        "bottom": 0
      }).animate({
        "bottom": 1600
      });
      $("#box" + b).css({
        "top": winHeight,
        "bottom": "auto",
        "left": 140
      });
      if(z > 2) {
        $("#box" + z).css({
          "top": "auto",
          "bottom": 0
        });
        $("#box_open_status").html("2");
        $("#box" + z).animate({
          "bottom": 1600
        }, function() {
          for(var x = 3; x <= z; x++) {
            $("#box" + x).remove();
          }
        });
      }
      $("#box" + b).css("overflow","auto").html('<img src="http://img.nian.so/images/wait.gif" class="loading">').animate({
        "top": 0
      }).load(d);
    } else if(c == 2) { //下滚
      $("#box" + a).css({
        "top": 0,
        "bottom": "auto"
      }).animate({
        "top": 1600
      });
      $("#box" + b).css({
        "bottom": winHeight,
        "top": "auto",
        "left": 140
      });
      if(z > 2) {
        $("#box_open_status").html("2");
        $("#box" + z).css({
          "top": 0,
          "bottom": "auto"
        });
        $("#box" + z).animate({
          "top": 1600
        }, function() {
          for(var x = 3; x <= z; x++) {
            $("#box" + x).remove();
          }
        });
      }
      $("#box" + b).css("overflow","auto").html('<img src="http://img.nian.so/images/wait.gif" class="loading">').animate({
        "bottom": 0
      }).load(d);
    }
  }
    function boxchange(c, d) { //c是决定上滚下滚，d是加载页面
    var z = Number($("#box_open_status").html());
    if(Number($("#box_status").html()) == 1) {
      a = 1;
      b = 2;
    } else {
      a = 2;
      b = 1;
    }
    $("#box_status").html(String(b));
    if(c == 1) { //上滚
      $("#box" + a).css({
        "top": "auto",
        "bottom": 1600
      });
      $("#box" + b).css({
        "top": winHeight,
        "bottom": "auto",
        "left": 140
      });
      if(z > 2) {
        $("#box_open_status").html("2");
        $("#box" + z).css({
          "top": "auto",
          "bottom": 1600
        });
        for(var x = 3; x <= z; x++) {
          $("#box" + x).remove();
        }
      }
      $("#box" + b).css("top","0").html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(d);
    } else if(c == 2) { //下滚
    
      $("#box" + a).css({
        "top": 1600,
        "bottom": "auto"
      });
      $("#box" + b).css({
        "bottom": winHeight,
        "top": "auto",
        "left": 140
      });
      if(z > 2) {
        $("#box_open_status").html("2");
        $("#box" + z).css({
          "top": 1600,
          "bottom": "auto"
        });
        for(var x = 3; x <= z; x++) {
          $("#box" + x).remove();
        }
      }
      $("#box" + b).css("bottom","0").html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(d);
    }
  }
  //!!

  function movebox_append(x, z, y) {
    $(".box").css({"overflow-x":"hidden","overflow-y":"hidden"});
    if(z < 3) {
      $("#box" + x).animate({
        scrollTop: 0
      }, function() {
        $(".box").css("overflow-y", "auto");
        $("#box" + x).load(y);
      });
    } else {
      $("#box" + x).animate({
        "left": "140px"
      }, function() {
        $("#box" + x).load(y);
      });
      $("#box" + z).animate({
        "left": winWidth
      }, function() {
        for(var p = 3; p <= z; p++) {
          $("#box" + p).remove();
        }
        $(".box").css("overflow-y", "auto");
        $("#box_open_status").html("2");
      });
    }
  }
  
  function changebox_append(x, z, y) {
    if(z < 3) {
      $("#box" + x).css("top","0");
        $("#box" + x).load(y);
    } else {
      $("#box" + x).css("left","140");
        $("#box" + x).load(y);
      $("#box" + z).css("left",winWidth);
      for(var p = 3; p <= z; p++) {
        $("#box" + p).remove();
      }
      $("#box_open_status").html("2");
    }
  }

  function movebox(a,b) {
    var x = Number($("#box_status").html());
    var y = Number($("#status").html());
    var z = Number($("#box_open_status").html());
    if(a == 0) { //关于
      if(y > a) {
        boxscroll(2, "about.php");
      } else if(y == a) {
        movebox_append(x, z, 'about.php');
      }
      $("#F5").html('about.php');
    }
    if(a == 1) { //梦想
      if(y > a) {
        boxscroll(2, "list.php");
      } else if(y == a) {
        movebox_append(x, z, 'list.php');
      }
      $("#F5").html('list.php');
    }
    if(a == 2) { //发现
      if(y > a) {
        boxscroll(2, "explore.php");
      } else if(y < a) {
        boxscroll(1, "explore.php");
      } else if(y == a) {
        movebox_append(x, z, 'explore.php');
      }
      $("#F5").html('explore.php');
    }
    if(a == 2.5) { //发现
      if(y > a) {
        boxscroll(2, "group.php?t="+Math.random());
      } else if(y < a) {
        boxscroll(1, "group.php?t="+Math.random());
      } else if(y == a) {
        movebox_append(x, z, "group.php?t="+Math.random());
      }
      $("#F5").html('group.php');
    }
    if(a == 3) { //账户
      $("#notice").hide();
      if(y > a) {
        boxscroll(2, 'me.php');
      } else if(y < a) {
        boxscroll(1, 'me.php');
      } else if(y == a) {
        movebox_append(x, z, 'me.php');
      }
      $("#F5").html('me.php');
    }
    if(a == 4) { //设置
      if(y < a) {
        boxscroll(1, "settings.php");
      } else if(y == a) {
        movebox_append(x, z, 'settings.php');
      }
      $("#F5").html('settings.php');
    }
    if(a == 5) { //注册
      if(y > a) {
        boxscroll(2, 'sign.php?weibo='+b);
      } else if(y < a) {
        boxscroll(1, 'sign.php?weibo='+b);
      } else if(y == a) {
        movebox_append(x, z, 'sign.php?weibo='+b);
      }
      $("#F5").html('sign.php');
    }
    if(a == 6) { //登录
      if(y > a) {
        boxscroll(2, 'login.php');
      } else if(y < a) {
        boxscroll(1, 'login.php');
      } else if(y == a) {
        movebox_append(x, z, 'login.php');
      }
      $("#F5").html('login.php');
    }
    $("#status").html(String(a));
  }
  
  function scrollbot(a,theurl,thekey){
    var b=Number(a)+1;
    var loaded=new Array();
    loaded[a]=false;
    $("#box"+boxid()).scroll(function(){
    if(!loaded[a] && $(this)[0].scrollTop +winHeight +200>= $(this)[0].scrollHeight){
      loaded[a] = true;
      $.ajax({
        type: "GET",
        cache: false,
        url: theurl,
        data: "page="+b,
        success: function(data){
          $("#box"+boxid()+" #"+thekey+"page"+a).html(data);
        }
      });
    }
  }); 
  }
  function invite(a,b){
    $("#box"+boxid()+" #fobox"+b+" .fo_load").show();
      $.ajax({
        type: "POST",
        cache: false,
        url: 'invite.php',
        data: "id="+encodeURIComponent(htmlspecialchars(a))+"&&t=" + Math.random(),
        success: function(data){
          $("#box"+boxid()+" #fobox"+b+" .button").html('已邀');
          $("#box"+boxid()+" #fobox"+b+" .fo_load").hide();
        }
      });
  }
    function changebox(a) {
    var x = Number($("#box_status").html());
    var y = Number($("#status").html());
    var z = Number($("#box_open_status").html());
    if(a == 0) { //关于
      if(y > a) {
        boxchange(2, "about.php");
      } else if(y == a) {
        changebox_append(x, z, 'about.php');
      }
      $("#F5").html('about.php');
    }
    if(a == 1) { //梦想
      if(y > a) {
        boxchange(2, "list.php");
      } else if(y == a) {
        changebox_append(x, z, 'list.php');
      }
      $("#F5").html('list.php');
    }
    if(a == 2) { //发现
      if(y > a) {
        boxchange(2, "explore.php");
      } else if(y < a) {
        boxchange(1, "explore.php");
      } else if(y == a) {
        changebox_append(x, z, 'explore.php');
      }
      $("#F5").html('explore.php');
    }
    if(a == 2.5) { //小组
      if(y > a) {
        boxchange(2, "group.php?t="+Math.random());
      } else if(y < a) {
        boxchange(1, "group.php?t="+Math.random());
      } else if(y == a) {
        changebox_append(x, z, "group.php?t="+Math.random());
      }
      $("#F5").html('group.php');
    }
    if(a == 3) { //账户
      $("#notice").hide();
      if(y > a) {
        boxchange(2, 'me.php');
      } else if(y < a) {
        boxchange(1, 'me.php');
      } else if(y == a) {
        changebox_append(x, z, 'me.php');
      }
      $("#F5").html('me.php');
    }
    if(a == 4) { //设置
      if(y < a) {
        boxchange(1, "settings.php");
      } else if(y == a) {
        changebox_append(x, z, 'settings.php');
      }
      $("#F5").html('settings.php');
    }
    if(a == 5) { //注册
      if(y > a) {
        boxchange(2, 'sign.php');
      } else if(y < a) {
        boxchange(1, 'sign.php');
      } else if(y == a) {
        changebox_append(x, z, 'sign.php');
      }
      $("#F5").html('sign.php');
    }
    if(a == 6) { //登录
      if(y > a) {
        boxchange(2, 'login.php');
      } else if(y < a) {
        boxchange(1, 'login.php');
      } else if(y == a) {
        changebox_append(x, z, 'login.php');
      }
      $("#F5").html('login.php');
    }
    $("#status").html(String(a));
  }

  //login页面的跳转

  function sign(a) {
    $("#box" + $("#box_status").html()).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load("sign.php?" + a);
  }
  //sign页面的跳转

  function login(a) {
    $("#box" + $("#box_status").html()).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load("login.php?" + a);
  }
  //注册的三个框

  function sign_submit() {
    if($("#box"+boxid()+" #checkemail").html() == '可以使用') {
      if($("#box"+boxid()+" #checkid").html() == '可以使用') {
        if($("#box"+boxid()+" #checkpw").html() == '可以使用') {
          $("#box"+boxid()+" #signsubmit_fake").hide();
          $("#box"+boxid()+" #signsubmit").show();
        } else {
          $("#box"+boxid()+" #signsubmit").hide();
          $("#box"+boxid()+" #signsubmit_fake").show();
        }
      } else {
        $("#box"+boxid()+" #signsubmit").hide();
        $("#box"+boxid()+" #signsubmit_fake").show();
      }
    } else {
      $("#box"+boxid()+" #signsubmit").hide();
      $("#box"+boxid()+" #signsubmit_fake").show();
    }
  }


  function f5() {
    var x = String($("#F5").html());
    $("#box" + boxid()).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(x);
  }

  function f4() {
  }

  function backhref() {
    var x = Number($("#box_open_status").html()) - 1;
    var y = Number($("#box_status").html());
    var z = Number($("#box_open_status").html());
    if(z == 3) {
      $(".back").html(String($("#box" + y + " .url").html()));
      $(".back").attr("href", "hello");
    } else {
      $("#F5").html(String($("#box" + x + " .url").html()));
      $(".back").attr("href", "hello");
    }
  }

  function closebox(a) { //少掉一个页面
    findDimensions();
    //if(document.referrer.split("/",3)[2]=='nian.so' || document.referrer.split("/",3)[0]=='nian.so'){
    //  history.go(-1);
    //}
    $(".box").css({"overflow-x":"hidden","overflow-y":"hidden"});
    var x = Number($("#box_open_status").html()) - 1;
    var y = Number($("#box_status").html());
    var z = Number($("#box_open_status").html());
    if(z == 3) {
      $("#box" + z).animate({
        "left": winWidth
      }, function() {
        $(this).remove();
      })
      $("#box_open_status").html(x);
      $("#box" + y).animate({
        left: 140
      }, function() {
        $(".box").css("overflow-y", "auto");
      });
      $("#F5").html(String($("#box" + y + " .url").html()));
    } else {
      $("#box" + z).animate({
        "left": winWidth
      }, function() {
        $(this).remove();
      })
      $("#box_open_status").html(x);
      $("#box" + x).animate({
        left: 140
      }, function() {
        $(".box").css("overflow-y", "auto");
      });
      $("#F5").html(String($("#box" + x + " .url").html()));
    }
  }

  function closereload(a) { //少掉一个页面
    findDimensions();
    $(".box").css({"overflow-x":"hidden","overflow-y":"hidden"});
    var x = Number($("#box_open_status").html()) - 1;
    var y = Number($("#box_status").html());
    var z = Number($("#box_open_status").html());
    if(z == 3) {
      $("#box" + z).animate({
        "left": winWidth
      }, function() {
        $(this).remove();
      })
      $("#box_open_status").html(x);
      $("#box" + y).animate({
        left: 140
      }, function() {
        $(".box").css("overflow-y", "auto");
        $("#box" + y).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(a);
      });
      $("#F5").html(a);
    } else {
      $("#box" + z).animate({
        "left": winWidth
      }, function() {
        $(this).remove();
      })
      $("#box_open_status").html(x);
      $("#box" + x).animate({
        left: 140
      }, function() {
        $(".box").css("overflow-y", "auto");
        $("#box" + x).html('<img src="http://img.nian.so/images/wait.gif" class="loading">').load(a);
      });
      $("#F5").html(a);
    }
  }

  function addthing() { //添加一个任务
    if($("#box"+boxid()+" #thing_title").val()!=''){
      if($.browser.msie){
  $("#box"+boxid()+" .wait").css("display","inline");
}else{
  $("#box"+boxid()+" .wait").css("display","inline-block");
}
    $.ajax({
      type: "POST",
      url: "add_query.php",
      data: "title=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_title").val())) + "&&content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_content").val())) +"&&img=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .dream_add_hide_img").html()))+"&&private="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .move_hide").html())) +"&&tag="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_tag").val())) + "&&t="+ Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
        closereload("list.php");
        if(msg=='achieve_1'){
          game(1);
        }
      }
    });
    }
  }
  
  function addgroup() { //添加一个任务
    if($("#box"+boxid()+" #group_title").val()!=''){
      if($.browser.msie){
      $("#box"+boxid()+" .wait").css("display","inline");
      }else{
      if($.browser.msie){
  $("#box"+boxid()+" .wait").css("display","inline");
      }else{
        if($.browser.msie){
        $("#box"+boxid()+" .wait").css("display","inline");
      }else{
        $("#box"+boxid()+" .wait").css("display","inline-block");
      }
      }
      }
    $.ajax({
      type: "POST",
      url: "group_add_query.php",
      data: "title=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_title").val())) + "&&content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_content").val()))+ "&&tag=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_tag").val())) +"&&t=" + Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
        closereload("group.php");
      }
    });
    }
  }
  
  function editdream(a) {
    if($("#box"+boxid()+" #thing_title").val()!=''){
    $.ajax({
      type: "POST",
      url: "editdream_query.php",
      data: "title=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_title").val())) + "&&content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_content").val())) +"&&img=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .dream_add_hide_img").html()))+"&&private="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .move_hide").html()))+"&&id="+a+"&&tag="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_tag").val())) +"&&t=" + Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
      movebox(1);
      }
    });
    }
  }
  function editbbs(a) { //添加一个任务
    if($("#box"+boxid()+" #group_title").val()!=''){
      if($.browser.msie){
  $("#box"+boxid()+" .wait").css("display","inline");
}else{
  $("#box"+boxid()+" .wait").css("display","inline-block");
}
    $.ajax({
      type: "POST",
      url: "editbbs_query.php",
      data: "title=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_title").val())) + "&&content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_content").val())) + "&&tag=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #group_tag").val()))+"&&id="+a+"&&t=" + Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
        closereload('group_thing.php?id='+a);
      }
    });
    }
  }

  function addstep(a) { //添加一个阶段
      if($.browser.msie){
        $("#box"+boxid()+" .wait").css("display","inline");
      }else{
        $("#box"+boxid()+" .wait").css("display","inline-block");
      }
    $.ajax({
      type: "POST",
      url: "addstep_query.php",
      data: "content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #step_content").val())) + "&&key=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .move_text").html())) + "&&img=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img").html())) + "&&img0=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img_0").html())) + "&&img1=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img_1").html())) + "&&dream=" + encodeURIComponent(htmlspecialchars(a)) + "&&t=" + Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
        closereload("thing.php?id=" + a);
        if(msg=='achieve_2'){
          game(2);
        }else if(msg=='achieve_3'){
          game(3);
        }else if(msg=='achieve_5'){
          game(5);
        }
      }
    });
  }
  function editstep(a) { //添加一个阶段
    if($.browser.msie){
  $("#box"+boxid()+" .wait").css("display","inline");
}else{
  $("#box"+boxid()+" .wait").css("display","inline-block");
}
    $.ajax({
      type: "POST",
      url: "editstep_query.php",
      data: "content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #step_content").val())) + "&&img=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img").html())) + "&&img0=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img_0").html())) + "&&img1=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .step_hide_img_1").html())) + "&&id=" + encodeURIComponent(htmlspecialchars(a)) + "&&t=" + Math.random(),
      success: function(msg) {
      $("#box"+boxid()+" .wait").css("display","none");
        closereload("thing.php?id=" + msg);
      }
    });
  }

  function addthingstaff() { //添加一个任务
    $.ajax({
      type: "POST",
      url: "addstaff_query.php",
      data: "title=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_title").val())) + "&&content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_content").val())) + "&&t=" + Math.random(),
      success: function(msg) {
        alerta("发表成功了，N/A 爱你。");
      }
    });
  }

  function addcomment(a) { //添加一个留言
    if($("#box"+boxid()+" #thing_c").val() !== '') {
      $("#box"+boxid()+" .thing_ok").hide();
      $("#box"+boxid()+" .thing_wait").show();
      $.ajax({
        type: "POST",
        url: "comment_query.php",
        data: "content=" + encodeURIComponent(htmlspecialchars($("#box" + boxid()+" #thing_c").val())) + "&&id=" + a + "&&t=" + Math.random(),
        success: function(msg) {
          $("#box"+boxid()+" #thing_c_point").after(msg);
          $("#box"+boxid()+" #thing_c").val("");
          $("#box"+boxid()+" .thing_wait").hide();
          $("#box"+boxid()+" .thing_ok").show();
          setTimeout('$("#box"+boxid()+" .thing_ok").hide();', 500);
        }
      });
    }
  }
  
  function bbscomment(a) { //添加一个留言
    if($("#box"+boxid()+" #thing_c").val() !== '') {
      $("#box"+boxid()+" .thing_ok").hide();
      $("#box"+boxid()+" .thing_wait").show();
      $.ajax({
        type: "POST",
        url: "bbs_comment_query.php",
        data: "content=" + encodeURIComponent(htmlspecialchars($("#box" + boxid()+" #thing_c").val())) + "&&id=" + a + "&&t=" + Math.random(),
        success: function(msg) {
          $("#box"+boxid()+" #thing_c_point").after(msg);
          $("#box"+boxid()+" #thing_c").val("");
          $("#box"+boxid()+" .thing_wait").hide();
          $("#box"+boxid()+" .thing_ok").show();
          setTimeout('$("#box"+boxid()+" .thing_ok").hide();', 500)
        }
      });
    }
  }

  function recomment(a, b) { //添加一个留言
    if($("#box"+boxid()+" #thing_c" + b + "  .thing_c_re_box input").val() !== '') {
      $.ajax({
        type: "POST",
        url: "comment_query.php",
        data: "content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_c" + b + "  .thing_c_re_box input").val())) + "&&id=" + a + "&&t=" + Math.random(),
        success: function(msg) {
          $("#box"+boxid()+" #thing_c" + b + " #thing_c_re_box"+b).hide();
          $("#box"+boxid()+" #thing_c" + b).css("padding-bottom", "0");
          $("#box"+boxid()+" #thing_c_point").after(msg);
          $("#box"+boxid()+" #thing_c").val("");
        }
      });
    }
  }

  function bbs_recomment(a, b) { //添加一个留言
    if($("#box"+boxid()+" #thing_c" + b + "  .thing_c_re_box input").val() !== '') {
      $.ajax({
        type: "POST",
        url: "bbs_comment_query.php",
        data: "content=" + encodeURIComponent(htmlspecialchars($("#box"+boxid()+" #thing_c" + b + "  .thing_c_re_box input").val())) + "&&id=" + a + "&&t=" + Math.random(),
        success: function(msg) {
          $("#box"+boxid()+" #thing_c" + b + " #thing_c_re_box"+b).hide();
          $("#box"+boxid()+" #thing_c" + b).css("padding-bottom", "0");
          $("#box"+boxid()+" #thing_c_point").after(msg);
          $("#box"+boxid()+" #thing_c").val("");
        }
      });
    }
  }

  function comment_re(a, b) {
    findDimensions();
    if($("#box"+boxid()+" #thing_c" + a + " .thing_c_re_box").is(":hidden")) {
      $("#box"+boxid()+" #thing_c" + a + " .thing_c_re_box").show();
      $("#box"+boxid()+" #thing_c" + a + " .thing_c_re_box .thing_c_re_input").val("@" + b + "  ").focus();
      $("#box"+boxid()+" #thing_c" + a).css("padding-bottom", "50px");
    } else {
      $("#box"+boxid()+" #thing_c" + a + " .thing_c_re_box").hide();
      $("#box"+boxid()+" #thing_c" + a).css("padding-bottom", "0");
    }
  }

  function ata(a) {
    $.ajax({
      type: "POST",
      url: "ata.php",
      data: "name=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg!==''){
        addbox('user.php?uid=' + msg);
        }else{
        alerta('没有人叫这个名字..'); 
        }
      }
    });
  }

  function step_c(a, b, c) {
    $("#box"+boxid()+" #step" + b + " .step_delete_confirm").hide();
    $("#box"+boxid()+" #step" + b + " .step_delete").hide();
    $("#cover").hide();
    if(a == 0) {
      $.ajax({
        type: "POST",
        url: "delete_step.php",
        data: "sid=" + b + "&&dream=" + c + "&&t=" + Math.random(),
        success: function(msg) {
          $("#box"+boxid()+" #step" + b).animate({
            opacity: 0
          }, function() {
            $("#box"+boxid()+" #step" + b).hide();
            $("#box"+boxid()+" #step_num").html(Number(Number($("#box"+boxid()+" #step_num").html()) - 1));
            if(Number($("#box"+boxid()+" #step_num").html()) == 0) {
              $("#out1").hide();
              $("#box"+boxid()+" .step_start").show().animate({
                opacity: 1
              });
            }
          });
        }
      });
    }
  }

  function loadmore(a, b, c, d) {
    $("#box"+boxid()+" #" + a).html("加载中");
    $.ajax({
      type: "POST",
      url: b,
      data: "id="+c+"&&page="+d+"&&t=" + Math.random(),
      success: function(msg) {
        $("#box"+boxid()+" #" + a).after(msg);
      }
    });
  }

  function delete_comment(a) {
    $.ajax({
      type: "POST",
      url: "delete_comment.php",
      data: "cid=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        $("#cover").hide();
        $("#box"+boxid()+" #thing_c" + a).animate({
          opacity: 0
        }).delay(100).hide(500);
      }
    });
  }
  function delete_bbscomment(a) {
    $.ajax({
      type: "POST",
      url: "delete_bbs_comment.php",
      data: "cid=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        $("#cover").hide();
        $("#box"+boxid()+" #thing_c" + a).animate({
          opacity: 0
        }).delay(100).hide(500);
      }
    });
  }
  
  function delete_dream(a){
    $.ajax({                   
      type: "POST",        
      url: "delete_dream.php",          
      data: "id="+a+"&&t="+Math.random(), 
      success: function(msg){
        movebox(1);
        $("#cover").hide();
      }  
    });
  }
  function delete_bbs(a){
    $.ajax({                   
      type: "POST",        
      url: "delete_bbs.php",          
      data: "id="+a+"&&t="+Math.random(), 
      success: function(msg){
        movebox(2.5);
        $("#cover").hide();
      }  
    });
  }
  function cover_delete_dream(a){
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        delete_dream(a);
      });
      $(".cover_word").html('「再见，梦想#'+a+'」');
      $("#cover_no").show();
      $("#cover").show();
  }
  function cover_delete_step(a,b){
    $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        step_c(0,a,b);
      });
      $(".cover_word").html('「再见，进展#'+a+'」');
      $("#cover_no").show();
      $("#cover").show();
  }
  function cover_delete_comment(a){
    $("#cover_no").show();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        delete_comment(a);
      });
      $(".cover_word").html('「再见，评论#'+a+'」');
      $("#cover").show();
  }
  function cover_delete_bbscomment(a){
    $("#cover_no").show();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        delete_bbscomment(a);
      });
      $(".cover_word").html('「再见，跟帖#'+a+'」');
      $("#cover").show();
  }
  function cover_delete_bbs(a){
    $("#cover_no").show();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        delete_bbs(a);
      });
      $(".cover_word").html('「再见，话题#'+a+'」');
      $("#cover").show();
  }
  function cover_delete_weibo(){
    $("#cover_no").show();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        $.ajax({
          type: "POST",
          url: "t_cancel.php",
          success: function(msg) {
            if(msg=='1'){
              $("#box"+boxid()).load("settings.php");
              $("#cover").hide();
            }
          }
        });
      });
      $(".cover_word").html('「再见，微博」');
      $("#cover").show();
  }
  function weibo(a){  
      if($.browser.msie){
        $("#box"+boxid()+" .wait").css("display","inline");
      }else{
        $("#box"+boxid()+" .wait").css("display","inline-block");
      }
      $.ajax({
        type: "POST",
        cache: false,
        url: 'invite.php',
        data: "content="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .add_des").val()))+"&&type="+a+"&&t=" + Math.random(),
        success: function(data){
          $("#box"+boxid()+" .wait").hide();
        }
      });
  }
  function cool(a) {
    $("#box"+boxid()+" #cool1").html('...');
    $.ajax({
      type: "POST",
      url: "cool_query.php",
      data: "dream=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        $("#box"+boxid()+" #cool1").hide();
        $("#box"+boxid()+" #cool2").show();
        $("#box"+boxid()+" #cool_num").html(Number(Number($("#box"+boxid()+" #cool_num").html()) + 1));
      }
    });
  }

  function game(a){
    $.ajax({
      type: "POST",
      url: "game.php",
      data: "id=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg!==""){
        $("#game").html("获得成就「"+msg+"」").animate({top:0}).delay(1500).animate({top:"-60"});
        }
      }
    });
  }

  function step_d(b) {
    $("#box"+boxid()+" #step" + b + " .step_delete").hide();
    $("#box"+boxid()+" #step" + b + " .step_delete_confirm").show();
  }

  function notice() {
    $.ajax({
      type: "POST",
      url: "notice_query.php",
      success: function(msg) {
        if(msg > 0) {
          $("#notice").html(msg).show();
          $.ajax({
            type: "POST",
            url: "cool_check.php",
            success: function(a) {
              if(a==3){
                game(7);
              }else if(a>=20){
                game(8);
              }
            }
          });
        }else{
          $("#notice").hide();
        }
      }
    });
  }

  function ulmenu(a) {
    $("#box" + boxid() + " .container").html('<img src="http://img.nian.so/images/wait.gif"">').load(a);
  }
  function ulmenua(a) {
    $("#box" + boxid() + " .container").html('<img src="http://img.nian.so/images/wait.gif"">').load(a+"?t="+Math.random());
  }


  function fo(a) {
    $.ajax({
      type: "POST",
      url: "fo.php",
      data: "uid=" + encodeURIComponent(htmlspecialchars(a)) + "&&fo=1" + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg == 'fo'){
          $("#box" + boxid() + " .user_fo").hide();
          $("#box" + boxid() + " .user_unfo").show();
        }
      }
    });
  }

  function unfo(a) {
    $.ajax({
      type: "POST",
      url: "fo.php",
      data: "uid=" + encodeURIComponent(htmlspecialchars(a)) + "&&unfo=1" + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg == 'unfo'){
        $("#box" + boxid() + " .user_unfo").hide();
        $("#box" + boxid() + " .user_fo").show();
        }
      }
    });
  }
  function fodream(a) {
    $.ajax({
      type: "POST",
      url: "fodream.php",
      data: "id=" + encodeURIComponent(htmlspecialchars(a)) + "&&fo=1" + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg == 'fo'){
        $("#box" + boxid() + " #fodream1").hide();
        $("#box" + boxid() + " #fodream2").show();
        }
      }
    });
  }

  function unfodream(a) {
    $.ajax({
      type: "POST",
      url: "fodream.php",
      data: "id=" + encodeURIComponent(htmlspecialchars(a)) + "&&unfo=1" + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg == 'unfo'){
        $("#box" + boxid() + " #fodream2").hide();
        $("#box" + boxid() + " #fodream1").show();
        }
      }
    });
  }
    function fo_find(a,b) {
    $("#box"+boxid()+" #fobox"+b+" .fo_load").show();
    $.ajax({
      type: "POST",
      url: "fo.php",
      data: "uid=" + encodeURIComponent(htmlspecialchars(a)) + "&&fo=1" + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg == 'fo'){
          $("#box"+boxid()+" #fobox"+b+" .button-blue").css("background-color","#999").html("关注中");
          $("#box"+boxid()+" #fobox"+b+" .fo_load").hide();
        }
      }
    });
  }

  function point(a, b) {
    $.ajax({
      type: "POST",
      url: "update_step.php",
      data: "sid=" + b + "&&done=" + a + "&&t=" + Math.random(),
      success: function(msg) {
        if(msg==1){
          if(a == 1) {
            $("#box"+boxid()+" #step" + b + " .step_point2").hide();
            $("#box"+boxid()+" #step" + b + " .step_point1").show();
          } else {
            $("#box"+boxid()+" #step" + b + " .step_point1").hide();
            $("#box"+boxid()+" #step" + b + " .step_point2").show();
          }
        }
      }
    });
  }

  function hashcheck(a, b) {
    if(b == 0) { //没登录
      $("#box1").load("about.php", hashcallback(a));
    } else if(b == 1) {
      $("#box1").load("list.php", hashcallback(a));
    }

    function hashcallback(a) {
      var x = a.split("/");
      if(x[1]) {
        $("#button1 li div").removeClass("selected");
        if(x[1] == 'dream') {
          if(x[2]) {
            $("#add").addClass("selected");
            addchangebox('thing.php?id=' + x[2]);
          }else{
            location.href="http://nian.so";
          }
        } else if(x[1] == 'user') {
          if(x[2]) {
            addchangebox('user.php?uid=' + x[2]);
          }
        } else if(x[1] == 'images') {
          addchangebox('img.php?img=' + x[2]);
        } else if(x[1] == 'about') {
          addchangebox('about.php');
        } else if(x[1] == 'explore') {
          changebox(2);
          $("#list").addClass("selected");
        }else if(x[1] == 'group') {
          $("#group").addClass("selected");
          if(x[2]){
            addchangebox('group_thing.php?id=' + x[2]);
          }else{
            changebox(2.5);
          }
        }else if(x[1] == 'addstep'){
          if(x[2]) {
            $("#add").addClass("selected");
            addchangebox('thing.php?id=' + x[2]);
          }else{
            location.href="http://nian.so";
          }
        }else if(x[1] == 'search'){
          addchangebox('search.php');
        }else if(x[1] == 'notice') {
          changebox(3);
          $("#me").addClass("selected");
        } else if(x[1] == 'settings') {
          changebox(4);
          $("#settings").addClass("selected");
        } else if(x[1] == 'sign'){
          if(x[2]) {
            addchangebox('sign.php?code=' + x[2]);
          }
        }else {
          location.href="http://nian.so";
        }
      }
    }
  }

  function coverhide() {
    $("#cover").hide();
  }
  function signcheck(a){
    var nickrule=/^[\u4E00-\u9FA5\w\d]+$/; 
    if(len($("#box"+boxid()+" #signid").val())<3){
      $("#box"+boxid()+" #checkid").html("昵称太短");
    }else if(len($("#box"+boxid()+" #signid").val())>30){
      $("#box"+boxid()+" #checkid").html("昵称太长");
    }else if(!nickrule.test($("#box"+boxid()+" #signid").val())){
      $("#box"+boxid()+" #checkid").html("有奇怪的字符");
    }else{
      $.ajax({                   
          type: "POST",        
          url: "sign-checkname.php",          
          data: "name="+$("#box"+boxid()+" #signid").val()+"&&t="+Math.random(), 
          success: function(msg){ 
          if(msg!=='可以使用'){
            $("#box"+boxid()+" #checkid").html(msg);
          }else{
            $("#box"+boxid()+" #checkid").html("可以使用");
            if($("#box"+boxid()+" #signemail").val().length>0){
                 $.ajax({                   
                  type: "POST",        
                  url: "sign-checkemail.php",          
                  data: "email="+$("#box"+boxid()+" #signemail").val()+"&&t="+Math.random(), 
                  success: function(msg){ 
                    if(msg!=='可以使用'){
                      $("#box"+boxid()+" #checkemail").html(msg);
                    }else{
                      $("#box"+boxid()+" #checkemail").html(msg);
                        if($("#box"+boxid()+" #signpw").val().length==0) {
                        }else if(len($("#box"+boxid()+" #signpw").val()) < 4){
                        $("#box"+boxid()+" #checkpw").html("密码太短");
                        }else{
                          a();
                        }   
                    }
                  }  
                 }); 
            }
          }
          }  
      }); 
    }
  }
  function reset(){
    if($("#login_reset").val()==''){
      alerta('邮箱是空的！');
    }else{
    if($.browser.msie){
      $("#box"+boxid()+" .wait").css("display","inline");
    }else{
      $("#box"+boxid()+" .wait").css("display","inline-block");
    }
    $.ajax({
      type: "POST",
      url: "reset_query.php",
      data: "email=" + encodeURIComponent(htmlspecialchars($("#login_reset").val())) +"&&t=" + Math.random(),
      success: function(msg) {
        $("#box"+boxid()+" .wait").hide();
        if(msg=='0'){
          alerta('发送没有成功...');    //发送失败
        }else if(msg=='1'){
          alerta('成功～快去查收邮件！');   //发送成功
        }else if(msg=='2'){
          alerta('这个邮箱没有注册过...'); //邮箱不存在
        }else{
          alerta(msg);    //出了点问题...很少见
        }
      }
    });
    }
  }
  function confirmation_pw(a){
    if($("#confirmation_pw").val()==''){
      alerta('密码是空的！');
    }else if($("#confirmation_pw").val().length<4){
      alerta('密码要长于4位！');
    }else{
    if($.browser.msie){
      $(".wait").css("display","inline");
    }else{
      $(".wait").css("display","inline-block");
    }
    $.ajax({
      type: "POST",
      url: "resetpassword_query.php",
      data: "pw=" + encodeURIComponent(htmlspecialchars(md5("n*A"+$("#confirmation_pw").val()))) +"&&confirmation="+encodeURIComponent(htmlspecialchars(a))+"&&t=" + Math.random(),
      success: function(msg) {
        $(".wait").hide();
        if(msg=='1'){
          alerta('改好了！');
          setTimeout('location.href="http://nian.so/"', 3000);
        }else{
          alerta(msg);  
        }
      }
    });
    }
  }
  function cover(a, b, c) {
    if(c == 2) {
      $("#cover_no").show();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        a;
      });
      $(".cover_word").html(b);
      $("#cover").show();
    } else {
      $("#cover_no").hide();
      $("#cover_yes").unbind();
      $("#cover_yes").bind("click",function(){
        coverhide();
      });
      $(".cover_word").html(b);
      $("#cover").show();
    }
  }
  function dream_complete(a){
    $.ajax({                   
      type: "POST",
      url: "update_dream.php",          
      data: "id="+a+"&&percent=1&&t="+Math.random(), 
      success: function(msg){
        closereload("thing.php?id=" + a);
        game(6);
      }  
    }); 
  }
  
  function dream_nocomplete(a){
    $.ajax({                   
      type: "POST",        
      url: "update_dream.php",          
      data: "id="+a+"&&percent=0&&t="+Math.random(), 
      success: function(msg){
        closereload("thing.php?id=" + a);
      }  
    }); 
  }
  
  function lab(a){
    $("#lab"+a+" .fo_load").show();
    $.ajax({                   
      type: "POST",        
      url: "lab_add.php",          
      data: "id="+a+"&&t="+Math.random(), 
      success: function(msg){
        if(msg=="1"){
          $("#lab"+a+" .button").hide();
          $("#lab_button"+a).show();
        }else if(msg=='2'){
        $("#lab"+a+" .button").html('念币不够');
        }else if(msg=='3'){
        $("#lab"+a+" .button").html('买过了！');
        }
        $("#lab"+a+" .fo_load").hide();
      }  
    }); 
  }
  
  function toge(a){
    if($("#box"+boxid()+" .toge_input").val()!==''){
    $.ajax({                   
      type: "POST",        
      url: "toge.php",          
      data: "name="+encodeURIComponent(htmlspecialchars($("#box"+boxid()+" .toge_input").val()))+"&&id="+encodeURIComponent(htmlspecialchars(a))+"&&t="+Math.random(), 
      success: function(msg){
        if(msg=='0'){
          alerta('没有人叫这个昵称...');  
        }else{
          $("#box"+boxid()+" #thing_right_a"+a).html(msg);
        }
      }  
    }); 
    }
  }
  function untoge(a){
    $.ajax({                   
      type: "POST",        
      url: "untoge.php",          
      data: "id="+encodeURIComponent(htmlspecialchars(a))+"&&t="+Math.random(), 
      success: function(msg){
        $("#box"+boxid()+" #thing_right_a"+a).html(msg);
      }  
    }); 
  }
  
  function dreamplus(a){
    var dreamplus=Number($("#box"+boxid()+" .dreamplus_l").html()); 
    dreamplus=dreamplus+1;
    $("#box"+boxid()+" .dreamplus_l").html(dreamplus);
    $.ajax({                   
      type: "POST",        
      url: "dreamplus.php",          
      data: "id="+a+"&&num="+dreamplus+"&&t="+Math.random()
    }); 
  }
  function dreamminus(a){
    var dreamminus=Number($("#box"+boxid()+" .dreamplus_l").html());  
    dreamminus=dreamminus-1;
    $("#box"+boxid()+" .dreamplus_l").html(dreamminus);
    $.ajax({                   
      type: "POST",        
      url: "dreamplus.php",          
      data: "id="+encodeURIComponent(htmlspecialchars(a))+"&&num="+dreamminus+"&&t="+Math.random()
    }); 
  }
  
  function alerta(a) {
    cover('', a, 1);
    $("input").blur();
  }
  
  function weibomove(a){
      if($("#box"+boxid()+" .move_text").html()=='同步微博'){
      $("#box"+boxid()+" .move_button").css('background-position','-27px 0');
      $("#box"+boxid()+" .move_text").html('不同步');
      }else{
      $("#box"+boxid()+" .move_button").css('background-position','1px 0');
      $("#box"+boxid()+" .move_text").html('同步微博');
      }
  }
  function labmove(a,b){
      if($("#lab_switch"+a+" .lab_hide").html()=='0'){
      $("#lab_switch"+a+" .lab_switch_button").css('background-position','-27px 0');
      $("#lab_switch"+a+" .lab_hide").html('1');
    $.ajax({                   
      type: "POST",        
      url: "lab_switch_off.php",          
      data: "id="+encodeURIComponent(htmlspecialchars(a))+"&&addons="+encodeURIComponent(htmlspecialchars(b))+"&&t="+Math.random()
    }); 
      //加一条
      }else{
      $("#lab_switch"+a+" .lab_switch_button").css('background-position','0px 0');
      $("#lab_switch"+a+" .lab_hide").html('0');
    $.ajax({                   
      type: "POST",        
      url: "lab_switch_on.php",          
      data: "id="+encodeURIComponent(htmlspecialchars(a))+"&&addons="+encodeURIComponent(htmlspecialchars(b))+"&&t="+Math.random()
    }); 
      }
  }
  function private(a){
      if($("#box"+boxid()+" .move_text").html()=='私密'){
      $("#box"+boxid()+" .move_button").css('background-position','1px 0');
      $("#box"+boxid()+" .move_text").html('公开');
      $("#box"+boxid()+" .move_hide").html('0');
      }else{
      $("#box"+boxid()+" .move_button").css('background-position','-27px 0');
      $("#box"+boxid()+" .move_text").html('私密');
      $("#box"+boxid()+" .move_hide").html('1');
      }
  }
  
  function ulclick(){
    $("#box"+boxid()+" .ulmenu li").click(function(){
      $("#box"+boxid()+" .ulmenu li").removeClass("selected");
      $(this).addClass("selected");
    })  
  }

  function findDimensions() {
    var winHeight = 0;
    var winWidth = 0;
    if(window.innerWidth) {
      winWidth = window.innerWidth;
    } else if((document.body) && (document.body.clientWidth)) {
      winWidth = document.body.clientWidth;
    }
    if(window.innerHeight) {
      winHeight = window.innerHeight;
    } else if((document.body) && (document.body.clientHeight)) {
      winHeight = document.body.clientHeight;
    }
    if(document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
      winHeight = document.documentElement.clientHeight;
      winWidth = document.documentElement.clientWidth;
    }
    $("#container1").css("height", winHeight - 195);
    $("#box"+boxid()+" .out").css("height", winHeight);
    $("#box"+boxid()+" .thing_holder").css("min-height", winHeight);
    $("#box"+boxid()+" .bbs_box").css("width", winWidth - 640);
    $(".box").css({
      "width": winWidth - 140,
      "height": winHeight
    });
    
      $("#indicator_m").hide();
      $("#indicator").show();
      $("#container1").show();
      $("#container2").show();
    
    if(winWidth<1100){    //ipad
      $("#box"+boxid()+" .thing_holder").css("width", winWidth-280);
      $("#box"+boxid()+" .step").css("width", winWidth-680);
      $("#box"+boxid()+" .step_out").css("width", winWidth-500);
      $("#box"+boxid()+" .step_start").css("width", winWidth-494);
      $("#box"+boxid()+" #thing_c").css("width", winWidth-590);
      $("#box"+boxid()+" .thing_c_re_box").css("width", winWidth-640);
      $("#box"+boxid()+" .thing_c_re_input").css("width", winWidth-735);
    }
    $("#F4").html(winWidth);
  }

  function logo() {
    location.href = "http://nian.so";
  }
  $(document).ready(function(e) {
    findDimensions();

    $("#box2").css({
      "top": winHeight
    });
    

    $("#button1 li div").click(function() {
      $("#button1 li div").removeClass("selected");
      $(this).addClass("selected");
    })

    window.onresize = findDimensions;

    notice();
    setInterval("notice()", 15000);
  });
  
  
  function face(){
    if($("#box"+boxid()+" .face_open").is(":hidden")){
      $("#box"+boxid()+" .face_open").show().load("face.php");
    }else{
      $("#box"+boxid()+" .face_open").hide(); 
    }
  }
  function c_face(a){
    if($("#box"+boxid()+" #thing_c_re_box"+a+" .thing_c_face_open").is(":hidden")){
      $("#box"+boxid()+" #thing_c_re_box"+a+" .thing_c_face_open").show().load("face_c.php?id="+a);
    }else{
      $("#box"+boxid()+" #thing_c_re_box"+a+" .thing_c_face_open").hide();  
    }
    $("#box"+boxid()+" #thing_c_re_input"+a).focus();
  }

(function($){ $.fn.extend({ insertAtCaret: function(myValue){ var $t=$(this)[0]; 
if (document.selection) { this.focus(); sel = document.selection.createRange(); sel.text = myValue; this.focus(); } 
else if($t.selectionStart || $t.selectionStart == '0') { 
var startPos = $t.selectionStart; 
var endPos = $t.selectionEnd; 
var scrollTop = $t.scrollTop; 
$t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length); this.focus(); $t.selectionStart = startPos + myValue.length; $t.selectionEnd = startPos + myValue.length; $t.scrollTop = scrollTop; }else { this.value += myValue; this.focus(); }}})})(jQuery);

  function face_img(a){
    $("#box"+boxid()+" .face_open").hide();
    $("#box"+boxid()+" #thing_c").insertAtCaret("["+a+"]");
  }
  function face_img_c(a,b){
    $("#box"+boxid()+" .thing_c_face_open").hide();
    $("#box"+boxid()+" #thing_c_re_input"+b).insertAtCaret("["+a+"]");
  }