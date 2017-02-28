function not_pc(){
    var os = new Array("Android","iPhone","Windows Phone","iPod","BlackBerry","MeeGo","SymbianOS");  // 其他类型的移动操作系统类型，自行添加
    var info = navigator.userAgent;
    var len = os.length;
    for (var i = 0; i<len; i++) {
        if (info.indexOf(os[i]) >= 0){
            return true; 
        }
    }
    return false;
}

$(document).ready(function() {
	if(not_pc()){
		$('.pc_show').hide();
		$('#zftb_zfb').attr('src','<%=path%>/static/assets/img/aliwap.png');
		$('#zftb_wx').attr('src','<%=path%>/static/assets/img/wechatgzh.png');
		$('#zftb_yl').attr('src','<%=path%>/static/assets/img/icon-unwap.png');
	} else {
		$('.pc_hide').hide();
	}

	$('.btn-newpay').off('click').on('click',function(e){
		var register = {
			id : '${register.id}',
			zfflag : '0'
		}
		RegisterService.updateRegisterPaystatus(register,function(ret){
			if(ret)
				window.location.reload();
		});
	});

	$('.btn-deleteorder').off('click').on('click',function(e){
		var order = {id:$(this).data('id'),orderregisterid:$(this).data('orderregisterid')};
		OrderService.deleteOrder(order,function(ret){
			if(ret){
				window.location.reload();
			}
		});
	});

	$('#isAutoLogin').on('change',function(e){
		if($(this).prop('checked')){
			$('.register-adv').show();
		} else {
			$('.register-adv').hide();
		}
	});

	$('#payBtn').off('click').on('click',function(e){
		var that = this;
		var invoice = getInvoiceValue();
		var fptt = $('#fptt').val();
		var rid = '${register.id}';

		if($('input[name="invoice"]:checked').val() == '需要'){
			if(!$('input[name="invoice_chk"]:checked').val()){
				alert('请选择开票内容！');
				return;
			}
			if(!fptt){
				$('#fptt').focus().attr('placeholder','请填写发票抬头！');
				return;
			}
		}

		//先更新会员发票信息，再生成支付订单
		$(that).addClass('disabled');
		RegisterService.updateRegisterInvoice(invoice,fptt,rid,function(success){
			//如果不需要发票则不生成订单
			if(success){
				if(invoice=='不需要'){
					$(that).removeClass('disabled');
					return;
				}
				var order = {
					orderregisterid:'${register.id}',
					orderuname:'${register.nickname}',
					ordertype:$('input[name="ordertype"]:checked').val(),
					ordertitle:'会议费订单',
					orderno:'',//由后台生成
					orderstatus:0,
					ordermoney:$('input[name="ordermoney"]:checked').val(),
					orderrebackmsg:'',
					orderremark:'',
					orderaccount:''
				}

				OrderService.addOrderAndPay(order,function(ret){
					$(that).removeClass('disabled');
					if(ret.success){
						var payPage = "";
						if(order.ordertype == 1)
							payPage = "alipay.jsp?qd="+(!not_pc()?"ALI_WEB":'ALI_WAP');
						else if(order.ordertype == 2)
							payPage = "wxpay.jsp?qd="+(!not_pc()?"WX_NATIVE":'WX_JSAPI');
						else if(order.ordertype == 3)
							payPage = "ylpay.jsp?qd="+(!not_pc()?"UN_WEB":'UN_WAP');
						// window.open(payPage+'?orderno='+ret.order.orderno+'&ordermoney='+ret.order.ordermoney + '&ordertitle='+order.ordertitle);
						// window.location.reload();
						window.location.href = payPage+'&orderno='+ret.order.orderno+'&ordermoney='+order.ordermoney + '&rid='+order.orderregisterid;
					} else {
						alert('订单生成失败，请稍后重试');
						window.location.href = 'index.jsp';
					}
				});
			}
		});
	});

	function getInvoiceValue(){
		var v = $('input[name="invoice"]:checked').val();
		if(v == '需要'){
			v = [];
			$('input[name="invoice_chk"]:checked').each(function(index, chk) {
				v.push($(chk).val());
			});
			v = v.join('、');
		}
		return v||'不需要';
	}

	$('#registerBtn').off('click').on('click',function(e){
		var that = this;
		var register = {
			username:'',
			nickname:$('#nickname').val(),
			password:$('#isAutoLogin').prop('checked')?$('#password').val():'123',
			sex:$('input[name="sex"]:checked').val(),
			degree:$('#degree').val(),
			telphone:$('#telphone').val(),
			email:$('#email').val(),
			job:$('#job').val(),
			company:$('#company').val(),
			postcode:$('#postcode').val(),
			address:$('#address').val(),
			zsyq:$('input[name="zsyq"]:checked').val(),
			message:$('#message').val(),
			invoice:getInvoiceValue(),
			sfcjsx:$('input[name="sfcjsx"]:checked').val(),
			sxxl:$('input[name="sfcjsx"]:checked').val() == '参加'?$('#sxxl').val():'',
			fptt:$('#fptt').val(),
			journalname:''
		};
		if(!register.nickname){
			$('#nickname').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.degree){
			$('#degree').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.job){
			$('#job').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.email){
			$('#email').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.telphone){
			$('#telphone').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.company){
			$('#company').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.postcode){
			$('#postcode').focus().attr('placeholder','该项不能为空！');
			return;
		}
		if(!register.address){
			$('#address').focus().attr('placeholder','该项不能为空！');
			return;
		}

		if($('#isAutoLogin').prop('checked')){
			if(!register.password){
				$('#password').focus().attr('placeholder','密码不能为空！');
				return;
			}

			if(register.password != $('#repassword').val()){
				alert('两次输入密码不一致！');
				$('#repassword').focus();
				return;
			}
		}

		if($('input[name="invoice"]:checked').val() == '需要'){
			if(!$('input[name="invoice_chk"]:checked').val()){
				alert('请选择开票内容！');
				return;
			}
			if(!register.fptt){
				$('#fptt').focus().attr('placeholder','请填写发票抬头！');
				return;
			}
		}

		$(that).addClass('disabled');
		RegisterService.hasRegisterByTel(register,function(has){
			if(!has){
				RegisterService.register(register,function(msg){
					if(msg){
						alert('报名成功，请查收邮件回执!');
						$(that).removeClass('disabled');
						$('#registerForm')[0].reset();
						// if($('#isAutoLogin').prop('checked')){
							window.location.reload();
						// }
					}
				});
			} else {
				alert('该手机报名者已经存在，请不要重复报名！');
				$('#telphone').focus();
				$(that).removeClass('disabled');
			}
		});
	});
	$('input[name="invoice"]').change(function(event) {
		if($('input[name="invoice"]:checked').val()=='不需要'){
			$('.check-group').hide();
			$('.register-pay').hide();
			// $('#payBtn').prop('disabled',true);
			$('#payBtn').html('确定');
			$('#invoice_msg').html('说明：请与客服联系线下付款！');
		} else {
			$('.check-group').show();
			$('.register-pay').show();
			// $('#payBtn').prop('disabled',false);
			$('#payBtn').html('生成订单并支付');
			$('#invoice_msg').html('说明：会议费发票由北京国科智地科技有限公司开具，实习费由当地旅行社开具。');
		}
	});

	$('input[name="sfcjsx"]').change(function(event) {
		if($('input[name="sfcjsx"]:checked').val()=='不参加')
			$('.select-sxxl').hide();
		else
			$('.select-sxxl').show();
	});

	$('.btn-register').off('click').on('click',function(e){
		var target = $('#contactWrap');
		if ($(window).width() < 768) {
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
				}, 1000);
				return false;
			}
		}
		else {
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
				}, 1000);
				return false;
			}
		}
	});

	$('.btn-login').off('click').on('click',function(e){
		window.location.href = 'login.jsp';
		// 由于很多人已经在没有设置密码时期报名，暂时改为直接用手机号无需密码登录
		// window.location.href = 'loginWithoutPwd.jsp';
	});

	$('.btn-logout').off('click').on('click',function(e){
		RegisterService.logout(function(){
			// window.location.reload();
			window.location.href = 'login.jsp';
			// window.location.href = 'loginWithoutPwd.jsp';
		});
	});

	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}

		}
	});

	var hash = '${param["position"]}';
	if(hash){
		var target = $('#'+hash);
		if ($(window).width() < 768) {
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
				}, 1000);
			}
		}
		else {
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
				}, 1000);
			}
		}
	}
	
	$('#toTop').click(function() {
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});
	
	var timer;
    $(window).bind('scroll',function () {
        clearTimeout(timer);
        timer = setTimeout( refresh , 50 );
    });
    var refresh = function () {
		if ($(window).scrollTop()>100) {
			$(".tagline").fadeTo( "slow", 0 );
		}
		else {
			$(".tagline").fadeTo( "slow", 1 );
		}
    };

    // Mobile Navigation
	$('.nav').find('a').on('click', function() {
		var menuBtn = $('.navbar-toggle');
		if(menuBtn.css('display')=='block')
			$('.navbar-toggle').click();
	});
		
});