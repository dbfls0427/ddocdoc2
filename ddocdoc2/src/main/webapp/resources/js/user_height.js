console.log("user_height.js !!!!")

var heightService = (function(){

	function insert(height, callback, error){
		
	}
	
	function list(param, callback, error){
		
		$.getJSON("/height/list/" + param + ".json", function(data){
			if(callback){
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