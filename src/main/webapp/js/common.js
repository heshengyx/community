function select(option) {
	$(option.selectId).change(function(){ 
		$.ajax({
		  	url: option.url,
		  	type : "POST",
			dataType : "json",
			data: {
				"level": option.level,
				"parentId": $(option.selectId).val()
			},
		  	success: function(data) {
		  		$(option.changeId).empty();
		  		$(option.changeId).append('<option value="0">' + option.title + '</option>');
		  		for(var i = 0; i < data.length; i++){
					$(option.changeId).append('<option value="' + data[i].id + '"> ' + data[i].name + '</option>');
				}
			}
		});
	});
}