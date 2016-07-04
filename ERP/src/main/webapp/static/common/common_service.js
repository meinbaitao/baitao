
/**
 * 初始调用方法
 */
var startUp = function(){};

/**
 * 生成UUID
 */
startUp.uuid =function() {
	var s = [];
	var hexDigits = "0123456789abcdefbt";
	for (var i = 0; i < 36; i++) {
		s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	}
	s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
	s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the
														// clock_seq_hi_and_reserved
														// to 01
	s[8] = s[13] = s[18] = s[23];

	var uuid = s.join("");
	return uuid;
}

/**
 * 上传公共方法
 */
startUp.ajaxFileUpload =function (url, fileId, data, callback) {
	if (!fileId || !url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajaxFileUpload({
		url : url, // 用于文件上传的服务器端请求地址
		type : 'post',
		data : data, // 此参数非常严谨，写错一个引号都不行
		secureuri : false, // 一般设置为false
		fileElementId : fileId, // 文件上传空间的id属性 <input type="file" id="file"
								// name="file" />
		dataType : 'text', // 返回值类型 一般设置为json
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}

/**
 * 上传公共方法(无参数,返回json格式)
 */
startUp.uploadReturnJson =function (url, fileId, callback) {
	if (!fileId || !url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajaxFileUpload({
		url : url, // 用于文件上传的服务器端请求地址
		type : 'post',
//		data : data, // 此参数非常严谨，写错一个引号都不行
		secureuri : false, // 一般设置为false
		fileElementId : fileId, // 文件上传空间的id属性 <input type="file" id="file"
		// name="file" />
		dataType : 'json', // 返回值类型 一般设置为json
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			loaded();
			callback(null);
		}
	});
}

/**
 * 公共的异步请求方法(GET)
 */
startUp.getData =function(url, callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		timeout : 30000,
		dataType : "json",
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}

/**
 * 公共的异步请求方法(POST)
 */
startUp.postData =function(url, data, callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajax({
		type : "POST",
		url : url,
		timeout : 30000,
		data : data,
		dataType : "json",
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}

/**
 * 公共的异步请求方法(POST)
 */
startUp.postActData =function(url, jsonData,contentType,callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajax({
		type : "POST",
		url : url,
		timeout : 30000,
		data : jsonData,
		dataType : "json",
		contentType:contentType,
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data){
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}

/**
 * 公共的异步请求方法(GET)
 */
startUp.getAsyncData =function(url,callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		timeout : 30000,
		async:false,
		dataType : "json",
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}


/**
 * 同步get方法
 * @param url
 * @param callback
 */
startUp.syncGet =function(url,callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		timeout : 30000,
		async:false,
		dataType : "json",
		success : function(data) {
			callback(data);
		},
		error : function(data) {
			callback(null);
		}
	});
}

/**
 * 公共的异步请求方法(post)
 */
startUp.postAsyncData =function(url, data, callback) {
	if (!url) {
		return;
	}
	url = startUp.getRootPath()+url;
	//上传文件时开启页面锁定 许俊雄20160328
	loading();
	$.ajax({
		url : url,
		type : "POST",
		cache : false,
		timeout : 30000,
		async:false,
		dataType : "json",
		data: data,
		success : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(data);
		},
		error : function(data) {
			//上传文件结束关闭页面锁定
			loaded();
			callback(null);
		}
	});
}

/**
 * 截取字符串，区别汉字和英文
 */
startUp.subStr =function(name, maxLength) {
	if (!maxLength) {
		maxLength = 20;
	}
	if (name == null || name.length < 1) {
		return "";
	}
	var w = 0;//字符串长度，一个汉字长度为2   
	var s = 0;//汉字个数   
	var p = false;//判断字符串当前循环的前一个字符是否为汉字   
	var b = false;//判断字符串当前循环的字符是否为汉字   
	var nameSub;
	for (var i = 0; i < name.length; i++) {
		if (i > 1 && b == false) {
			p = false;
		}
		if (i > 1 && b == true) {
			p = true;
		}
		var c = name.charCodeAt(i);
		//单字节加1   
		if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
			w++;
			b = false;
		} else {
			w += 2;
			s++;
			b = true;
		}
		if (w > maxLength && i <= name.length - 1) {
			if (b == true && p == true) {
				nameSub = name.substring(0, i - 2) + "...";
			}
			if (b == false && p == false) {
				nameSub = name.substring(0, i - 3) + "...";
			}
			if (b == true && p == false) {
				nameSub = name.substring(0, i - 2) + "...";
			}
			if (p == true) {
				nameSub = name.substring(0, i - 2) + "...";
			}
			break;
		}
	}
	if (w <= maxLength) {
		return name;
	}
	return nameSub;
}


/**
 * 特殊字符定义转换
 */
var entityMap = {"&": "&amp;","<": "&lt;",">": "&gt;",'"': '&quot;',"'": '&#39;',"/": '&#x2F;'};
startUp.escapeHtml =function(string) {
	return String(string).replace(/[&<>"'\/]/g, function(s) {
		return entityMap[s];
	});
}


/**
 * 获取当前地址http:xxxx:8080/xxx 
 */
startUp.getRootPath =function(){  
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
    var curWwwPath=window.document.location.href;  
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
    var pathName=window.document.location.pathname;  
    var pos=curWwwPath.indexOf(pathName);  
    //获取主机地址，如： http://localhost:8083  
    var localhostPaht=curWwwPath.substring(0,pos);  
    //获取带"/"的项目名，如：/uimcardprj  
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
    return(localhostPaht+projectName);  
}


/**
 * 验证是否是图片
 */
startUp.verificationPic =function(param){  
	if(!param){
		return false;
	}
	var list = "GIF JPEG PNG JPG";
	if(list.indexOf(param.toUpperCase()) !=-1){
		return true;
	}
}


/**
 * 处理未声明属性
 * @param attribute
 * @returns
 */
function dealWithUndefined(attribute){
	if(typeof attribute == "undefined"){
		return "";
	}else{
		return attribute;
	}
}

/**
 * form表单转化json对象
 */
(function($){   
	$.fn.serializeJsonObj = function(){
		var jsonData1 = {};
		var serializeArray = this.serializeArray();
		// 先转换成{"id": ["12","14"], "name": ["aaa","bbb"]}这种形式
		$(serializeArray).each(function () {
			if (jsonData1[this.name]) {
				if ($.isArray(jsonData1[this.name])) {
					jsonData1[this.name].push(this.value);
				}else {
					jsonData1[this.name] = [jsonData1[this.name], this.value];
				}
			}else {
				jsonData1[this.name] = this.value;
			}
		});
		// 再转成[{"id": "12", "name": "aaa"},{"id": "14", "name": "bb"}]的形式
		var vCount = 0;
		// 计算json内部的数组最大长度
		for(var item in jsonData1){
			var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
			vCount = (tmp > vCount) ? tmp : vCount;
		}
		
		if(vCount > 1) {
			var jsonData2 = new Array();
			for(var i = 0; i < vCount; i++){
				var jsonObj = {};
				for(var item in jsonData1) {
					jsonObj[item] = jsonData1[item][i];
				}
				jsonData2.push(jsonObj);
			}
			return jsonData2;
		}else{
			return jsonData1;
		}
	};
})(jQuery);

