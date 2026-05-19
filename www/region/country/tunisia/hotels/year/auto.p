@title_global[]
^hHotDesc[]
$hotels_[^db:getHotels[]]
$hotel[^hotels_.select($hotels_.country_id==^paramCountryId[])]
$result[Отели $h_hotels.hotel_country_hotel.[$hotel.country_id] построенные в $form:founded году]
#end @title_global[]

@hotels[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$currency[^db:getCurrency[]]
$special[^db:getSpecial[]]
$special_country[^special.select($special.country_id==^paramCountryId[])]
$special_is_archive[^special_country.select($special_country.is_archive==0)]
$hotel[^db:getHotels[]]
$hotel_[^hotel.select($hotel.country_id==^paramCountryId[])]
$hotel_year[^hotel_.select($hotel_.founded_date==$form:founded)]
$found(^hotel_year.count[])
<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td colspan="2">^getalfa[]</td></tr>
<tr>
	<td valign="top"  width="">
	<table class="hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
	<tr>
	<td>^hotels_year[]</td>
	</tr>
	<tr>
	<td><h4>Отели $h_hotels.hotel_country_hotel.[$hotel_year.country_id] построенные в $form:founded году <span class="count_hotels">(^num_decline[$found;найден $found отель;найдены $found отеля;найдены $found отелей])</span></h4></td>
	</tr>
	<tr>
	<td>
	
	<table border="0">
    <tr valign="top">
	<td width="60%">
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
	<td width="">
	
	^if($special_is_archive){
	<table align="center" class="menu_hotels_all_special" border="0" width="90%">
	<tr><th><a href="/special/" title="Все спецпредложения">Все спецпредложения</a> | <a href="/special/$h_hotels.item_country.[$hotel_.country_id]/" title="Спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel_.country_id]">Спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel_.country_id]</a></th></tr>
	
	^special_is_archive.menu{
	$found($special_is_archive.night_count)
	$found_human($special_is_archive.human_count)
	$found_human_child($special_is_archive.child_count)
	<tr valign="top">
	<td>
	<dl>
	<dt><a href="/special/detal/id/$special_is_archive.id/" title="Спецпредложения в отель: $special_is_archive.hotel_name_en">$special_is_archive.hotel_name_en</a></dt>
    <dd>${h_hotels.hotel_country.[$special_is_archive.country_id]}. ${h_hotels.hotel_resort_ru.[$special_is_archive.resort_id]}.</dd>
	<dd>Даты: ^dtf:format[%d.%m.%Y;$special_is_archive.dt_tour_start] &mdash^; ^dtf:format[%d.%m.%Y;$special_is_archive.dt_tour_end]</dd>
	<dd>Кол-во ночей: ^num_decline[$found; $found ночь; $found ночи; <span>$found</span> ночей].</dd>
	<dd>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special_is_archive.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}.</dd>
	$total[^if(^currency.locate[id;$special_is_archive.price_type]){$currency.currency}{}]
	$total_rub[^if($special_is_archive.price){$text(^eval($special_is_archive.price*$total))}{}]
	^if($special_is_archive.price){<dd><span>Стоимость тура в рублях РФ: $text (<em>^int2str:money2str($text) в т.ч. НДС 18%</em>)</span></dd>}{}
	</dl>
	</td>
	</tr>
	}
	</table>
	}{}
	
	</td>
	</tr>
	</table>
	
	
	</td>
	</tr>
	</table>
	</td>
	<td valign="top"  width="25%">
	<div class="filter_hotels">^form_hotels[]</div>
	^banner_right[]
	</td>
</tr>
</table>
#end @hotels[]