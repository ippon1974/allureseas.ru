@title_global[]
$title_global[^MAIN:oSql.table{SELECT (LEFT (hotel_name_en,1)) AS letter FROM full_hotels WHERE is_published = 1 AND country_id = 5 GROUP BY LCASE(LEFT(hotel_name_en,1))}]
^if(^title_global.locate[letter;$form:letter]){$result[Отели на букву $title_global.letter]}{}
#end @title_global[]

@hotels[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$hotel[^db:getHotels[]]
$hotel_[^hotel.select($hotel.country_id==6)]
<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td colspan="2">^all_getalfa[]</td></tr>
<tr><td colspan="2">^hotels_year[]</td></tr>
<tr valign="top"> 
	<td valign="top">
	
	<table>
	<tr><td><h4>Отели на букву &laquo^;$form:letter&raquo^;</td></tr>
	<tr>
	<td>
	^printalfa[]
	</td>
	</tr>
	</table>

	</td>
	<td valign="top" width="25%">
	<div class="filter_hotels">

    </div>
	</td>
</tr>
</table>
#end @hotels[]

@printalfa[]
$catalog[^MAIN:oSql.table{SELECT hotel_id AS id, country_id, hotel_name_en, hotel_rating, hotel_rating_type, resort_id, location, hotel_img_front, building_conservation_date, founded_date FROM full_hotels WHERE LEFT(LCASE(hotel_name_en),1)="$form:letter" AND is_published = 1 ORDER BY hotel_name_en ASC}]
$catalog_cell[^catalog.select($catalog.country_id==6)]
<table class="menu_hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
^catalog.menu{
<tr valign="top">
^if(def $catalog.hotel_img_front){<td width="135px"><a href="/hotels/detal/id/$catalog.id/" title="$catalog.hotel_name_en"><img class="thumb" src="/hotels/img/f/${catalog.hotel_img_front}.jpg" alt="Отель $catalog.hotel_name_en" border="0"></a></td>}{}
<td><p><strong><a href="/hotels/detal/id/$catalog.id/" title="Отель $catalog.hotel_name_en">$catalog.hotel_name_en</a> $catalog.hotel_rating <sup>$h_hotels.hotel_rating_img.[$catalog.hotel_rating_type]</sup></strong><br />
$h_hotels.hotel_country.[$catalog.country_id] $h_hotels.hotel_resort_ru.[$catalog.resort_id]<br/>$catalog.location<br />
^if(def $catalog.founded_date){Построен: $catalog.founded_date г.<br />}{}^if(def $catalog.building_conservation_date){Реконструирован: $catalog.building_conservation_date г.}{}</p>
</td>
</tr>
}
</table>
#@printalfa[]

@hotels_year[]
<div class="year_hotels">
	<p>Год основания отеля:</p>
	^h_hotels_.date.foreach[key;value]{^if(^hotel_.locate[founded_date;$value]){<span ^if($form:founded==$value){class="active"}{}><a href="/hotels/year/founded/$value/" title="Отели построенные в $value году"><strong>$value</strong></a></span>^#0A|&nbsp^;}}{^#0A}
</div>
#@hotels_year[]