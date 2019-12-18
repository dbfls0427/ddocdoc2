console.log("user_height.js !!!!")

var heightService = (function(){

	function insert(height, callback, error){
		
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
	return {
		list: list
		}
})();