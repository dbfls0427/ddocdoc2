
var replyJs = (function() {
	console.log("replyJs");
	
	function insert(reply, callback, error) {
		console.log("fucking");
		console.log(reply);
		$.ajax({
			type : 'POST',
			url : '/reply/new',
			data : JSON.stringify(reply),
			dataType : "json",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				console.log("success");
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				console.log("fail");
				if(xhr){
					console.log(xhr);
				}
			}
			
			
			
		});
		
	};
	
	
	function list(param, callback, error) {
		var comNum = param.com_num;
		
		$.getJSON("/reply/pages/" + comNum + ".json", function(data) {
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error){
				error();
			}
		})
		
	};
	
	function remove(comNum, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/reply/' + comNum,
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
				
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
			
			
		});
	};
	
	function update(reply, callback, error) {
		
		$.ajax({
			type : 'put',
			url : '/reply/' + reply.rep_num,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
			
			
		});
	}
	
	
	
	return{
		insert : insert,
		list : list,
		remove : remove,
		update : update
		
	};
	
})();