$(document).ready(function(){
	getLoginForm();
	getRegisterForm();
	getEditForm();
})


var getLoginForm = function(){
	$("a.login").on ("click", function(e){

		e.preventDefault();

		var url = $(this).attr("href")

		var request = $.ajax({
			url: url,
			method: "get",
			datatype: "json"
		});


		request.done(function(response){
			$(".register").fadeOut();
			$("a.login").replaceWith(response);
		});

		request.fail(function(response){
			console.log("Login Get Fail");
		});
	})
}




var getRegisterForm = function(){
	$(".register").on ("click", function(e){
		e.preventDefault();

		var url = $(this).attr("href")

		var request = $.ajax({
			url: url,
			method: "get",
			datatype: "json"
		});


		request.done(function(response){
			$("a.login").fadeOut();
			$(".register").replaceWith(response);
		});

		request.fail(function(response){
			console.log("Register Get Fail");
		});

	})
}



var getEditForm = function(){
	$("div.post-edit > a").on("click", function(e){
		e.preventDefault();

		var url = $(this).attr("href")
		
		var request = $.ajax({
			url: url, 
			method: "get",
			datatype: "json"
		});



		request.done(function(response){
			$("#welcome").fadeOut();
			$("div.post-edit > a").replaceWith(response);
		});

		request.fail(function(response){
			console.log("Edit Get Fail");
		});


	})
}






// var postLoginForm = function(){
// 	$("#login_form").on ("submit", ".form-signin", function(e){
// 		console.log("got here");
// 		e.preventDefault();
// 		console.log($(this));

// 		var request = $.ajax({
// 			url: "/users/login",
// 			method: "post",
// 			datatype: "json",
// 			data: $form.serialize()
// 		})

// 		request.done(function(){
// 			alert("Success");
// 		})

// 		request.fail(function(){
// 			console.log("Login Post Request Fail");
// 		})

// 	})
// }











