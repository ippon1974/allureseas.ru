@head[]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html^; charset=windows-1251" />
<meta name="description" content="^title_global[] | ^description_global[]" />
<meta name="keywords" content="^title_global[] | ^keywords_global[]" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/base-min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/style.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/js/datepicker/jquery-ui-1.8.11.custom.min.js"></script>
	<title>^title_global[]</title>

    <style>
      html, body, #map-canvas {
		height: 95%^;
        margin: 0px^;
        padding: 0px
      }
    </style>
	
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
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
      title: 'Офис № 1646, ул. Новый Арбат д. 21, г. Москва, 119019'
  });
}

google.maps.event.addDomListener(window, 'load', initialize)^;

</script>
</head>
#@head[]

@ContactsList[]
<table id="news" border="0" cellpadding="0" cellspacing="0" width="90%">
<tr valign="top">
<td>
<dl>
	<dt>Контакты</dt>
	<dd>Телефон: ^phone[]</dd>
	<dd>Электронная почта: ^email[]</dd>
	</dl>
</td>
<td>
<dl>
	<dt>Режим работы</dt>
	<dd>^mode_time_working[]</dd>
</dl>
</td>
<td>
<dl>
	<dt>Адрес</dt>
	<dd>^adress_post[]</dd>
</dl>
</td>
</tr>
<tr>
<td colspan="3">
<br />
<!-- Этот блок кода нужно вставить в ту часть страницы, где вы хотите разместить карту (начало) -->
<div id="map-canvas" style="border: 2px solid #6495ed^; width: 100%^; height: 400px^;"></div>
<!-- Этот блок кода нужно вставить в ту часть страницы, где вы хотите разместить карту (конец) -->
</td>
</tr>
</table><br />
#@ContactsList[]
