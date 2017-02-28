/*
 * =============================================================
 * bootstrap-combobox.js v1.1.6
 * ============================================================= Copyright 2012
 * Daniel Farrell
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License. ============================================================
 */

!function($) {

	"use strict";

	/*
	 * COMBOBOX PUBLIC CLASS DEFINITION ================================
	 */

	var Combobox = function(element, options) {
		this.options = $.extend({}, $.fn.combobox.defaults, options);
		this.mode = this.options.mode;
		this.$source = $(element);
		this.$container = this.setup();
		this.$element = this.$container.find('input[type=text]');
		this.$target = this.$container.find('input[type=hidden]');
		this.$button = this.$container.find('.dropdown-toggle');
		this.$menu = $(this.options.menu).appendTo('body');
		this.template = this.options.template || this.template;
		this.matcher = this.options.matcher || this.matcher;
		this.sorter = this.options.sorter || this.sorter;
		this.highlighter = this.options.highlighter || this.highlighter;
		this.shown = false;
		this.selected = false;
		this.append=false;
		this.refresh();
		this.transferAttributes();
		this.listen();
		this.$source.removeAttr('name');
		//设置默认的查询规则
		var displayField = 'name';
		if(this.options.fieldConfig){
			displayField = this.options.fieldConfig.display||displayField;
			this.options.Qname='filter_LIKES_'+displayField;
		}else{
			this.options.Qname='filter_LIKES_name';
		}
	};

	Combobox.prototype = {
		constructor : Combobox,
		setup : function() {
			var combobox = $(this.template());
			this.$source.before(combobox);
			this.$source.hide();
			return combobox;
		},
		disable : function() {
			this.$element.prop('disabled', true);
			this.$button.attr('disabled', true);
			this.disabled = true;
			this.$container.addClass('combobox-disabled');
		},
		enable : function() {
			this.$element.prop('disabled', false);
			this.$button.attr('disabled', false);
			this.disabled = false;
			this.$container.removeClass('combobox-disabled');
		},
		parse : function() {
			var that = this, map = {}, source = [], selected = false, selectedValue = '';
			this.$source.find('option').each(function() {
						var option = $(this);
						if (option.val() === '') {
							that.options.placeholder = option.text();
							return;
						}
						map[option.text()] = option.val();
						source.push(option.text());
						if (option.prop('selected')) {
							selected = option.text();
							selectedValue = option.val();
						}
					});
			this.map = map;
			if (selected) {
				this.$element.val(selected);
				this.$target.val(selectedValue);
//				this.$container.addClass('combobox-selected');
				this.selected = true;
			}
			return source;
		},
		transferAttributes : function() {
			this.options.placeholder = this.$source.attr('data-placeholder') || this.options.placeholder;
			this.$element.attr('placeholder', this.options.placeholder);
			this.$target.prop('name', this.$source.prop('name'));
			this.$target.val(this.$source.val());
			this.$source.removeAttr('name'); // Remove from source otherwise form
											// will pass parameter twice.
			this.$element.attr('required', this.$source.attr('required'));
			this.$element.attr('rel', this.$source.attr('rel'));
			this.$element.attr('title', this.$source.attr('title'));
			this.$element.attr('class', this.$source.attr('class'));
			this.$element.attr('tabindex', this.$source.attr('tabindex'));
			this.$source.removeAttr('tabindex');
			if (this.$source.attr('disabled') !== undefined)
				this.disable();
		},
		select : function() {
			var val = this.$menu.find('.active').attr('data-value');
			if(val===""){
				this.setNull();
//				this.$target.trigger('change');
				this.triggerChange();
			}else{
				this.$element.val(this.updater(val)).trigger('change');
				this.$target.val(this.map[val]).trigger('change');
				this.$source.val(this.map[val]).trigger('change');
//				this.$container.addClass('combobox-selected');
				this.selected = true;
				var validField=this.$element.attr('data-bv-field');
				if(validField)this.$element.parents('form').data('bootstrapValidator').updateStatus(validField,'VALID','notEmpty');
			}
			return this.hide();
		},
		updater : function(item) {
			return item;
		},
		show : function() {
			var pos = $.extend({}, this.$element.position(), {height : this.$element[0].offsetHeight});

			this.$menu.insertAfter(this.$element).css({
						top : pos.top + pos.height,
						left : pos.left
					}).show();

			this.shown = true;
			return this;
		},
		hide : function() {
			this.$menu.hide();
			this.shown = false;
			return this;
		},
		lookup : function(event) {
			if(this.options['params']){
				this.options.params['start']=0;
			}
			var that = this;
			this.query = this.$element.val();
			if (this.query.length < this.options.minChars)//最少字符开始查询
				return;
			if (this.mode == 'remote'){
				var reload = true;
				if(this.$comboData){
					that.$source.html('');
					that.$source.append($('<option value="" selected="selected">请选择</option>'));
					var hiddenField = 'id',displayField = 'name';
					if(that.options.fieldConfig){
						hiddenField = that.options.fieldConfig.hidden||hiddenField;
						displayField = that.options.fieldConfig.display||displayField;
					}
					$.each(this.$comboData, function(i, item) {
						var op ="";
						if(that.options.fieldConfig){
							op = $('<option value="' + item[hiddenField] + '">' + item[displayField] + '</option>');
						}else{
							op = $('<option value="' + item.id + '">' + item.name + '</option>');
						}
						if(item[displayField]==that.query){
							op.prop('selected','selected');
							reload = false;
						}
						that.$source.append(op);
					});
				}
				this.options.params[this.options.Qname] = this.query;
				if(reload){
					this.loadData();
				}
				this.refresh();
			}
			return this.process(this.source);
		},
		lookup2 : function(event) {
			if(this.options['params']){
				this.options.params['start']=0;
			}
			if(!event)this.query = this.$element.val();
			else this.query="";
			if (this.mode == 'remote'){
				this.options.params[this.options.Qname] = this.query;
				this.loadData();
				this.refresh();
			}
			return this.process(this.source);
		},
		process : function(items) {
			var that = this;

			items = $.grep(items, function(item) {
						return that.matcher(item);
					});

			items = this.sorter(items);

			if (!items.length) {
				return this.shown ? this.hide() : this;
			}

			return this.render(items.slice(0, this.options.items)).show();
		},
		process2 : function(items) {
			var that = this;

			items = $.grep(items, function(item) {
						return that.matcher(item);
					});

			items = this.sorter(items);

			if (!items.length) {
				return this.shown ? this.hide() : this;
			}

			return this.render(items.slice(0, this.options.items));
		},
		template : function() {
			var rValid='';
			if(this.$source.attr('required')){
				rValid='data-bv-field="combox_'+this.$source.attr('name')+'" data-bv-feedbackicons="false" ';
			}
			if (this.options.bsVersion == '2') {
				return '<div class="combobox-container" style="width:'
						+ (this.options.width || 100)
						+ 'px;"><input type="hidden" /> <div class="input-append"> <input style="height:30px;" type="text" autocomplete="off" '+rValid+' /> <span style="height:30px;" class="add-on dropdown-toggle" data-dropdown="dropdown"> <span class="caret"/> <i style="height:10px;" class="icon-remove"/> </span> </div> </div>'
			} else {
				return '<div class="combobox-container" style="width:'
						+ (this.options.width || 100)
						+ 'px;"><input type="hidden" /> <div  class="input-group"> <input style="height:30px;line-height:1;" type="text" '+rValid+' autocomplete="off" /> <span style="height:30px;" class="input-group-addon dropdown-toggle" data-dropdown="dropdown"> <span class="caret" /> <span style="height:10px;" class="glyphicon glyphicon-remove" /> </span> </div> </div>'
			}
		},
		matcher : function(item) {
			return ~item.toLowerCase().indexOf(this.query.toLowerCase());
		},
		sorter : function(items) {
			var beginswith = [], caseSensitive = [], caseInsensitive = [], item;

			while (item = items.shift()) {
				if (!item.toLowerCase().indexOf(this.query.toLowerCase())) {
					beginswith.push(item);
				} else if (~item.indexOf(this.query)) {
					caseSensitive.push(item);
				} else {
					caseInsensitive.push(item);
				}
			}
			return beginswith.concat(caseSensitive, caseInsensitive);
		},
		highlighter : function(item) {
			var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,'\\$&');
			return item.replace(new RegExp('(' + query + ')', 'ig'), function($1, match) {
						return '<strong>' + match + '</strong>';
					});
		},
		render : function(items) {
			var that = this;

			items = $(items).map(function(i, item) {
						i = $(that.options.item).attr('data-value', item);
						i.find('a').html(that.highlighter(item));
						return i[0];
					});

			items.first().addClass('active');
			this.$menu.html(items);
			return this;
		},
		next : function(event) {
			var active = this.$menu.find('.active').removeClass('active'), next = active.next();

			if (!next.length) {
				next = $(this.$menu.find('li')[0]);
			}

			next.addClass('active');
		},
		prev : function(event) {
			var active = this.$menu.find('.active').removeClass('active'), prev = active.prev();

			if (!prev.length) {
				prev = this.$menu.find('li').last();
			}

			prev.addClass('active');
		},
		toggle : function() {
			if (!this.disabled) {
//				if (this.$container.hasClass('combobox-selected')) {
//					this.clearTarget();
//					this.triggerChange();
//					this.clearElement();
//					var validField=this.$element.attr('data-bv-field');
//					if(validField)this.$element.parents('form').data('bootstrapValidator').resetField(validField,true);
//				} else {
					if (this.shown) {
						this.hide();
					} else {
//						this.clearTarget();
//						this.triggerChange();
//						this.clearElement();
//						var validField=this.$element.attr('data-bv-field');
//						if(validField)this.$element.parents('form').data('bootstrapValidator').resetField(validField,true);
						this.$element.focus();
						this.lookup2(true);
						this.$menu.prepend('<li data-value=""><a href="#"><i>'+(this.options.firstDetail || '请选择')+'</i></a></li>');
					}
//				}
			}
		},
		clearElement : function() {
			this.$element.val('').focus();
		},
		clearTarget : function() {
			this.$source.val('');
			this.$target.val('');
//			this.$container.removeClass('combobox-selected');
			this.selected = false;
			if(this.$element.val()==''){
				var validField=this.$element.attr('data-bv-field');
				if(validField)this.$element.parents('form').data('bootstrapValidator').resetField(validField,true);
			}
		},
		triggerChange : function() {
			this.$source.trigger('change');
		},
		refresh : function() {
			this.source = this.parse();
			this.options.items = this.source.length;
		},
		loadData : function(obj) {
			var that = this;
			$.ajax({
				url : that.options.url,
				data : that.options.params,
				async : false,
				contentType:'application/x-www-form-urlencoded',
				dataType : 'json',
				type : 'post',
				success : function(json) {
					if(json.totalCount>that.options.params['limit']){
						that.append=true;
					}else{
						that.append=false;
					}
					that.$comboData = json.result;
					that.$source.html('');
					that.$source.append($('<option value="" selected="selected">请选择</option>'));
					$.each(json.result, function(i, item) {
								var hiddenField = 'id',displayField = 'name';
								if(that.options.fieldConfig){
									hiddenField = that.options.fieldConfig.hidden||hiddenField;
									displayField = that.options.fieldConfig.display||displayField;
								}
								var op = $('<option value="' + item[hiddenField] + '">' + item[displayField] + '</option>');
								if(obj&&obj.selected){
									op.prop('selected','selected');
								}
								that.$source.append(op);
							});
				}
			});
		},
		appendData: function() {
			var that = this;
			that.options.params.start=that.options.params.start+that.options.params.limit;
			$.ajax({
				url : that.options.url,
				data : that.options.params,
				async : false,
				contentType:'application/x-www-form-urlencoded',
				dataType : 'json',
				type : 'post',
				success : function(json) {
					if(json.totalCount>(that.options.params.limit+that.options.params.start)){
						that.append=true;
					}else{
						that.append=false;
					}
					$.each(json.result, function(i, item) {
						that.$comboData.push(item);
						var hiddenField = 'id',displayField = 'name';
						if(that.options.fieldConfig){
							hiddenField = that.options.fieldConfig.hidden||hiddenField;
							displayField = that.options.fieldConfig.display||displayField;
						}
						var op = $('<option value="' + item[hiddenField] + '">' + item[displayField] + '</option>');
						that.$source.append(op);
					});
				}
			});
		},
		listen : function() {
			this.$element.on('focus', $.proxy(this.focus, this)).on('blur',
					$.proxy(this.blur, this)).on('keypress',
					$.proxy(this.keypress, this)).on('keyup',
					$.proxy(this.keyup, this));

			if (this.eventSupported('keydown')) {
				this.$element.on('keydown', $.proxy(this.keydown, this));
			}

			this.$menu.on('click', $.proxy(this.click, this)).on('mouseenter',
					'li', $.proxy(this.mouseenter, this)).on('mouseleave',
					'li', $.proxy(this.mouseleave, this)).on('scroll',$.proxy(this.scroll, this));

			this.$button.on('click', $.proxy(this.toggle, this));
//			$(document).not(this.$menu).not(this.$element).not(this.$button).on('click', $.proxy(this.dclick, this));
		},		
		eventSupported : function(eventName) {
			var isSupported = eventName in this.$element;
			if (!isSupported) {
				this.$element.setAttribute(eventName, 'return;');
				isSupported = typeof this.$element[eventName] === 'function';
			}
			return isSupported;
		},
		move : function(e) {
			if (!this.shown) {
				return;
			}

			switch (e.keyCode) {
				case 9 : // tab
				case 13 : // enter
				case 27 : // escape
					e.preventDefault();
					break;

				case 38 : // up arrow
					e.preventDefault();
					this.prev();
					break;

				case 40 : // down arrow
					e.preventDefault();
					this.next();
					break;
			}

			e.stopPropagation();
		},
		keydown : function(e) {
			this.suppressKeyPressRepeat = ~$.inArray(e.keyCode, [40, 38, 9, 13,27]);
			this.move(e);
		},
		keypress : function(e) {
			if (this.suppressKeyPressRepeat) {
				return;
			}
			this.move(e);
		},
		keyup : function(e) {
			switch (e.keyCode) {
				case 40 : // down arrow
				case 39 : // right arrow
				case 38 : // up arrow
				case 37 : // left arrow
				case 36 : // home
				case 35 : // end
				case 16 : // shift
				case 17 : // ctrl
				case 18 : // alt
//				case 8 : // backspace
					break;

				case 9 : // tab
				case 13 : // enter
					if (!this.shown) {
						return;
					}
					this.select();
					break;

				case 27 : // escape
					if (!this.shown) {
						return;
					}
					this.hide();
					break;

				default :
					this.clearTarget();
					this.lookup();
			}

			e.stopPropagation();
			e.preventDefault();
		},
		focus : function(e) {
			this.focused = true;
		},
		blur : function(e) {
			var that = this;
			this.focused = false;
			var val = this.$element.val();
			if (!this.selected && val !== '') {
				this.$element.val('');
				this.$source.val('').trigger('change');
				this.$target.val('').trigger('change');
			}
			
			if (!this.mousedover && this.shown) {
				setTimeout(function() {
					if ( that.shown && !that.focused)that.hide();
						}, 200);
			}
		},
		click : function(e) {
			e.stopPropagation();
			e.preventDefault();
			this.select();
			this.$element.focus();
		},
		mouseenter : function(e) {
			this.mousedover = true;
			this.$menu.find('.active').removeClass('active');
			$(e.currentTarget).addClass('active');
		},
		scroll:function (e){
			var $this =$(e.target),  
	        viewH =$this.height(),//可见高度  
	        contentH =$this.get(0).scrollHeight,//内容高度  
	        scrollTop =$this.scrollTop();//滚动高度  
	        if(scrollTop/(contentH -viewH)>=0.95 && !$this.find('[data-value="0"]')[0] && this.append){ //到达底部100px时,加载新内容  
	        	$this.append('<li data-value="0" class=""><a href="#"><img src="/tm/res/img/ajax-loader.gif" style="height:15px;width:15px;">正在加载...</a></li>');
	        	if(!this.$target.val()){
	        		this.query = this.$element.val();
		        	this.options.params[this.options.Qname] = this.query;
	        	}
				this.appendData();
				this.refresh();
				this.process2(this.source);
				$this.find('[data-value="0"]').remove();
	        }  
			this.$element.focus();
		},
		mouseleave : function(e) {
			this.mousedover = false;
		}
	};

	/*
	 * COMBOBOX PLUGIN DEFINITION ===========================
	 */
	$.fn.combobox = function(option) {
		return this.each(function() {
			var $this = $(this), data = $this.data('combobox'), options = typeof option == 'object' && option;
			if (!data) {
				if(options['params']){
					options.params['start']=0;
					options.params['limit']=20;
				}
				$this.data('combobox', (data = new Combobox(this, options)));
			}
			if (typeof option == 'string') {
				data[option]();
			}
		});
	};

	$.fn.combobox.defaults = {
		bsVersion : '3',
		menu : '<ul class="typeahead typeahead-long dropdown-menu"></ul>',
		item : '<li><a href="#"></a></li>'
	};

	$.fn.combobox.Constructor = Combobox;
	
	Combobox.prototype.setValue = function(obj){
		var that = this;
		var op = $('<option value="' + obj.id + '">' + obj.name + '</option>');
		op.prop('selected','selected');
		that.$source.append(op);
		this.refresh();
		var validField=this.$element.attr('data-bv-field');
		if(validField)this.$element.parents('form').data('bootstrapValidator').updateStatus(validField,'VALID','notEmpty');
	};
	
	Combobox.prototype.getValue = function(){
		return this.$target.val();
	}
	Combobox.prototype.getDisplayValue = function(){
		return this.$element.val();
	}
	Combobox.prototype.setNull = function(){
		this.$target.val('');
		this.$element.val('');
		this.clearTarget();
	}

}(window.jQuery);
