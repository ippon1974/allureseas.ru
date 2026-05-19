@title_global[]
^hHotDesc[]
$hotels_[^db:getHotels[]]
$hotel[^hotels_.select($hotels_.country_id==^paramCountryId[])]
$result[Отели $h_hotels.hotel_country_hotel.[$hotel.country_id] ^if(def $form:resort){^if(^hotels_.locate[resort;$form:resort]){/ $h_hotels.hotel_resort_ru.[$hotels_.resort]}{}} ^if(def $form:hotel_rating_type){^if(^hotels_.locate[hotel_rating_type;$form:hotel_rating_type]){/ $h_hotels.hotel_rating.[$hotels_.hotel_rating_type]}{}}]
#end @title_global[]

@hotels[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$currency[^db:getCurrency[]]
$special[^db:getSpecial[]]
$special_country[^special.select($special.country_id==^paramCountryId[])]
$special_is_archive[^special_country.select($special_country.is_archive==0)]
$hotels[^db:getHotels[]]
$hotels_[^hotels.select($hotels.country_id==^paramCountryId[])]
$hotels_resort[^hotels.select($hotels.country_id==^paramCountryId[])]

^if(def $form:resort){
$hotels_[^hotels_.select($hotels_.resort==$form:resort)]
}{}

^if(def $form:hotel_rating_type){
$hotels_[^hotels_.select($hotels_.hotel_rating_type==$form:hotel_rating_type)]
}{}

^if(def $form:power_full_board){
$hotels_[^hotels_.select($hotels_.power_full_board==$form:power_full_board)]
}{}

^if(def $form:power_bed_breakfast){
$hotels_[^hotels_.select($hotels_.power_bed_breakfast==$form:power_bed_breakfast)]
}{}

^if(def $form:power_half_board){
$hotels_[^hotels_.select($hotels_.power_half_board==$form:power_half_board)]
}{}

^if(def $form:power_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_all_inclusive==$form:power_all_inclusive)]
}{}

^if(def $form:power_golden_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_golden_all_inclusive==$form:power_golden_all_inclusive)]
}{}

^if(def $form:power_ultra_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_ultra_all_inclusive==$form:power_ultra_all_inclusive)]
}{}

^if(def $form:power_deluxe_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_deluxe_all_inclusive==$form:power_deluxe_all_inclusive)]
}{}

^if(def $form:power_extra_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_extra_all_inclusive==$form:power_extra_all_inclusive)]
}{}

^if(def $form:power_imperial_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_imperial_all_inclusive==$form:power_imperial_all_inclusive)]
}{}

^if(def $form:power_premium_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_premium_all_inclusive==$form:power_premium_all_inclusive)]
}{}

^if(def $form:power_royal_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_royal_all_inclusive==$form:power_royal_all_inclusive)]
}{}

^if(def $form:power_superior_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_superior_all_inclusive==$form:power_superior_all_inclusive)]
}{}

^if(def $form:power_elite_all_inclusive){
$hotels_[^hotels_.select($hotels_.power_elite_all_inclusive==$form:power_elite_all_inclusive)]
}{}

^if(def $form:power_only_bed){
$hotels_[^hotels_.select($hotels_.power_only_bed==$form:power_only_bed)]
}{}

^if(def $form:founded_date){
$hotels_[^hotels_.select($hotels_.founded_date==$form:founded_date)]
}{}
<table id="hotels" border="0" cellpadding="4" cellspacing="6" width="90%">
<tr><td colspan="2">^getalfa[]</td></tr>
<tr valign="top"> 
	<td valign="top">
	
	<table>
	<tr>
	<td>
	^resort_hotels_cell[]
	</td>
	</tr>
	<tr><td><h4>^head_result_cell[]</td></tr>
	<tr>
	<td>
	
	<table border="0">
    <tr valign="top">
	<td width="70%">
	<table class="menu_hotels" border="0" cellpadding="2" cellspacing="4" width="100%">
	^if($hotels_){
	^hotels_.sort{$hotels_.hotel_name_en}
	^hotels_.menu{
	<tr valign="top">
	^if(def $hotels_.hotel_img_front){<td width="135px"><a href="/hotels/detal/id/$hotels_.id/" title="$news.hotel_name_en"><img class="thumb" src="/hotels/img/f/${hotels_.hotel_img_front}.jpg" alt="Отель $hotels_.hotel_name_en" border="0"></a></td>}{}
	<td><p><strong><a href="/hotels/detal/id/$hotels_.id/" title="Отель $hotels_.hotel_name_en">$hotels_.hotel_name_en</a> $hotels_.hotel_rating <sup>$h_hotels.hotel_rating_img.[$hotels_.hotel_rating_type]</sup></strong><br />
	$h_hotels.hotel_country.[$hotels_.country_id] $h_hotels.hotel_resort_ru.[$hotels_.resort]<br/>$hotels_.location<br />
	^if(def $hotels_.founded_date){Построен: $hotels_.founded_date г.<br />}{}^if(def $hotels_.building_conservation_date){Реконструирован: $hotels_.building_conservation_date г.}{}</p>
	</td>
	</tr>
}
}{Нет данных}
</table>
</td>
<td>

