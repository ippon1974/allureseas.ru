@paramCountryId[]
$str[$request:uri] 
$parts[^str.split[/;lh]]
$paramCountryId[^table::load[/sections_new_parent.cfg]]
^if(^paramCountryId.locate[item;$parts.3]){$paramCountryId.country_id}{}
#@paramCountryId[]

@paramCountryItem[]
$str[$request:uri] 
$parts[^str.split[/;lh]]
$paramCountryItem[^table::load[/sections_new_parent.cfg]]
^if(^paramCountryItem.locate[item;$parts.3]){$result[$paramCountryItem.item]}{}
#@paramCountryItem[]


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
	
	<table width="100%">
	<tr>
	<td>^hotels_year[]</td>
	</tr>
	<tr>
	<td>^hotels_resort[]</td>
	</tr>
	<tr>
	<td><p></p></td>
	</tr>
	<tr>
	<td>
	<span class="all_hotels"><a href="/region/country/$h_hotels.item_country.[$hotel_.country_id]/hotels/allhotels/" title="Все отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] одним списком">Все отели $h_hotels.hotel_country_hotel_special.[$hotel_.country_id] одним списком</a></span>
	<p>^scroller_misha[]</p></td>
	</tr>
	<tr>
	<td>
	
	<table border="0" cellpadding="0" cellspacing="0" width="98%">
	<tr valign="top">
	<td width="">
	<table class="menu_hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
	^news.menu{
	<tr valign="top">
	^if(def $news.hotel_img_front){<td width="135px" valign="top"><a href="/hotels/detal/id/$news.id/" title="$news.hotel_name_en"><img class="thumb" src="/hotels/img/f/${news.hotel_img_front}.jpg" alt="Отель $news.hotel_name_en" border="0"></a></td>}{}
	<td valign="top"><p><strong><a href="/hotels/detal/id/$news.id/" title="Отель $news.hotel_name_en">$news.hotel_name_en</a> $news.hotel_rating <sup>$h_hotels.hotel_rating_img.[$news.hotel_rating_type]</sup></strong><br />
	$h_hotels.hotel_country.[$news.country_id] $h_hotels.hotel_resort_ru.[$news.resort]<br/>$news.location<br />
	^if(def $news.founded_date){Построен: $news.founded_date г.<br />}{}^if(def $news.building_conservation_date){Реконструирован: $news.building_conservation_date г.}{}</p>
	</td>
	</tr>
	}
	</table>
	
	</td>
	
	<td width="30%">
	^if($special_is_archive){
	<table class="menu_hotels_all_special">
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
	</table>}{}

	</td>
	</tr>
	</table>
	
	</td>
	</tr>
	<tr>
	<td><p>^scroller_misha[]</p></td>
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

@scroller_misha[]
$newscount(^MAIN:oSql.int{
	SELECT
		COUNT(*)
	FROM
		full_hotels
	WHERE
		is_published = 1 AND country_id = ^paramCountryId[]
})
$items(15)
$opage[^scroller::init[$newscount;$items;page]]
^opage.print[
	$.target_url[/region/country/^paramCountryItem[]/hotels/]
	$.nav_count(10)
	$.mode[html]
]
$news[^MAIN:oSql.table{
	SELECT
		hotel_id AS id,
		country_id,
		resort_id AS resort,
		hotel_name_en,
		hotel_name_ru,
		hotel_rating,
		hotel_rating_type,
		recommends,
		exclusive,
		founded_date,
		location,
		size,
		phone_fax,
		website,
		building_conservation_date,
		hotel_img_front
	FROM
		full_hotels
	WHERE
		is_published = 1 AND country_id = ^paramCountryId[]
		^if(^hParam.id.int(0)){
	AND hotel_id = ^hParam.id.int(0)
		}
}[
	$.offset($opage.offset)
	$.limit($opage.limit)
]]
#end @scroller_misha[]


@form_hotels[]
$WW[^db:getHotels[]]
$WW_[^WW.select($WW.country_id==^paramCountryId[])]

^if(def $form:resort_id){
$WW_[^WW.select($WW.resort==$form:resort)]
}{}

<form action="/region/country/^paramCountryItem[]/hotels/result_select/" method="get" enctype="multipart/form-data">
<fieldset>

<p><strong>Курорты</strong></p>
^h_hotels_.hotel_resort_ru.foreach[key;value]{
		^if(^WW_.locate[resort;$key]){
		
				^if($form:resort==$key){<input type="Radio" value="$key" name="resort" checked />— $value}{<input type="Radio" value="$key" name="resort" /> $value}<br />
		}{}
	}
<br>

