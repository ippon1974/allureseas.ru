@title_global[]
$result[Отели построенные в $form:founded году]
#end @title_global[]

@hotels[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$hotel[^db:getHotels[]]
$hotel_year[^hotel.select($hotel.founded_date==$form:founded)]
^hotel_year.sort{$hotel_year.hotel_name_en}
$found(^hotel_year.count[])
<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td colspan="2">^all_getalfa[]</td></tr>
<tr><td colspan="2">^hotels_year[]</td></tr>
<tr>
	<td valign="top"  width="">
	<table class="hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
	<tr>
	<td><h4>Отели построенные в $form:founded году <span class="count_hotels">(^num_decline[$found;найден $found отель;найдены $found отеля;найдены $found отелей])</span></h4></td>
	</tr>
	<tr>
	<td>
	
	<table class="menu_hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
	^hotel_year.menu{
	<tr valign="top">
	^if(def $hotel_year.hotel_img_front){<td width="135px" valign="top"><a href="/hotels/detal/id/$hotel_year.id/" title="$hotel_year.hotel_name_en"><img class="thumb" src="/hotels/img/f/${hotel_year.hotel_img_front}.jpg" alt="Отель $hotel_year.hotel_name_en" border="0"></a></td>}{}
	<td valign="top"><p><strong><a href="/hotels/detal/id/$hotel_year.id/" title="Отель $hotel_year.hotel_name_en">$hotel_year.hotel_name_en</a> $hotel_year.hotel_rating <sup>$h_hotels.hotel_rating_img.[$hotel_year.hotel_rating_type]</sup></strong><br />
	$h_hotels.hotel_country.[$hotel_year.country_id] $h_hotels.hotel_resort_ru.[$hotel_year.resort]<br/>$hotel_year.location<br />
	^if(def $hotel_year.founded_date){Построен: $hotel_year.founded_date г.<br />}{}^if(def $hotel_year.building_conservation_date){Реконструирован: $hotel_year.building_conservation_date г.}{}</p>
	</td>
	</tr>
	}
	</table>
	
	
	</td>
	</tr>
	</table>
	</td>
	<td valign="top"  width="25%">
	<div class="filter_hotels"></div>
	^banner_right[]
	</td>
</tr>
</table>
#end @hotels[]

@hotels_year[]
<div class="year_hotels">
	<p>Год основания отеля:</p>
	^h_hotels_.date.foreach[key;value]{^if(^hotel.locate[founded_date;$value]){<span ^if($form:founded==$value){class="active"}{}><a href="/hotels/year/founded/$value/" title="Отели построенные в $value году"><strong>$value</strong></a></span>^#0A|&nbsp^;}}{^#0A}
</div>
#@hotels_year[]