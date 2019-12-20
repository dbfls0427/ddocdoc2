var gameAjax = (function() {
	
	function symptomInsert(form, callback, error) {
		console.log(form);
		
		$.ajax({
			type : 'POST',
			url : '/game/symptomInsert',
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
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
	}
	
	return {
		symptomInsert : symptomInsert
		
	};
})();