<p><strong>Звезды</strong></p>
^h_hotels_.hotel_rating.foreach[key;value]{
		^if(^WW_.locate[hotel_rating_type;$key]){
		
		^if($form:hotel_rating_type==$key){<input type="Radio" value="$key" name="hotel_rating_type" checked />— $value}{<input type="Radio" value="$key" name="hotel_rating_type" /> $value}<br />
		
		}{}
	}
<br />

<p><strong>Отели по системе</strong></p>
^h_hotels_.hotel_power.foreach[key;value]{
		
		^if(^WW_.locate[power_full_board;$key]){
		^if($form:power_full_board==$key){<input type="Checkbox" value="$key" name="power_full_board" checked />}{<input type="Checkbox" value="$key" name="power_full_board" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_bed_breakfast;$key]){
		^if($form:power_bed_breakfast==$key){<input type="Checkbox" value="$key" name="power_bed_breakfast" checked />}{<input type="Checkbox" value="$key" name="power_bed_breakfast" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_half_board;$key]){
		^if($form:power_half_board==$key){<input type="Checkbox" value="$key" name="power_half_board" checked />}{<input type="Checkbox" value="$key" name="power_half_board" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_all_inclusive;$key]){
		^if($form:power_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_golden_all_inclusive;$key]){
		^if($form:power_golden_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_golden_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_golden_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_ultra_all_inclusive;$key]){
		^if($form:power_ultra_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_ultra_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_ultra_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_extra_all_inclusive;$key]){
		^if($form:power_extra_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_extra_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_extra_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_deluxe_all_inclusive;$key]){
		^if($form:power_deluxe_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_deluxe_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_deluxe_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_imperial_all_inclusive;$key]){
		^if($form:power_imperial_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_imperial_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_imperial_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_premium_all_inclusive;$key]){
		^if($form:power_premium_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_premium_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_premium_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_royal_all_inclusive;$key]){
		^if($form:power_royal_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_royal_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_royal_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_superior_all_inclusive;$key]){
		^if($form:power_superior_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_superior_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_superior_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_elite_all_inclusive;$key]){
		^if($form:power_elite_all_inclusive==$key){<input type="Checkbox" value="$key" name="power_elite_all_inclusive" checked />}{<input type="Checkbox" value="$key" name="power_elite_all_inclusive" />} $value<br />
		}{}
		
		^if(^WW_.locate[power_only_bed;$key]){
		^if($form:power_only_bed==$key){<input type="Checkbox" value="$key" name="power_only_bed" checked />}{<input type="Checkbox" value="$key" name="power_only_bed" />} $value<br />
		}{}
		
	}
<br />

<p><input type="submit"></p>
</fieldset>
</form>
#end @form_hotels[]

@getalfa[]
^hHotDesc[]
$al[^MAIN:oSql.table{SELECT (LEFT (hotel_name_en,1)) AS letter FROM full_hotels WHERE is_published = 1 AND country_id = ^paramCountryId[] GROUP BY LCASE(LEFT(hotel_name_en,1))}]
^al.sort{$al.letter}
<table class="abc" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
^al.menu{
       <td>^if($form:letter eq $al.letter){<a class="act" href="/region/country/^paramCountryItem[]/hotels/abc/letter/$al.letter/" title="Отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] на букву $al.letter">$al.letter</a>}{<a href="/region/country/^paramCountryItem[]/hotels/abc/letter/$al.letter/" title="Отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] на букву $al.letter">$al.letter</a>}</td>
}</tr>
</table>
#@getalfa[]

@hotels_year[]
<div class="year_hotels">
	<p>Год основания отеля:</p>
	^h_hotels_.date.foreach[key;value]{^if(^hotel_.locate[founded_date;$value]){<span ^if($form:founded==$value){class="active"}{}><a href="/region/country/^paramCountryItem[]/hotels/year/founded/$value/" title="Отели $h_hotels.hotel_country_hotel.[$hotel_.country_id] построенные в $value году"><strong>$value</strong></a></span>^#0A|&nbsp^;}}{^#0A}
</div>
#@hotels_year[]

@hotels_resort[]
<div class="year_hotels">
	<p>Отели в курортных зонах $h_hotels.hotel_country_hotel.[$hotel_.country_id]</p>
	^h_hotels_.hotel_resort_ru.foreach[key;value]{^if(^hotel_.locate[resort;$key]){<span ^if($form:resort==$key){class="active"}{}><a href="/region/country/$h_hotels.item_country.[$hotel_.country_id]/hotels/result_select/resort/$key/" title="Курорт $value"><strong>$value</strong></a></span>^#0A|&nbsp^;}}{^#0A}
</div>
#@hotels_resort[]