jQuery.fn.tab = function(index, css, act) {

	var _index = index ? index : 0;

	var _tab = this;

	var _tab_title = $(this.find("#tabs_head").children());

	var _tab_content = $(this.find("#tabs_body").children());

	this.selecttab = function(n) {

		$.each(_tab_title, function(k, v) {

			if (n == k) {
				
                $(v).removeClass(css).addClass(css);
				//$(v).addClass(css);

			} else {

				$(v).removeClass(css);

			}

		});

	};

	this.selectcontent = function(n) {

		$.each(_tab_content, function(k) {

			if (k == n) {

				$(this).show();

			} else {

				$(this).hide();

			}

		});

	}

	_tab.selecttab(_index);

	_tab.selectcontent(_index);

	$.each(_tab_title, function(k, v) {

		if (act == 'mouseover') {

			$(v).mouseover(function() {

				_tab.selecttab(k);

				_tab.selectcontent(k);

			});

		} else {

			$(v).click(function() {

				_tab.selecttab(k);

				_tab.selectcontent(k);

			});

		}

	});

}

jQuery.fn.extend({
	tabs:function(index,eventName,className){//参数一:首先显示的TAB序号,从0开始;参数一:鼠标事件;参数二:显示样式
	//alert();
		this.children().each(function(i,n){
			if(i == 0){
				$(n).children().removeClass(className);
				$(n).children().each(function(j,x){
					$(x).bind(eventName,{index:j},function(event){
						$(this).parent().children().removeClass(className);
						$(this).parent().parent().children().each(function(k,y){
							if(k != event.data.index+1 && k != 0)$(this).hide();
							else $(this).show();
						});
						$(this).addClass(className);
					});
				});
				$(n).children().eq(index).addClass(className);
			}else if(i == index){
				$(n).parent().children().eq(0).nextAll().hide();
				$(n).parent().children().eq(index+1).show();
			}
		})
	}
  });