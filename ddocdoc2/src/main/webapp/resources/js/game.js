var gameAjax = (function() {
	
	function symptomInsert(form, callback, error) {
		console.log(form);
		$.ajax({
			type : 'POST',
			url : '/game/symptomInsert',
			data : JSON.stringify(form),
			/* 데이터를 전송하기 전에 헤더에 csrf값을 설정한다.*/
			beforeSend : function(xhr) {
				console.log("${_csrf.headerName}");
				 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
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

