console.log("user_height.js !!!!")

var heightService = (function(){

	function insert(queryString, callback, error){
		console.log(queryString);
		j.ajax({
			type : 'POST',
			url : '/heightAjax/insert',
			data : queryString,
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					console.log("에러임듕 ㅠㅠㅠ");
				}
			}
		});
	}
	
	function update(queryDecode, callback,error){
		console.log("height : " +queryDecode);
		
		j.ajax({
			type : 'POST',
			url : '/heightAjax/update',
			data : queryDecode,
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function list(param, callback, error){
		console.log("param : " + param.ch_num);
		j.getJSON("/heightAjax/list/" + param.ch_num + ".json", function(data){
			if(callback){
				console.log(data);
				callback(data);
			}
		}).fail(function(xhr,status,err){
			
			if(error){
				error();
			}
		});
		
	}
	
	function dTime(timeValue) {
		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	;
	
	function detail(he_num, callback, error){
		j.get("/heightAjax/" + he_num + ".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				console.log("이거슨 오류");
			}
		});
		
	};

	
	function remove(he_num, callback, error){
		j.ajax({
			type : 'GET',
			url : '/heightAjax/delete/' + he_num,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	
	return {
		list: list,
		dTime : dTime,
		insert : insert,
		detail : detail,
		update : update,
		remove : remove
		}
})();