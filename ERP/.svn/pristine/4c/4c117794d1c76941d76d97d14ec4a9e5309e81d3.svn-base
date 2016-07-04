var GlobalMessage = {
  "error.common" :"系统繁忙，请稍后重试！"
};

var MessageEorder = {
		"error.common.tips_order_user": "您正在帮{0} ( {1} )购货 ",
		"error.common.login_first" : "请先[<a href='javascript:login()'>登录</a>]。",
		"err.common":"未知系统错误"
	};

/*
 * { titleShow :false, transitionIn :"elastic", transitionOut :"elastic",
 * overlayOpacity :0.8, overlayColor :'#ccc', centerOnScroll :_isIPAD ? false :
 * true, padding :0, margin :0, modal :true };
 */

// ------implement JSON(see http://www.JSON.org/js.html)------
// use JSON.stringify(xx) or JSON.parse(xxx)
var JSON;
if (!JSON) {
	JSON = {};
}

(function() {
	'use strict';

	function f(n) {
		// Format integers to have at least two digits.
		return n < 10 ? '0' + n : n;
	}

	if (typeof Date.prototype.toJSON !== 'function') {
		Date.prototype.toJSON = function(key) {
			return isFinite(this.valueOf()) ? this.getUTCFullYear() + '-'
					+ f(this.getUTCMonth() + 1) + '-' + f(this.getUTCDate())
					+ 'T' + f(this.getUTCHours()) + ':'
					+ f(this.getUTCMinutes()) + ':' + f(this.getUTCSeconds())
					+ 'Z' : null;
		};
		String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function(
				key) {
			return this.valueOf();
		};
	}

	var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, gap, indent, meta = { // table
		// of
		// character
		// substitutions
		'\b' : '\\b',
		'\t' : '\\t',
		'\n' : '\\n',
		'\f' : '\\f',
		'\r' : '\\r',
		'"' : '\\"',
		'\\' : '\\\\'
	}, rep;

	function quote(string) {
		escapable.lastIndex = 0;
		return escapable.test(string) ? '"'
				+ string.replace(escapable,
						function(a) {
							var c = meta[a];
							return typeof c === 'string' ? c : '\\u'
									+ ('0000' + a.charCodeAt(0).toString(16))
											.slice(-4);
						}) + '"' : '"' + string + '"';
	}

	function str(key, holder) {
		// Produce a string from holder[key].
		var i, // The loop counter.
		k, // The member key.
		v, // The member value.
		length, mind = gap, partial, value = holder[key];
		// If the value has a toJSON method, call it to obtain a replacement
		// value.
		if (value && typeof value === 'object'
				&& typeof value.toJSON === 'function') {
			value = value.toJSON(key);
		}
		if (typeof rep === 'function') {
			value = rep.call(holder, key, value);
		}
		switch (typeof value) {
		case 'string':
			return quote(value);
		case 'number':
			return isFinite(value) ? String(value) : 'null';
		case 'boolean':
		case 'null':
			return String(value);
		case 'object':
			if (!value) {
				return 'null';
			}
			gap += indent;
			partial = [];
			if (Object.prototype.toString.apply(value) === '[object Array]') {
				length = value.length;
				for (i = 0; i < length; i += 1) {
					partial[i] = str(i, value) || 'null';
				}
				v = partial.length === 0 ? '[]' : gap ? '[\n' + gap
						+ partial.join(',\n' + gap) + '\n' + mind + ']' : '['
						+ partial.join(',') + ']';
				gap = mind;
				return v;
			}
			if (rep && typeof rep === 'object') {
				length = rep.length;
				for (i = 0; i < length; i += 1) {
					if (typeof rep[i] === 'string') {
						k = rep[i];
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			} else {
				for (k in value) {
					if (Object.prototype.hasOwnProperty.call(value, k)) {
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			}
			v = partial.length === 0 ? '{}' : gap ? '{\n' + gap
					+ partial.join(',\n' + gap) + '\n' + mind + '}' : '{'
					+ partial.join(',') + '}';
			gap = mind;
			return v;
		}
	}
	if (typeof JSON.stringify !== 'function') {
		JSON.stringify = function(value, replacer, space) {
			var i;
			gap = '';
			indent = '';
			if (typeof space === 'number') {
				for (i = 0; i < space; i += 1) {
					indent += ' ';
				}
			} else if (typeof space === 'string') {
				indent = space;
			}
			rep = replacer;
			if (replacer
					&& typeof replacer !== 'function'
					&& (typeof replacer !== 'object' || typeof replacer.length !== 'number')) {
				throw new Error('JSON.stringify');
			}
			return str('', {
				'' : value
			});
		};
	}
	if (typeof JSON.parse !== 'function') {
		JSON.parse = function(text, reviver) {
			var j;

			function walk(holder, key) {
				var k, v, value = holder[key];
				if (value && typeof value === 'object') {
					for (k in value) {
						if (Object.prototype.hasOwnProperty.call(value, k)) {
							v = walk(value, k);
							if (v !== undefined) {
								value[k] = v;
							} else {
								delete value[k];
							}
						}
					}
				}
				return reviver.call(holder, key, value);
			}
			text = String(text);
			cx.lastIndex = 0;
			if (cx.test(text)) {
				text = text.replace(cx,
						function(a) {
							return '\\u'
									+ ('0000' + a.charCodeAt(0).toString(16))
											.slice(-4);
						});
			}
			if (/^[\],:{}\s]*$/
					.test(text
							.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
							.replace(
									/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
									']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
				j = eval('(' + text + ')');
				return typeof reviver === 'function' ? walk({
					'' : j
				}, '') : j;
			}
			throw new SyntaxError('JSON.parse');
		};
	}
}());
// ------implement JSON end------

// --------- loading begin ------------
var _ebizLoading = $("#ebiz-loading");;
var _ebizLoadingOverlay = $("#ebiz-loading-overlay");
function loading() {
	if (_ebizLoading.length == 0) {
		$('body')
				.append(
						_ebizLoading = $('<div id="ebiz-loading"><div id="ebiz-loading-img"></div></div>'),
						_ebizLoadingOverlay = $('<div id="ebiz-loading-overlay"></div>'));
		$("#ebiz-loading-img")
				.css(
						{
							"width" : "24px",
							"height" : "24px",
							"padding":"10px",
							"background" : "url('"
									+ startUp.getRootPath()
									+ "/static/img/fancybox_loading.gif') center center no-repeat"
						});
		_ebizLoading.css({
			"position" : "fixed",
			"top" : "50%",
			"left" : "50%",
			"width" : "44px",
			"height" : "44px",
			"margin-top" : "-22px",
			"margin-left" : "-22px",
			"background-position" : "0 -108px",
			"opacity" : "0.8",
			"background-image" : "url('" + startUp.getRootPath()
					+ "/static/img/fancybox_sprite.png')",
			"display" : "none",
			'z-index' : 9999
		});
		_ebizLoadingOverlay.css({
			'position' : 'absolute',
			'top' : 0,
			'left' : 0,
			'background-color' : '#ccc',
			'opacity' : 0.6,
			'display' : 'none',
			'z-index' : 9998
		});
		
	}
	_ebizLoadingOverlay.css({
		'width' : '100%',
		'height' : $(document).height()
	}).show();
	_ebizLoading.show();
}

function loaded() {
	$("#ebiz-loading").hide();
	$("#ebiz-loading-overlay").hide();
}
// --------- loading end ------------

// --------- message helper begin ------------
function formatMessage(msg, param1, param2, param3, param4) {
	if (param1 || param1 == 0)
		msg = msg.replace("{0}", param1);
	if (param2 || param2 == 0)
		msg = msg.replace("{1}", param2);
	if (param3 || param3 == 0)
		msg = msg.replace("{2}", param3);
	if (param4 || param4 == 0)
		msg = msg.replace("{3}", param4);
	return msg;
}

// --------- message helper end ------------

// --------- extend String prototype begin ---------
String.prototype.trim = function() {
	return $.trim(this);
};
String.prototype.startsWith = function(str) {
	var reg = new RegExp("^" + str);
	return reg.test(this);
};
String.prototype.endsWith = function(str) {
	var reg = new RegExp(str + "$");
	return reg.test(this);
};
String.prototype.isMobile = function() {
	var pattern = _MIBOLE_PATTERN;
	return pattern.test(this);
};
// --------- extend String prototype end ---------

// 获取当前时间戳
function getTimestamp() {
	return new Date().getTime();
}
/**
 * 将时间戳转换成字符类型
 * @returns {String}
 */
function fomatDate(param) {
	if(!param){
		return "";
	}
	var date = new Date();
	date.setTime(param);
	var m = date.getMonth()+1;
	var month = m<10?("0"+m):m;
	var d = date.getDate();
	var day = d<10?("0"+d):d;
	return (date.getFullYear()+"-"+month+"-"+day)
}

//点击链接是显示loading图标
function showLoading(url) {
	loading();
	location.href = _APP_PATH + url;
}


/**
 * 功能：将字符串中含有的半角字符转换成全角字符
 * 参数：需要处理的字符串
 * 返回：已处理的字符串
 * 示例：transformDBC2SBC("测试test测 试100")将返回"测试ｔｅｓｔ测　试１００"
 * author: added by jessica 20121219
 */
function transformDBC2SBC(transformStr){
	var tmp = "";
    for(var i=0;i<transformStr.length;i++){
		var unicode = transformStr.charCodeAt(i);
		if(unicode < 256){
			if(unicode == 32){
				tmp += String.fromCharCode(12288);	
			}else{
				tmp += String.fromCharCode(unicode + 65248);	
			}
		}else{
			tmp += String.fromCharCode(unicode);	
		}
    }
    return tmp;
}

//只允许输入数字
//onkeydown调用，兼容IE/FIREFOX/CHROME
//onkeydown="return numberOnly(event)"
function numberOnly(e) {
var key = window.event? e.keyCode:e.which;  

//37-left,39-right,46-Del,8-backspace,48-0,57-9,9-tab
if( (key > 47 && key < 58) || ( key > 95 && key < 106 )
    || key==8 || key==39 || key==37 || key==46 || key==9) {
  e.returnValue = true;
  return true;
}else{
  e.returnValue = false;
  return false;
}
}

/* 触发验证器
 * 锁屏提交表单
 * 必输参数-表单的jq对象
 * 许俊雄 20160316*/
function submitWValidLoading($form){
	if(!$form){
		alert('输入参数不合法，请输入表单的jquery对象！');
	}
	$form.validate();
	if($form.valid()){
		//加载等待界面
		loading();
		$form.submit();
	}
}


/**
 * 等待两秒后，然后调用 targetFun, targetFun不带任何参数
 * @param targetFun
 * @param times
 */
function waitTimesAndCallback(targetFun){
	setTimeout(function(){
		targetFun();
	}, 2000);
}


$(document).ready(function() {
	try{
	    $('body').append('<button class="material-scrolltop" type="button" style="bottom: 80px;"></button>');
		  $('body').materialScrollTop({
              revealElement: 'body',
              revealPosition: 'top',
              onScrollEnd: function() {
                  console.log('Scrolling End');
              }
          });
	}catch(e){
		// blank
	} 
	if($(".pagination ul li").length==4){
		$(".pagination").hide();
	}
});

