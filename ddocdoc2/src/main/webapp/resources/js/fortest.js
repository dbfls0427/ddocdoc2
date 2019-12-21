
var Service = (function() {
	console.log(".ddd");
	var video_ids;


	function startGet(searchKey){
		jQuery.get("https://www.googleapis.com/youtube/v3/search", {
			part : 'snippet',
			q : searchKey,
			key : 'AIzaSyDUJg7X2KiuaP9oFUlI98DaJ7l9dPQFP8w',
			maxResults : 9,
			type : 'video'
		}, function(data) {
			video_ids = new Array();
			jQuery.each(data.items, function(i, item) {
				console.log(item.id.videoId);
				video_ids.push(item.id.videoId);
			})
			getVids();
			console.log(video_ids);
		}
		
		);//get
	}

	function getVids() {
		var v_ids = video_ids.join(",");
		var videos;
		
		jQuery.get("https://www.googleapis.com/youtube/v3/videos", {
			key : 'AIzaSyDUJg7X2KiuaP9oFUlI98DaJ7l9dPQFP8w',
			part : 'snippet,contentDetails',
			id : v_ids,
			maxResults : 9
		}, function(data) {
			console.log(data.items);
			videos = new Array();
			jQuery.each(data.items, function(i, item) {
				console.log(item.snippet.title);
				console.log(item.id);
				
				//for duration
				var date = (item.contentDetails.duration).substring(2);
				var date2 = date.replace(/H|M/gi, ":");
				var date3 = date2.replace(/S/gi, "");
				var finalDate = date3.replace(/S/gi, ":");
				var min = finalDate.split(":");
				var finalMin = min[0];
				console.log(finalMin);
				console.log(item.snippet.thumbnails.high.url);
				
				videos.push({
					title : item.snippet.title,
					id : item.id,
					duration : finalMin,
					thumbnail : item.snippet.thumbnails.high.url
				})
			})//each
			console.log("냐야야야");
			console.log(videos);
			for(var i=0; i<videos.length; i++){
				var str = "";
				str += '<div class="col-md-4">';
				str += '<div class="card mb-4 shadow-sm">';
				/*str += '<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="'+videos[i].thumbnail+'" focusable="false" role="img" aria-label="Placeholder: Thumbnail"></img>';*/
				str +='<iframe height = "225" width = "100%" src=\"//www.youtube.com/embed/'+videos[i].id+'"></iframe>';
				str += '<div class="card-body">';
				str += '<p class="card-text">'+videos[i].title+'</p>';
				str += '<div class="d-flex justify-content-between align-items-center">';
				str += '<div class="btn-group">';
				str += '<button type="button" class="btn btn-sm btn-outline-secondary"><a href="https://www.youtube.com/watch?v='+videos[i].id+'">view</a></button>';
				str += '</div>';
				str += '<small class="text-muted">'+videos[i].duration+' mins</small>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
				jQuery("#content").append(str);
			}
		  }//function

		);//$.get
	}//getVids
	
	return {
		startGet : startGet
	}


})();