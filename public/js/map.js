// put erb value into html first, render it here


$(document).ready(function(){

	var origin = "740 Webster St. San Francisco"
	var destination = "633 Folsom St. San Francisco"
	var mode = "driving"

	calcAndDisplayDirection(origin, destination, mode);

})




function calcAndDisplayDirection(origin, destination, mode) {
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var directionsService = new google.maps.DirectionsService;

  var sf_map = initMapOfSanFrancisco();

	directionsDisplay.setMap(sf_map); 

	directionsService.route(
  	{	origin: origin,
    	destination: destination,
    	travelMode: setTravelMode(mode)},

  	function(response, status){
    	if (status === google.maps.DirectionsStatus.OK)
    		{directionsDisplay.setDirections(response);
    			console.log("inside request")} 
    	else {window.alert('Directions request failed due to ' + status);}
  	}
	);

}


function initMapOfSanFrancisco(){
	var selector = document.getElementById('map');
	var options = {
		zoom: 18,
		center: {lat:  37.774501, lng: -122.418432}
	};

	var sf_map = new google.maps.Map(selector, options);

	return sf_map;
}


function setTravelMode(mode){
	if(mode === 'driving')				{return google.maps.TravelMode.DRIVING}
	else if(mode === 'transit')		{return google.maps.TravelMode.TRANSIT}
	else if(mode === 'bicycling')	{return google.maps.TravelMode.BICYCLING}	
	else 													{return google.maps.TravelMode.WALKING}
}



function initMarker(options){
	var marker = new google.maps.Marker(options)
}









// var directionsDisplay;
// var directionsService = new google.maps.DirectionsService();



// function initialize() {
//   directionsDisplay = new google.maps.DirectionsRenderer();
//   var chicago = new google.maps.LatLng(41.850033, -87.6500523);
//   var mapOptions = {
//     zoom:7,
//     center: chicago
//   }
//   var map = new google.maps.Map(document.getElementById("map"), mapOptions);
//   directionsDisplay.setMap(map);
// }

// function calcRoute() {
//   var start = document.getElementById("start").value;
//   var end = document.getElementById("end").value;
//   var request = {
//     origin:start,
//     destination:end,
//     travelMode: google.maps.TravelMode.DRIVING
//   };
//   directionsService.route(request, function(result, status) {
//     if (status == google.maps.DirectionsStatus.OK) {
//       directionsDisplay.setDirections(result);
//     }
//   });
// }



//---------- Lecture material ---------------

var dbc = new google.maps.LatLng(37.784532, -122.397152);


var directionsDisplayA = new google.maps.DirectionsRenderer(); //draws in a map
var directionService = new google.maps.DirectionsService(); //makes a request to google api


function initMapWithMarker() {
	var map = new google.maps.Map(document.getElementById('map'), {
    center: dbc,
    zoom: 18
  });

  var marker = new google.maps.Marker({
    position: dbc,
    map: map,
    draggable: true
  });
}


function generateRouteBetween2Points(directionsDisplay1){
	var request1 = {
		origin: generateRandomSFCoords(),
		destination: generateRandomSFCoords(),
		travelMode: google.maps.TravelMode.DRIVING
	};


	directionService.route(request1, function(response, status){
		directionsDisplay1.setDirections(response)
	});

}


// function createMarker(options, html){
// 	//options => js obj
// 	var marker = new google.maps.Marker(options);
// 	if (html){
// 		google.maps.event.addListener(marker, "click", function(){
// 			infoWindow.setContent(html);
// 			infoWindow.open(options.map, this);
// 		})
// 	}
// 	return marker;
// }