^if($special_is_archive){
	<table align="center" class="menu_hotels_all_special" border="0" width="90%">
	<tr><th><a href="/special/" title="Все спецпредложения">Все спецпредложения</a> | <a href="/special/$h_hotels.item_country.[$special_is_archive.country_id]/" title="Спецпредложения по $h_hotels.hotel_country_hotel_special.[$special_is_archive.country_id]">Спецпредложения по $h_hotels.hotel_country_hotel_special.[$special_is_archive.country_id]</a></th></tr>
	
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
	<td valign="top" width="25%">
	<div class="filter_hotels">
    ^form_hotels[]
    </div>
	^banner_right[]
	</td>
</tr>
</table>
#end @hotels[]

@head_result_cell[]
^hHotDesc[]
<div class="head_result_cell">
<a href="/hotels/">Отели</a> / <a href="/region/country/$h_hotels.item_country.[$hotels_.country_id]/hotels/">$h_hotels.hotel_country.[$hotels_.country_id]</a> ^if(def $form:resort){/ $h_hotels.hotel_resort_ru.[$hotels_.resort]} ^if(def $form:hotel_rating_type){/ $h_hotels.hotel_rating.[$hotels_.hotel_rating_type]}
^if(def $form:power_full_board || def $form:power_bed_breakfast || def $form:power_half_board || def $form:power_all_inclusive || def $form:power_golden_all_inclusive || def $form:power_ultra_all_inclusive || def $form:power_extra_all_inclusive || def $form:power_deluxe_all_inclusive || def $form:power_imperial_all_inclusive || def $form:power_premium_all_inclusive || def $form:power_royal_all_inclusive || def $form:power_superior_all_inclusive || def $form:power_elite_all_inclusive){
^if(def $form:power_full_board){<p><strong>$h_hotels.hotel_power.[$hotels_.power_full_board]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_full_board]</p>}{}
^if(def $form:power_bed_breakfast){<p><strong>$h_hotels.hotel_power.[$hotels_.power_bed_breakfast]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_bed_breakfast]</p>}{}
^if(def $form:power_half_board){<p><strong>$h_hotels.hotel_power.[$hotels_.power_half_board]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_half_board]</p>}{}
^if(def $form:power_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_all_inclusive]</p>}{}
^if(def $form:power_golden_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_golden_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_golden_all_inclusive]</p>}{}
^if(def $form:power_ultra_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_ultra_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_ultra_all_inclusive]</p>}{}
^if(def $form:power_extra_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_extra_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_extra_all_inclusive]</p>}{}
^if(def $form:power_deluxe_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_deluxe_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_deluxe_all_inclusive]</p>}{}
^if(def $form:power_imperial_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_imperial_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_imperial_all_inclusive]</p>}{}
^if(def $form:power_premium_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_premium_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_premium_all_inclusive]</p>}{}
^if(def $form:power_royal_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_royal_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_royal_all_inclusive]</p>}{}
^if(def $form:power_superior_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_superior_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_superior_all_inclusive]</p>}{}
^if(def $form:power_elite_all_inclusive){<p><strong>$h_hotels.hotel_power.[$hotels_.power_elite_all_inclusive]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_elite_all_inclusive]</p>}{}
^if(def $form:power_only_bed){<p><strong>$h_hotels.hotel_power.[$hotels_.power_only_bed]</strong><br />$h_hotels.hotel_power_desc.[$hotels_.power_only_bed]</p>}{}
}{}
</div>
#end @head_result_cell[]

@resort_hotels_cell[]
<div class="resort_hotels">
<p>Отели в курортных зонах $h_hotels.hotel_country_hotel.[$hotels_.country_id]</p>
	^h_hotels_.hotel_resort_ru.foreach[key;value]{^if(^hotels_resort.locate[resort;$key]){^if($form:resort==$key){<span><strong>$value</strong></span>}{<span><a href="/region/country/$h_hotels.item_country.[$hotels_resort.country_id]/hotels/result_select/resort/$key/" title="Курорт $value"><strong>$value</strong></a></span>}^#0A|&nbsp^;}{}}{^#0A}
</div>
#@resort_hotels_cell[]
