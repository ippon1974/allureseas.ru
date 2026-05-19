@list[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$all[^db:getHotels[]]
$egypt[^all.select($all.country_id==1)] 
$maldives[^all.select($all.country_id==2)]
$thailand[^all.select($all.country_id==3)]
$turkey[^all.select($all.country_id==5)]
$uae[^all.select($all.country_id==6)]
$greece[^all.select($all.country_id==7)]
$tunisia[^all.select($all.country_id==9)]
$mexico[^all.select($all.country_id==10)]
$bulgaria[^all.select($all.country_id==11)]
$spain[^all.select($all.country_id==12)]

<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td>^all_getalfa[]</td></tr>
<tr><td>^hotels_year[]</td></tr>
<tr valign="top">
	<td>
	
<table border="0" width="400px">
	<tr>
	<th>Страны</th>
	<th>Курорты</th>
	</tr>
	<tr valign="top">
	<td>
	<ul id="list">
	<li><a href="/region/country/egypt/hotels/" title="Отели Египта">Египет</a> (<em>^egypt.count[]</em>)</li>
	<li><a href="/region/country/maldives/hotels/" title="Отели Мальдив">Мальдивы</a> (<em>^maldives.count[]</em>)</li>
	<li><a href="/region/country/thailand/hotels/" title="Отели Тайланда">Тайланд</a> (<em>^thailand.count[]</em>)</li> 
	<li><a href="/region/country/turkey/hotels/" title="Отели Турции">Турция</a> (<em>^turkey.count[]</em>)</li>
	<li><a href="/region/country/uae/hotels/" title="Отели ОАЭ">ОАЭ</a> (<em>^uae.count[]</em>)</li>
	<li><a href="/region/country/greece/hotels/" title="Отели Греции">Греция</a> (<em>^greece.count[]</em>)</li>
	<li><a href="/region/country/tunisia/hotels/" title="Отели Туниса">Тунис</a> (<em>^tunisia.count[]</em>)</li>
	<li><a href="/region/country/mexico/hotels/" title="Отели Мексики">Мексика</a> (<em>^mexico.count[]</em>)</li>
	<li><a href="/region/country/bulgaria/hotels/" title="Отели Болгарии">Болгария</a> (<em>^bulgaria.count[]</em>)</li>
	<li><a href="/region/country/spain/hotels/" title="Отели Испании">Испании</a> (<em>^spain.count[]</em>)</li>
	</ul>
	</td>
	<td width="250px">
	<ul id="list">
	^h_hotels_.hotel_resort_ru.foreach[key;value]{
		^if(^all.locate[resort;$key]){<li><a href="/region/country/$h_hotels.item_country.[$all.country_id]/hotels/result_select/resort/$key/" title="Отели курорта ${value}. ${h_hotels.hotel_country.[$all.country_id]}.">$value</a> (<span>$h_hotels.hotel_country.[$all.country_id]</span>)</li>}{}
	}
	</ul>
	</td>
</tr>
</table>

	</td>
</tr>
</table><br />
^memory:compact[]
#@list[]

@hotels_year[]
<div class="year_hotels">
	<p>Год основания отеля:</p>
	^h_hotels_.date.foreach[key;value]{^if(^all.locate[founded_date;$value]){<span ^if($form:founded==$value){class="active"}{}><a href="/hotels/year/founded/$value/" title="Отели построенные в $value году"><strong>$value</strong></a></span>^#0A|&nbsp^;}}{^#0A}
</div>
#@hotels_year[]

































