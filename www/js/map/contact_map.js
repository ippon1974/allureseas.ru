function initialize() {
  
var myLatlng = new google.maps.LatLng(55.751964, 37.585265)^;
 
var styleArray = [
    {
      featureType: 'all',
      stylers: [
	    { hue: '#6699cc' },
        { saturation: 100 }
      ]
    },{
      featureType: 'road.arterial',
      elementType: 'geometry',
      stylers: [
        { hue: '#4682b4' },
        { saturation: 100 }
      ]
    },{
      featureType: 'poi.business',
      elementType: 'labels',
      stylers: [
        { visibility: 'off' }
      ]
    }
  ];
  
  
  var mapOptions = {
    zoom: 15,
    styles: styleArray,
    center: myLatlng,
	mapTypeId: google.maps.MapTypeId.TERRAIN
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)^;

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Îôèñ ¹ 1646, óë. Íîâûé Àðáàò ä. 21, ã. Ìîñêâà, 119019'
  });
}

google.maps.event.addDomListener(window, 'load', initialize)^;