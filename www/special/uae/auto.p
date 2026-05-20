@title_global[]
^hHotDesc[]
$title_global[^db:getSpecial[]]
$currency[^db:getCurrency[$.id($title_global.price_type)]]
$title_global_select[^title_global.select($title_global.country_id==6)]
$result[Спецпредложение по ${h_hotels.hotel_country_hotel_special.[$title_global_select.country_id]}.]
#end @title_global[]

@GetSpecial[]
^hHotDesc[]
$h_hotels_[$h_hotels]
$now[^date::now[]]
$new_after[^date::now(+2)]
$currency[^db:getCurrency[]]
$operator[^db:getOperator[]]
$airlines[^db:getAirlines[]]
$airport[^db:getAirport[]]
$special[^db:getSpecial[]]
$special_select[^special.select($special.country_id==6)]
$cookie[^db:getCookie[]]
$cookie_select[^cookie.select($cookie.uin eq "$cookie:special")]

<table class="special" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr valign="top">
<td class="special_left" width="15%">
<div class="special_left_div">
^special_left_nav_country[]
<br />
^special_left_nav_img[]
</div>
</td>
	<td class="special_center">
	
	<div class="special_center_list">
		<div class="center_div_nav_sub"><a href="/special/" title="Все спецпредложения">&#8592^; Спецпредложения</a> / $h_hotels.hotel_country.[$special_select.country_id]</div>
	<h1 class="fontheader_spec">Спецпредложения по $h_hotels.hotel_country_hotel_special.[$special_select.country_id] <img src="/img/flag/small/${h_hotels.country_flag.[$special_select.country_id]}.jpg" alt="" border="0"></h1>
	
	^special_select.sort{$special_select.dt_tour_valid}
	^special_select.menu{
	 $found_human($special_select.human_count)
     $found_human_child($special_select.child_count)
	 $last_update[^date::create[$special_select.dt_tour_valid]]
	 
	^if(!$special_select.is_archive == 1){
	<dl>
	<dt>Спецпредложение № $special_select.id (${h_hotels.hotel_country.[$special_select.country_id]}. ${h_hotels.hotel_resort_ru.[$special_select.resort_id]}.)</dt>
	<dd class="hotel_detal"><a href="/special/detal/id/$special_select.id/" title="Отель $special_select.hotel_name_en">Отель $special_select.hotel_name_en</a><sup>$h_hotels.hotel_rating_img.[$special_select.hotel_rating_id]</sup></dd>
	$total[^if(^currency.locate[id;$special_select.price_type]){$currency.currency}{}]
	$total_rub[^if($special_select.price){$text(^eval($special_select.price*$total))}{}]
	^if($special_select.price){<dd class="dt"><span>Стоимость тура в рублях РФ: $text (<em>^int2str:money2str($text) в т.ч. НДС ^ndc[]</em>)</span></dd>}{}
	^if(def $special_select.hotel_power){<dd class="hotel_power"><span>^untaint[as-is]{$special_select.hotel_power}</span></dd>}{}
	<dd><span>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special_select.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</span></dd>
	^if($special_select.night_count){<dd class="dt"><span>Кол-во ночей: $special_select.night_count</span></dd>}{}
	^if($special_select.dt_tour_start eq "0000-00-00 00:00:00"){}{<dd class="dt"><span>Дата вылета туда: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_start]</span></dd>}
    ^if($special_select.dt_tour_end eq "0000-00-00 00:00:00"){}{<dd class="dt"><span>Дата вылета обратно: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_end]</span></dd>}
	^if($special_select.dt_tour_valid eq "0000-00-00 00:00:00"){}{	^if($last_update <= $now){<dd class="actual_end"><span>Предложение не актуально!</span></dd>}{^if($last_update > $now){^if($last_update > $new_after){<dd class="actual"><span>Предложение актуально до: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_valid]</span></dd>}{<dd class="actual_red"><span>Предложение актуально до: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_valid]</span></dd>}}{}}}
	^if($special_select.is_generation == 1){<dd class="dd_pdf"><span><a class="pdf" href="/php/class/mpdf/?id=$special_select.id" title="Скачать cпецпредложение № $special_select.id в формате PDF отель $special_select.hotel_name_en">Скачать cпецпредложение № $special_select.id в формате PDF</a></span></dd>}{}
	<dd class="end"></dd>
	</dl>}{}
	}
	</div>
	
	</td>
<td class="special_right" width="20%">
	<div class="div_special_right">
	^history_browsing[]
	</div>
</td>
</tr>
</table>
#GetSpecial[]



@history_browsing[]
^if($cookie_select){
	<div class="history_browsing">
	<p>Просмотренные вами специальные предложения за последние 24 часа</p>
	^cookie_select.menu{
	<dl>
	^special.menu{
	^if($cookie_select.special_id == $special.id){
	^if($special.id==$form:id){}{
	 $found_human($special.human_count)
     $found_human_child($special.child_count)
	 $total[^if(^currency.locate[id;$special.price_type]){$currency.currency}{}]
	 <dt><a href="/special/detal/id/$special.id/" title="Спецпредложение в отель $special.hotel_name_en">$special.hotel_name_en</a></dt>
	 <dd>${h_hotels.hotel_country.[$special.country_id]}. ${h_hotels.hotel_resort_ru.[$special.resort_id]}.</dd>
     <dd>Кол-во ночей: ^if($special.night_count){$special.night_count}{}</dd>
	 <dd>Даты: ^dtf:format[%d.%m.%Y;$special.dt_tour_start] &ndash^; ^dtf:format[%d.%m.%Y;$special.dt_tour_end]</dd>
	 <dd><span>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</span></dd>
     ^if($special.price){<dd>Стоимость тура: ^eval($special.price*$total) рубли РФ.</dd>}{}
	
	 }
	 
	}
                 }
	</dl>
	}
	</div>
}{}
#@history_browsing[]






