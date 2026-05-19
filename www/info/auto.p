@GetInfo[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$weather[^db:getWeather[]]
$info[^table::load[/sections_footer.cfg]]
<table class="info" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr valign="top">
<td class="info_left" width="25%">
<div class="info_left_div">
^left_nav_info[]
<br />


</div>
</td>
	<td class="info_center">
	<div>
	<h1 class="fontheader">^title_global[]</h1>
    ^if(^info.locate[uri;$request:uri]){<p class="title_desc_header">$info.description</p>}{}
	
	<table class="info_in_info" border="0" cellpadding="0" cellspacing="0">
    <tr>
	<th><a href="/info/weather/" title="Прогноз погоды на курортах мира">Погода на курортах мира</a></th>
	<th></th>
	<th></th>
	</tr>
	<tr>
	<td width="30%">
	<div>
	<p>
	^h_hotels_.hotel_country.foreach[key;value]{
	^if(^weather.locate[country_id;$key]){<a href="/info/weather/country/$h_hotels_.item_country.[$weather.country_id]/" title="Погода $value">$value</a>}{}
	}
	</p>
	
	
	
	
	</div>
	</td>
	<td></td>
	<td></td>
    </tr>
    </table>

	</div>
	</td>
    <td class="info_right" width="20%">
	<div class="div_info_right">
    
	</div>
</td>
</tr>
</table>
#GetInfo[]

@left_nav_info[]
$str[$request:uri] 
$parts[^str.split[/;lh]]
$left_nav_info[^table::load[/sections_footer.cfg]]
<div class="info_left_nav_country">
^if($request:uri eq "/info/"){<p><strong>Информация</strong></p>}{<p><a href="/info/" title="Полезная информация для туриста">Информация</a></p>}
^left_nav_info.menu{
    <ul>
	^if($left_nav_info.is_published==1){
	^if($left_nav_info.uri eq $request:uri){<li><strong>$left_nav_info.name</strong></li>}{<li><a href="$left_nav_info.uri" title="$left_nav_info.name">$left_nav_info.name</a></li>}
	}{}
	</ul>
}
</div>
#@special_left_nav_country[]


