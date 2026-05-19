@title_global[]
^hHotDesc[]
$hotel[^db:getHotels[]]
$hotel_[^hotel.select($hotel.country_id==^paramCountryId[])]
$title_global[^MAIN:oSql.table{SELECT (LEFT (hotel_name_en,1)) AS letter FROM full_hotels WHERE is_published = 1 AND country_id = ^paramCountryId[] GROUP BY LCASE(LEFT(hotel_name_en,1))}]
^if(^title_global.locate[letter;$form:letter]){$result[Отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] на букву $title_global.letter]}{}
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
<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td colspan="2">^getalfa[]</td></tr>
<tr valign="top"> 
	<td valign="top">
	
	<table>
	<tr>
	<td>
	<h4>Отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] на букву &laquo^;$form:letter&raquo^;
	</td>
	</tr>
	<tr>
	<td>
	^printalfa[]
	</td>
	</tr>
	</table>

	</td>
	<td valign="top" width="25%">
	<div class="filter_hotels">
    ^form_hotels[]
    </div>
	^banner_right[]
	</td>
</tr>
</table>
#end @hotels[]

@printalfa[]
$catalog[^MAIN:oSql.table{SELECT hotel_id AS id, country_id, hotel_name_en, hotel_rating, hotel_rating_type, resort_id, location, hotel_img_front, building_conservation_date, founded_date FROM full_hotels WHERE LEFT(LCASE(hotel_name_en),1)="$form:letter" AND is_published = 1 ORDER BY hotel_name_en ASC}]
$catalog_cell[^catalog.select($catalog.country_id==^paramCountryId[])]

<table border="0">
<tr valign="top">
	<td width="60%">
	<table class="menu_hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
^catalog_cell.menu{
<tr valign="top">
^if(def $catalog_cell.hotel_img_front){<td width="135px"><a href="/hotels/detal/id/$catalog_cell.id/" title="$catalog_cell.hotel_name_en"><img class="thumb" src="/hotels/img/f/${catalog_cell.hotel_img_front}.jpg" alt="Отель $catalog_cell.hotel_name_en" border="0"></a></td>}{}
<td><p><strong><a href="/hotels/detal/id/$catalog_cell.id/" title="Отель $catalog_cell.hotel_name_en">$catalog_cell.hotel_name_en</a> $catalog_cell.hotel_rating <sup>$h_hotels.hotel_rating_img.[$catalog_cell.hotel_rating_type]</sup></strong><br />
$h_hotels.hotel_country.[$catalog_cell.country_id] $h_hotels.hotel_resort_ru.[$catalog_cell.resort_id]<br/>$catalog_cell.location<br />
^if(def $catalog_cell.founded_date){Построен: $catalog_cell.founded_date г.<br />}{}^if(def $catalog_cell.building_conservation_date){Реконструирован: $catalog_cell.building_conservation_date г.}{}</p>
</td>
</tr>
}
</table>
	
	</td>
	<td>
	
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


#@printalfa[]