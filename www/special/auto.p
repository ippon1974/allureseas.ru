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
$cookie[^db:getCookie[]]
$cookie_select[^cookie.select($cookie.uin eq "$cookie:special")]
<table class="special" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr valign="top">
<td class="special_left" width="15%">
<div class="special_left_div">
^special_left_nav_country[]
<br />
^special_left_nav_img[]
$now[^date::now[]]
</div>
</td>
	<td class="special_center">
	<div class="special_center_list">
	<h1 class="fontheader">^title_global[] на $now.year год</h1>
	^special.sort{$special.dt_tour_valid}
	^special.menu{
	 $found_human($special.human_count)
     $found_human_child($special.child_count)
	 $last_update[^date::create[$special.dt_tour_valid]]
	
	^if(!$special.is_archive == 1){
	<dl>
	<dt>Спецпредложение № $special.id (${h_hotels.hotel_country.[$special.country_id]}. ${h_hotels.hotel_resort_ru.[$special.resort_id]}.)</dt>
	<dd class="hotel_detal"><a href="/special/detal/id/$special.id/" title="Отель $special.hotel_name_en">Отель $special.hotel_name_en</a><sup>$h_hotels.hotel_rating_img.[$special.hotel_rating_id]</sup></dd>
	$total[^if(^currency.locate[id;$special.price_type]){$currency.currency}{}]
	$total_rub[^if($special.price){$text(^eval($special.price*$total))}{}]
	^if($special.price){<dd class="dt"><span>Стоимость тура в рублях РФ: $text (<em>^int2str:money2str($text) в т.ч. НДС 18%</em>)</span></dd>}{}
	^if(def $special.hotel_power){<dd class="hotel_power"><span>^untaint[as-is]{$special.hotel_power}</span></dd>}{}
	<dd><span>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</span></dd>
	^if($special.night_count){<dd class="dt"><span>Кол-во ночей: $special.night_count</span></dd>}{}
	^if($special.dt_tour_start eq "0000-00-00 00:00:00"){}{<dd class="dt"><span>Дата вылета туда: ^dtf:format[%d.%m.%Y;$special.dt_tour_start]</span></dd>}
    ^if($special.dt_tour_end eq "0000-00-00 00:00:00"){}{<dd class="dt"><span>Дата вылета обратно: ^dtf:format[%d.%m.%Y;$special.dt_tour_end]</span></dd>}
	^if($special.dt_tour_valid eq "0000-00-00 00:00:00"){}{	^if($last_update <= $now){<dd class="actual_end"><span>Предложение не актуально!</span></dd>}{^if($last_update > $now){^if($last_update > $new_after){<dd class="actual"><span>Предложение актуально до: ^dtf:format[%d.%m.%Y;$special.dt_tour_valid]</span></dd>}{<dd class="actual_red"><span>Предложение актуально до: ^dtf:format[%d.%m.%Y;$special.dt_tour_valid]</span></dd>}}{}}}
	^if($special.is_generation == 1){<dd class="dd_pdf"><span><a class="pdf" href="/php/class/mpdf/?id=$special.id" title="Скачать cпецпредложение № $special.id в формате PDF отель $special.hotel_name_en">Скачать cпецпредложение № $special.id в формате PDF</a></span></dd>}{}
	<dd class="end"></dd>
	</dl>
	}{}
	
	
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

@special_left_nav_country[]
$str[$request:uri] 
$parts[^str.split[/;lh]]
<div class="special_left_nav_country">
^if($request:uri eq "/special/"){<p><strong>Спецпредложения</strong></p>}{<p><a href="/special/" title="Все спецпредложения">Спецпредложения</a></p>}
^h_hotels_.hotel_country_hotel_special.foreach[key;value]{
    <ul>
	^if(^special.locate[country_id;$key]){
	^if($h_hotels_.item_country.[$key] eq $parts.2){<li><strong>Предложения по $value</strong></li>}{<li><a href="/special/$h_hotels_.item_country.[$key]/" title="Спецпредложения по $value">Предложения по $value</a></li>}
	}{}
	</ul>
}
</div>
#@special_left_nav_country[]

@special_left_nav_img[]
$str_special[$request:uri] 
$parts_str_special[^str_special.split[/;lh]]
<div class="special_left_nav_img">
^h_hotels_.hotel_country_hotel_special.foreach[key;value]{
	^if(^special.locate[country_id;$key]){
	^if($h_hotels_.item_country.[$key] eq $parts_str_special.2){<img src="/img/flag/small/activ/${h_hotels.country_flag.[$special.country_id]}.jpg" alt="Спецпредложения по $h_hotels.hotel_country_hotel_special.[$key]">}{<a href="/special/$h_hotels_.item_country.[$key]/"><img src="/img/flag/small/${h_hotels.country_flag.[$special.country_id]}.jpg" alt="Спецпредложения по $h_hotels.hotel_country_hotel_special.[$key]"></a>}
	}{}
	
}
</div>
#@special_left_nav_img[]

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



@getCalendar[lparams][params]
$params[^hash::create[$lparams]]
$result[^MAIN:oSql.sql[table]{
	SELECT
		^MAIN:oSql.month[dt_tour_start] AS month,
		^MAIN:oSql.year[dt_tour_start] AS year
	FROM
		special
	WHERE
		is_published = 1 AND
		dt_tour_start <= ^MAIN:oSql.now[]
	GROUP BY
		year DESC,
		month DESC
}]
#end @getCalendar[]

@printCalendar[calendar][now;curr_year;curr_month;y_hash;ym_hash;i;m]
^if($calendar){
	$now[^date::now[]]
	$curr_year(^form:year.int(^dtf:format[%Y]))
	$curr_month(^form:month.int(^dtf:format[%m]))

	^calendar.offset(-1)
	$min_year($calendar.year)
	$min_month($calendar.month)

	$y_hash[^calendar.hash[year;year][$.distinct(1)]]
	$ym_hash[^calendar.hash{^calendar.year.format[%04d]=^calendar.month.format[%02d]}[month][$.distinct(1)]]
	$year[^y_hash._keys[]]
	^year.sort($year.key)[desc]

	<table class="tcalendar" border="0" width="90%">
	<tr valign="top">
	<td>
	^year.menu{
		<strong>^if($year.key == $curr_year){
				$year.key &nbsp^;
				}{
					^rem{ *** если кликнем в год, по попадем на последний месяц года, 
						за который у нас есть новости *** }
					^if(^calendar.locate[year;$year.key]){}
					<a href="/special/year/$year.key/month/$calendar.month/">$year.key</a>
				}
				</strong><br />
			}
		</td>
		<td>
			^if(^year.locate[key;$curr_year]){}
#			^year.menu{
#				^if($year.key == $curr_year){
					^for[i](0;11){
						$m(12-$i)
						^if(def $form:month && $m == $curr_month){
							<strong>$dtf:[ri-locale].month.$m</strong><br />
						}{
							^if(!($now.year == $year.key && $m > $now.month) && !($year.key == $min_year && $m < $min_month)){
								^if($ym_hash.[^year.key.format[%04d]=^m.format[%02d]]){
									<a href="/special/year/$year.key/month/$m/">$dtf:[ri-locale].month.$m</a>
								}{
									$dtf:[ri-locale].month.$m
								}
								<br />
							}
						}
					}
#				}
#			}
		</td>
	</tr>
	</table>
}
#end @printCalendar[]

@html_calendar[]
^if(!def $form:id){
	^rem{ *** $form:id не определена: показываем календарь со списком новостей *** }
	^rem{ *** получаем информацию о календаре и выводим его *** }
	$calendar[^getCalendar[$.iArticleTypeId(1)]]
    ^printCalendar[$calendar]
}
#@html_news[]


