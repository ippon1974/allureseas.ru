@auto[]
$connect_string[mysql://u545600_allurese:4_2In_EsTsy@u545600.mysql.masterhost.ru/u545600_allureseas?charset=cp1251]

^rem{*** Go ***}
$sWorkingDir[^file:dirname[$request:uri]]
$sCurrentFile[^file:basename[$request:uri]]

$request:charset[windows-1251]
$response:charset[windows-1251]
$response:content-type[
	$.value[text/html]
	$.charset[$response:charset]
]

$hAntiSpamParams[
	^rem{ *** каталог, где будут hashfile и log. должен быть вне веб пространства. по умолчанию -- /../temp *** }
	$.sDataDir[/../tempallure]

	^rem{ *** что пишем в log файл. подробнее про константы можно посмотреть в переменной класса LOG_MASK *** }
	$.iLogAccess(1+2+16+32)

	$.hExpires[
		^rem{ *** на сколько баним спамера (в днях). по умолчанию -- 0 (не баним) *** }
		$.dBan(1/24)
	]

	$.hReferer[
		^rem{ *** запрещать работу с пустым referer. по умолчанию -- false, т.е. работа с пустым referer разрешена *** }
#		$.bRefuseEmpty(true)

		^rem{ *** список разрешённых referer при отображения формы *** }
#	$.print[^table::create{sHref^#0A$sWorkingDir/$sCurrentFile}]
		^rem{ *** список разрешённых referer при обработке submt-а формы *** }
#	$.exec[^table::create{sHref^#0A$sWorkingDir/$sCurrentFile}]
	]

#	$.hFields[
		^rem{ *** при отображении формы будем ругаться, если в form будут обнаружены не упомянутые в <form/> поля. по умолчанию -- true *** }
#		$.bRefuseUnknown(true)
		^rem{ *** но мы можем перечислить не упомянутые в <form/> поля, которым разрешено приходить в form, хотя они отсутствуют в <form/> *** }
#		$.tAllowed[^table::create{sName^#0Arequest^#0Alang}]
#	]

	$.hFilter[
		^rem{ *** порог срабатывания защиты *** }
		$.dThreshold(20)
		^rem{ *** список фильтров и их весов, которыми проверяются все поля формы при submit-е данных *** }
		$.tMask[^table::create{dScore	sRegexp
1	<a href=[^^>]+>
3	\sWMZ\s
3	Z\d{12}
}]
	]

	^rem{ *** дополнительное поле с uid будет добавляться с указанными параметрами *** }
#	$.hUid[
#		$.sTag[input]
#		$.sName[uid]
#	]

	^rem{ *** модифицирование action формы *** }
	$.hAction[
#		$.sType[hidden]
		^rem{ *** настоящая кнопка action должна быть обязательно нажата (нельзя постить форму нажатием Enter-а в текстовом поле). по умолчанию -- true *** }
#		$.bRealRequired(true)

		^rem{ *** первый action всегда будет фиктивным. по умолчанию -- true *** }
#		$.bFakeFirst(true)

		^rem{ *** сколько фиктивных кнопок будет добавлено. по умолчанию 0, т.е. фиктивных кнопок добавлено не будет *** }
		$.iFakeCount(3)

		^rem{ *** эти атрибуты будут добавлены к настоящему submit-у *** }
		^rem{ *** тут вы можете использовать junction: $.value{^method[]} *** }
		$.hRealAttr[
			$.class[real]
			$.value[[+]]
		]

		^rem{ *** а эти атрибуты будут добавлены к фиктивным submit-полям *** }
		$.hFakeAttr[
			$.class[fake]
			$.value[[-]]
		]
	]

	^rem{ *** ************************************************************************************ *** }
	^rem{ *** далее идут параметры, нужные классам AntispamTuringMath и/или AntispamTuringCaptcha  *** }

	^rem{ *** в поле form с этим именем будет ожидать получения от пользователя результата теста Тюринга. по умолчанию -- "result" *** }
#	$.sTuringAnswerFieldName[result]

	^rem{ *** каталог, в котором лежат изображения с символами, участвующими в генерации капчи. обязательный параметр *** }
	^rem{ *** этот каталог НЕЛЬЗЯ класть в веб пространство (а если кладёте, то запретите к нему доступ в .htaccess) *** }
	^rem{ *** в каталоге должен быть набор подкаталогов из одного символа. эти символы автоматически будут участвовать в генерации капчи *** }
	^rem{ *** в каждом подкаталоге может быть произвольное число gif файлов. *** }
	^rem{ *** при генерации очередного символа капчи будет использоваться случайный файл *** }
	$.sImageDir[/../data/captcha]

	^rem{ *** количество символов в капче. по умолчанию -- 5 *** }
#	$.iLimit(5)

	^rem{ *** размер изображения капчи. по умолчанию -- 300x25px *** }
#	$.iCaptchaImageWidth(300)
#	$.iCaptchaImageHeight(25)

	^rem{ *** межсимвольное расстояние, px. по умолчанию -- 5 *** }
#	$.iSpaceWidth(5)

	^rem{ *** таблица с используемыми цветами символов. пустая таблица -- не производить замены цветов *** }
#	$.tColor[^table::creare{iColor}]

	^rem{ *** "плотность" шумов в изображении. 0 -- не добавлять шум. по умолчанию -- 30 (каждая 30 точка -- шум) *** }
#	$.iNoiseDensity(30)

	^rem{ *** обрезать изображение по ширине. по умолчанию -- true *** }
#	$.bCropWidth(true)

	^rem{ *** на сколько смещать символы при создании капчи, px. 0 -- не смещать. по умолчанию максимум на 2px в каждую сторону *** }
#	$.iShiftX(2)
#	$.iShiftY(2)

]
#@auto[]

@title_global[]
^hHotDesc[]
$title_global[^db:getSpecial[$.id(^form:id.int(0))]]
$currency[^db:getCurrency[$.id($title_global.price_type)]]
$result[Спецпредложение в отель $title_global.hotel_name_en ${h_hotels.hotel_country.[$title_global.country_id]}. ${h_hotels.hotel_resort_ru.[$title_global.resort_id]}. Стоимость тура: ^eval($title_global.price*$currency.currency) рублей РФ.]
#end @title_global[]

@description_global[]
^hHotDesc[]
$description_global[^db:getSpecial[$.id(^form:id.int(0))]]
$result[^if($h_hotels.hotel_country_hotel_tour.[$description_global.country_id] eq "Мальдивы" || $h_hotels.hotel_country_hotel_tour.[$description_global.country_id] eq "Сейшелы"){Горящие туры на $h_hotels.hotel_country_hotel_tour.[$description_global.country_id]}{Горящие туры в $h_hotels.hotel_country_hotel_tour.[$description_global.country_id]}]
#@description_global[]

@keywords_global[]
^hHotDesc[]
$keywords_global[^db:getSpecial[$.id(^form:id.int(0))]]
$result[$keywords_global.keywords ^if($h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id] eq "Мальдивы" || $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id] eq "Сейшелы"){Горящие туры на $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id]}{Горящие туры в $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id]}]
#@keywords_global[]

@SpecialDetal[]
^if(!def $cookie:special){
$cookie:special[
$.value[^math:uuid[]]
#$.expires[session]
$.expires(1)
 ]
}{}
^hHotDesc[]
$h_hotel_[$h_hotels]
$now[^date::now[]]
$new_after[^date::now(+2)]
$cookie[^db:getCookie[]]
$cookie_select[^cookie.select($cookie.uin eq "$cookie:special")]
$special_[^db:getSpecial[]]
$special[^db:getSpecial[$.id(^form:id.int(0))]]
$operator[^db:getOperator[]]
$operator_detal[^db:getOperator[$.id($special.operator_send_id)]]
$last_update[^date::create[$special.dt_tour_valid]]
$currency_[^db:getCurrency[]]
$currency[^db:getCurrency[$.id($special.price_type)]]

$airport_start_1[^db:getAirport[$.id($special.airport_start_id)]]
$airport_start_2[^db:getAirport[$.id($special.airport_end_id)]]
$airport_start_3[^db:getAirport[$.id($special.airport_start_back_id)]]
$airport_start_4[^db:getAirport[$.id($special.airport_end_back_id)]]

$airline_detal[^db:getAirlines[$.id($special.airlines_id)]]
$hotel_detal[^db:getHotels[$.id($special.hotel_id)]]

$found($special.night_count)
$found_human($special.human_count)
$found_human_child($special.child_count)

$total[^if(^currency.locate[id;$special.price_type]){$currency.currency}{}]
$total_rub[^if($special.price){$text(^eval($special.price*$total))}{}]

<table class="detal_special" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr valign="top">
	<td class="left" width="15%">
	<div>
	^if($special.is_generation == 1){<div class="img_pdf"><a href="/php/class/mpdf/?id=$special.id" title="Скачать спецпредложение по отелю $special.hotel_name_en в формате PDF"><img src="/img/icon/big/icon-pdf.gif" alt="" width="64" height="65" border="0"></a></div>}{}

	
	</div>
	</td>
	<td class="center" width="">
	<div class="center_div">
	

	^if($last_update <= $now){}{^mailform[]}
	

	<div class="center_div_nav_sub"><a href="/special/" title="Все спецпредложения">&#8592^; Спецпредложения</a> / <a href="/special/$h_hotels.item_country.[$special.country_id]/" title="Спецпредложения по $h_hotels.hotel_country_hotel_special.[$special.country_id]">$h_hotels.hotel_country.[$special.country_id]</a></div>
	<span class="spec">Спецпредложение № $special.id (${h_hotels.hotel_country.[$special.country_id]}. ${h_hotels.hotel_resort_ru.[$special.resort_id]}.)</span>
    ^form_bottom_right[]
	<h1>$special.hotel_name_en <sup>$h_hotels.hotel_rating_img.[$special.hotel_rating_id]</sup></h1>
	<h2>Вылет из Москвы <span>[^dtf:format[%d.%m.%Y;$special.dt_tour_start]]</span> на ^num_decline[$found; $found ночь; $found ночи; <span>$found</span> ночей] <span>^eval($special.price*$currency.currency)</span> рублей</h2>
	
    ^if($last_update <= $now){<h3 class="actual_end">Предложение не действительно!</h3>}{^if($last_update > $now){^if($last_update > $new_after){<h3 class="actual"><span>Предложение действительно до: ^dtf:format[%d %h %Y;$special.dt_tour_valid;$dtf:rr-locale]</span></h3>}{<h3 class="actual_red"><span>Предложение действительно до: ^dtf:format[%d %h %Y;$special.dt_tour_valid;$dtf:rr-locale]</span></h3>}}{}}
	
	^if(def $special.description_special){<div class="body"><strong class="header">Подробная информация о спецпредложении</strong><br />^untaint[as-is]{$special.description_special}<hr /></div>}{} 
	
	^blank_hotel_view[]
	^blank_airline_view[]
	^blank_hotel_detal_site_view[]
	</div>
	
	</td>
	<td class="right" width="20%">
	<div class="right_div">
	
#^form_bottom_right[]
	^alternativeSpecResort[]
	^history_browsing[]
	
	</div>
	</td>
</tr>
</table><br /><br /><br />
^if($special){}{^Lib:location[/404/]}
^str_valid[]
#@SpecialDetal[]


@blank_hotel_view[]
^hWeather[]
<br />
<table id="blank_hotel_view" border="0" width="100%">
<tr>
<td class="blank_hotel_view_left">Страна</td>
<td>$h_hotels.hotel_country.[$special.country_id] ($h_hotels.hotel_country_eng.[$special.country_id])</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Курорт</td>
<td>$h_hotels.hotel_resort_ru.[$special.resort_id] ($h_hotels.hotel_resort.[$special.resort_id])</td>
</tr>
^if($special.operator_send_id != 0){
<tr>
<td class="blank_hotel_view_left">Труоператор</td>
<td>^if(def $operator_detal.name_ru){$operator_detal.name_ru}{$operator_detal.name_en}</td>
</tr>
}{}
^if($special.operator_take_id != 0){
<tr>
<td class="blank_hotel_view_left">Встречающая сторона</td>
<td>^if(^operator.locate[id;$special.operator_take_id]){^if(def $operator.name_ru){$operator.name_ru}{$operator.name_en}}{}</td>
</tr>
}{}
<tr>
<td class="blank_hotel_view_left">Туристы</td>
<td>^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Отель</td>
<td class="hotel_links"><a href="/hotels/detal/id/$special.hotel_id/" title="Подробная информация об отеле: $special.hotel_name_en" target="_blank">$special.hotel_name_en</a></td>
</tr>
<tr>
<td class="blank_hotel_view_left">Дата прибытия в отель</td>
<td>
$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_start]]
$parts[^str.split[ ;lh]]
$parts.0 ($h_weather.day_names_long.[$parts.1])
</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Дата отправления из отеля</td>
<td>
$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_end]]
$parts[^str.split[ ;lh]]
$parts.0 ($h_weather.day_names_long.[$parts.1])
</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Ночей</td>
<td>^num_decline[$found; $found ночь; $found ночи; $found ночей]</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Система питания</td>
<td>^untaint[as-is]{$special.hotel_power}</td>
</tr>
<tr>
<td class="blank_hotel_view_left">Стоимость тура</td>
<td>$text (<em>^int2str:money2str($text) в т.ч. НДС 22%</em>)</td>
</tr>
</table>
#@blank_hotel_view[]

@blank_airline_view[]
<br />
<table id="blank_airline_view" border="0" width="100%">
<tr><td>
<table class="in" border="1" width="100%">

	^if($airline_detal.logo){
	<tr>
	<td align="center"><img src="/img/airlines/icon/${airline_detal.logo}.jpg" alt="$special.airlines_name_en $special.airlines_code"></td>
	<td colspan="3"><strong>Авиакомпания</strong>: ^if(def $special.airlines_name_ru){$special.airlines_name_ru $special.airlines_code ($special.airlines_name_en $special.airlines_code)}{$special.airlines_name_en $special.airlines_code}</td>
    </tr>
	}{
	<tr>
	<td colspan="4"><strong>Авиакомпания</strong>: ^if(def $special.airlines_name_ru){$special.airlines_name_ru $special.airlines_code ($special.airlines_name_en $special.airlines_code)}{$special.airlines_name_en $special.airlines_code}</td>
    </tr>}
    <tr>
	<td class="class="img"" align="center"><img src="/img/icon/air_forward.gif" alt="" border="0"></td>
	<td class="in_left">Москва РФ<br />^if(def $airport_start_1.name_rus){$airport_start_1.name_rus}{$airport_start_1.name_eng} $special.airport_iata_code_1<br />
	$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_start]]
	$parts[^str.split[ ;lh]]
    [$parts.0] $special.flight_time_start_there ($h_weather.day_names_long.[$parts.1])
	</td>
	<td class="in_center" align="center">Туда</td>
	<td class="in_right">$h_hotels.hotel_country.[$special.country_id] $h_hotels.hotel_resort_ru.[$special.resort_id]<br />^if(def $airport_start_2.name_rus){$airport_start_2.name_rus}{$airport_start_2.name_eng} $special.airport_iata_code_2<br />
	
	^if($special.day_next_dt_from_check){
	
	$str[^dtf:format[%d.%m.%Y %w;$special.day_next_dt_from]]
	$parts[^str.split[ ;lh]]
    [$parts.0] $special.flight_time_finish_there ($h_weather.day_names_long.[$parts.1])
	
	}{
	
	$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_start]]
	$parts[^str.split[ ;lh]]
	[$parts.0] $special.flight_time_finish_there ($h_weather.day_names_long.[$parts.1])
	
	}
	
	</td>
    </tr>
	<tr>
	<td class="class="img"" align="center"><img src="/img/icon/air_back.gif" alt="" border="0"></td>
	<td class="in_left">$h_hotels.hotel_country.[$special.country_id] $h_hotels.hotel_resort_ru.[$special.resort_id]<br />^if(def $airport_start_3.name_rus){$airport_start_3.name_rus}{$airport_start_3.name_eng} $special.airport_iata_code_3<br />
	$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_end]]
	$parts[^str.split[ ;lh]]
	[$parts.0] $special.flight_time_start_back ($h_weather.day_names_long.[$parts.1])
	</td>
	<td class="in_center" align="center">Обратно</td>
	<td class="in_right">Москва РФ<br />^if(def $airport_start_4.name_rus){$airport_start_4.name_rus}{$airport_start_4.name_eng} $special.airport_iata_code_4<br />
	
	^if($special.day_next_dt_to_check){
	
	$str[^dtf:format[%d.%m.%Y %w;$special.day_next_dt_to]]
	$parts[^str.split[ ;lh]]
	[$parts.0] $special.flight_time_finish_back ($h_weather.day_names_long.[$parts.1])
    
	}{
	
	$str[^dtf:format[%d.%m.%Y %w;$special.dt_tour_end]]
	$parts[^str.split[ ;lh]]
	[$parts.0] $special.flight_time_finish_back ($h_weather.day_names_long.[$parts.1])
	
	}
	
	</td>
	</tr>
</table>
</td>
</tr>
</table>
#@blank_hotel_view[]

@blank_hotel_detal_site_view[]
<br />
<table id="blank_hotel_detal_site_view" border="0" width="100%">
<tr>
	<td class="h_1">Информация об отеле: $hotel_detal.hotel_name_en</td>
</tr>
<tr>
	<td>
<table class="foto_list" border="0">
    <tr>
	^if(def $hotel_detal.hotel_img_1){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_1}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_1}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
	^if(def $hotel_detal.hotel_img_2){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_2}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_2}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
	^if(def $hotel_detal.hotel_img_3){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_3}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_3}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
	^if(def $hotel_detal.hotel_img_4){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_4}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_4}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
	^if(def $hotel_detal.hotel_img_5){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_5}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_5}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
	^if(def $hotel_detal.hotel_img_6){<td><a href="/hotels/img/h/${hotel_detal.hotel_img_6}.jpg"><img src="/hotels/img/f/${hotel_detal.hotel_img_6}.jpg" alt="$special.hotel_name_en" border="0"></a></td>}{}
    </tr>
</table>
</td>
</tr>
<tr>
<td class="blank_hotel_detal_site_view_body" valign="top">

<dl>
^if($hotel_detal.founded_date){<dd>Дата основания: ${hotel_detal.founded_date} г.</dd>}{}
^if($hotel_detal.building_conservation_date){<dd>Дата реконструкции: ${hotel_detal.building_conservation_date} г.</dd>}{}
^if(def $hotel_detal.resort){<dd>Курорт: $h_hotels.hotel_resort_ru.[$hotel_detal.resort]</dd>}{}
^if(def $hotel_detal.location){<dd>Месторасположение: $hotel_detal.location</dd>}{}
^if(def $hotel_detal.size){<dd>Общая площадь: ${hotel_detal.size}м&sup2^;</dd>}{}
^if(def $hotel_detal.phone_fax){<dd>Телефон/факс: $hotel_detal.phone_fax</dd>}{}
^if(def $hotel_detal.website){<dd>Веб сайт отеля: ^hotel_detal.website.match[(?<![="])((?i:https?://|ftp://|mailto:)(?:[:\w~%{}./?=&@,#-]+))][g]{<a class="red" style="text-decoration: underline^;" href="$match.1" target="_blank"><strong>$match.1</strong></a>}</dd>}{}
</dl>

$rep[^table::create{from	to
–	&mdash^;
\r\n	</dd><dd>
м2	м&sup2^;}]

$infrastructure[^hotel_detal.infrastructure.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$free_services[^hotel_detal.free_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$paid_services[^hotel_detal.paid_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$def_services[^hotel_detal.def_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$for_children[^hotel_detal.for_children.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$amenities_room[^hotel_detal.amenities_room.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]

<dl>
<dd>^hotel_detal.location_of_hotel.replace[$rep]</dd>
</dl>


^if($hotel_detal.water || $hotel_detal.children || $hotel_detal.spa || $hotel_detal.incentive || $hotel_detal.cIty || $hotel_detal.golf || $hotel_detal.talostoterapiya || $hotel_detal.blue_flag){
<script language="javascript" src="http://www.allureseas.ru/js/_02.js"></script>
<style>
.block {position:relative^;/*z-index:1000^;*/margin: 17px auto 25px auto^; width:100%^; border:1px solid #b0e0e6^;font-family:arial^; font-size: 13px^; color:#000000^; background:url("/i/item/gradient.gif") bottom repeat-x^;}
.block .content{padding:10px 10px 10px 40px^; min-height:25px^;}
.block .content p {padding-bottom:.5em^;line-height:1.4em^;}
.block .content p.red {color:red^;font-weight: bold^;}
</style>

<style>
.property {width:500px^; background-color: #f0f8ff^; background-image: none^; position: absolute^; z-index:3000 !important^; display: none^;}
.property .close {position:absolute^; right:5px^; top:1px^; cursor: pointer^;}
.property .c_top, .property .c_btm {background-image: none^;}
.q_sign {cursor: pointer^;}
</style>

<div class="block white property" id="prop_desc_win">
 <div class="c_top l"></div><div class="c_top r"></div><div class="close" onclick="^$('#prop_desc_win').hide()"><font size="+1">&times^;</font></div>
 <div class="content" id="prop_desc_win_content"></div>
 <div class="c_btm l"></div><div class="c_btm r"></div>
</div>

<ul class="oriental">
^h_hotel_.hotel_type_desc.foreach[key;value]{
	 	 ^if(^hotel_detal.locate[$h_hotel_.hotel_type_desc_field.[$key];$key]){<li>$value &nbsp^;<img src="/img/i/question.gif" width="11" height="11" class="q_sign" prop_id="$key" title="Узнать описание" /></li>}{}
	}
</ul>


<script>
var prop_descr=new Array()^;
^h_hotel_.hotel_type_desc.foreach[key;value]{
	 	 ^if(^hotel_detal.locate[$h_hotel_.hotel_type_desc_field.[$key];$key]){prop_descr[$key]="<p><b>$value</b></p><p>$h_hotel_.hotel_type_desc_desc.[$key]</p>"^;}{}
	}
</script>

}{}


<table class="sm" border="0" width="100%">
<tr>
<td>
<dl>
^if(def $hotel_detal.introduction_hotel){<dt>Представление об отеле</dt><dd>^hotel_detal.introduction_hotel.replace[$rep]</dd>}{}
^if(def $hotel_detal.infrastructure){<dt>Инфраструктура</dt>^infrastructure.replace[$rep]}{}
^if(def $hotel_detal.free_services){<dt>Бесплатные услуги</dt>^free_services.replace[$rep]}{}
^if(def $hotel_detal.paid_services){<dt>Платные услуги</dt>^paid_services.replace[$rep]}{}
^if(def $hotel_detal.def_services){<dt>Услуги</dt>^def_services.replace[$rep]}{}
^if(def $hotel_detal.for_children){<dt>Для детей</dt><dd>^for_children.replace[$rep]}{}
^if(def $hotel_detal.amenities_room){<dt>В номере</dt><dd>^amenities_room.replace[$rep]}{}
</dl>
</td>
</tr>

^if(def $hotel_detal.types_room){
<tr>
<td>
<p><strong>Типы комнат</strong></p>
^untaint[as-is]{^hotel_detal.types_room.replace[$rep]}<br /><br />
</td>
</tr>
}{}

^if(def $hotel_detal.add_information){
<tr>
<td>
<p><strong>Дополнительная информация</strong></p>
^untaint[as-is]{^hotel_detal.add_information.replace[$rep]}<br />
</td>
</tr>
}{}

^if(def $hotel_detal.power_information){
<tr>
<td>
<p><strong>Концепция питания</strong></p>
^untaint[as-is]{^hotel_detal.power_information.replace[$rep]}<br />
</td>
</tr>
}{}

^if(def $hotel_detal.spa_information){
<tr>
<td>
<p><strong>SPA информация</strong></p>
^untaint[as-is]{^hotel_detal.spa_information.replace[$rep]}<br />
</td>
</tr>
}{}


^if(def $hotel_detal.news_hotel){
<tr>
<td>
<p><strong>Новости отеля</strong></p>
^untaint[as-is]{^hotel_detal.news_hotel.replace[$rep]}<br />
</td>
</tr>
}{}


</table>
<p style="font-weight: bolder^;font-size: 0.8em^;">Подробное описание отеля <a style="color: #36648C^;" href="/hotels/detal/id/$special.hotel_id/">$special.hotel_name_en</a> &#8594^;</p>
</td>
</tr>
</table>

#@blank_hotel_detal_site_view[]

@form_bottom_right[]
<br /><br />
^if($last_update <= $now){}{
	^if(def $to){}{
	<div class="right_div_form_ord_spec">
	<form class="callme" method="post">
    <input onclick="document.getElementById('divCallMe').style.display=document.getElementById('divCallMe').style.display!='block'?'block':'none'^; return false^;" type="Submit" class="post_wh_spec" value="Запрос" />
	</form>
	</div>
	
	 }
	}
#@form_bottom_right[]

@history_browsing[]
^if($cookie_select){
	<div class="right_div_browsing">
	<p>Просмотренные вами специальные предложения за последние 24 часа</p>
	^cookie_select.menu{
	<dl>
	^special_.menu{
	^if($cookie_select.special_id == $special_.id){
	^if($special_.id==$form:id){}{
	 $found_human($special_.human_count)
     $found_human_child($special_.child_count)
	 $total[^if(^currency_.locate[id;$special_.price_type]){$currency_.currency}{}]
	 <dt><a href="/special/detal/id/$special_.id/" title="Спецпредложение в отель $special_.hotel_name_en">$special_.hotel_name_en</a></dt>
	 <dd>${h_hotels.hotel_country.[$special_.country_id]}. ${h_hotels.hotel_resort_ru.[$special_.resort_id]}.</dd>
	 <dd>Кол-во ночей: ^if($special_.night_count){$special_.night_count}{}</dd>
	 <dd>Даты: ^dtf:format[%d.%m.%Y;$special_.dt_tour_start] &ndash^; ^dtf:format[%d.%m.%Y;$special_.dt_tour_end]</dd>
	 <dd><span>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special_.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</span></dd>
     ^if($special_.price){<dd>Стоимость тура: ^eval($special_.price*$total) рубли РФ.</dd>}{}
	
	 }
	 
	}
                 }
	</dl>
	}
	</div>
}{}
#@history_browsing[]

@alternativeSpecResort[]
$special_select_alt[^special_.select($special_.resort_id==$special.resort_id)]
^if($special_select_alt.is_archive==0){
<div class="right_div_alternativeSpecResort">
<p>Похожие спецпредложения.<br />Отели в регионе: ${h_hotels.hotel_country.[$special_select_alt.country_id]}. ${h_hotels.hotel_resort_ru.[$special_select_alt.resort_id]}.</p>
^special_select_alt.menu{
^if($special_select_alt.id==$form:id){}{
^if($special_select_alt.is_archive == 0){
$found_human($special_select_alt.human_count)
$found_human_child($special_select_alt.child_count)
$total[^if(^currency_.locate[id;$special_select_alt.price_type]){$currency_.currency}{}]
<dl>
<dt><a href="/special/detal/id/$special_select_alt.id/" title="Спецпредложение в отель $special_select_alt.hotel_name_en">$special_select_alt.hotel_name_en</a></dt>
<dd>${h_hotels.hotel_country.[$special_select_alt.country_id]}. ${h_hotels.hotel_resort_ru.[$special_select_alt.resort_id]}.</dd>
<dd>Кол-во ночей: ^if($special_select_alt.night_count){$special_select_alt.night_count}{}</dd>
<dd>Даты: ^dtf:format[%d.%m.%Y;$special_select_alt.dt_tour_start] &ndash^; ^dtf:format[%d.%m.%Y;$special_select_alt.dt_tour_end]</dd>
<dd><span>Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}</span></dd>
^if($special_select_alt.price){<dd>Стоимость 1 тура: ^eval($special_select_alt.price*$total) рубли РФ.</dd>}{}
</dl>}{}
}
}
</div>}{}
#@alternativeSpecResort[]

@str_valid[]
$cookie[^db:getCookie[]]
^if(^cookie.locate[uin;$cookie:special]){
$cookie_select[^cookie.select($cookie.uin eq "$cookie:special")]
^if(^cookie_select.locate[special_id;$special.id]){}{^addCookieTable[]}

}{^addCookieTable[]}
#@str_valid[]

@addCookieTable[]
^if(def $cookie:special){
^connect[$connect_string]{
      ^void:sql{INSERT INTO browsing_history_special 
         (special_id, hotel_id, uin, dt) 
      values  
         ('$special.id', '$special.hotel_id', '$cookie:special', '^now.sql-string[]')
		       }
#$response:location[http://$env:SERVER_NAME/special/detal/id/$special.id/]
} 
}{}
#@addCookieTable[]

@deletCookieTable[]
^if(!def $cookie:special){

$cookie[^db:getCookie[]]

^connect[$connect_string]{
	        ^cookie.menu{
			^void:sql{DELETE FROM `browsing_history_special` WHERE `uin` IN (^cookie.menu{'$cookie:special'}[,])}
			}
}

}{}
#@deletCookieTable[]


@mailform[][oAntiSpam;bShowForm]
^hHotDesc[]
$now[^date::now[]]
$detail[^db:getSpecial[$.id(^form:id.int(0))]]
$orderspec[^db:getOrderSpecial[]]
$orderspec_detal[^db:getOrderSpecial[$.id($detail.id)]]
$total[^if(^currency_.locate[id;$detail.price_type]){$currency_.currency}{}]
$oAntiSpam[^Antispam::create[$hAntiSpamParams]]
^debug[$oAntiSpam]
$bShowForm(true)
^oAntiSpam.exec{

	
	^check[]
	
    <table class="table_check_ok" border="0" width="90%">
	<tr valign="top">
	<td>
	<p>Номер спецпредложения: $form:special_id</p>
	<p>Страна: ${h_hotels.hotel_country.[$form:country_id]}. Курорт: ${h_hotels.hotel_resort_ru.[$form:resort_id]}.</p>
	<p>Запрос отеля: $form:hotel_name_en</p>
	<p>Имя: $form:first_name</p>
	<p>Фамилия: $form:last_name</p>
	<p>Ваш телфон: $form:phone</p>
	<p>Ваша почта: $form:email</p>
	<p>Стоимость тура: ^eval($detail.price*$total) рублей РФ.</p>
	</td>
	^connect[$connect_string]{
^void:sql{INSERT INTO form_orders_special
         (special_id, operator_send_id, country_id, resort_id, 
		 hotel_id, hotel_name_en, hotel_rating_id, hotel_power, dt_tour_start, 
		 dt_tour_end, dt_tour_valid, dt_published, airlines_name_en, 
		 airlines_name_ru, airport_start_id, airport_end_id, 
		 airport_start_back_id, airport_end_back_id, 
		 uri, uin, first_name, last_name, phone, email, bodytext, price, price_type, night_count, human_count, child_count) 
      values  
         ('$form:special_id', '$form:operator_send_id', '$form:country_id', 
		 '$form:resort_id', '$form:hotel_id', '$form:hotel_name_en', 
		 '$form:hotel_rating_id', '$special.hotel_power', '$form:dt_tour_start', '$form:dt_tour_end', 
		 '$form:dt_tour_valid', '$form:dt_published', '$form:airlines_name_en', 
		 '$form:airlines_name_ru', '$form:airport_start_id', '$form:airport_end_id', 
		 '$form:airport_start_back_id', '$form:airport_end_back_id', '$form:uri', '$form:uin', 
		 '$form:first_name', '$form:last_name', '$form:phone', 
		 '$form:email', '$form:bodytext', '$special.price', '$special.price_type', '$special.night_count', '$special.human_count', '$special.child_count')
		 }
		 $last_id[^int:sql{select last_insert_id()}]
		 }
		 
	$to[<mailbox@allureseas.ru>]
	^mail:send[
      $.from[$form:email] 
      $.to[$to] 
      $.subject[Запрос отеля http://$env:SERVER_NAME/] 
	  $.charset[$response:charset]
      $.text[^#0AНомер спецпредложения: $form:special_id ^#0AСсылка: $form:uri ^#0AОтель: $form:hotel_name_en ^#0AСтрана: $h_hotels.hotel_country.[$form:country_id] ^#0AКурорт: $h_hotels.hotel_resort.[$form:resort_id] ^#0AТуроператор: ^if(def $operator_detal.name_ru){$operator_detal.name_ru}{$operator_detal.name_en} ^#0AКол-во ночей: $detail.night_count ^#0AВзрослые: $detail.human_count ^#0AДети: $detail.child_count ^#0AДата прибытия в отель: $detail.dt_tour_start ^#0AДата отправления из отеля: $detail.dt_tour_start ^#0AДействительно до: $detail.dt_tour_valid  ^#0AСтоимость тура: ^eval($detail.price*$total) рублей РФ. ^#0AТекст сообщения: $form:bodytext^#0A-----------------^#0AСообщение отправлено: ^now.sql-string[]^#0AIP адрес отправителя: $env:REMOTE_ADDR] 
     ] 


	<td><span style="color:#009900^;margin: 0 15px 0 15px^;">Ваше сообщение успешно отправлено...</span></td>
</tr>
</table>

#^send_mail_user[]
	
	$bShowForm(false)
}{
	$bShowForm(false)
	$exception.handled(true)
	^switch[$exception.type]{
		^case[$oAntiSpam.CLASS_NAME]{
			^switch[$exception.source]{
				^case[unknown-uid]{
					
				 <table class="table_check_user" border="0" width="90%">
				 <tr>
				 <td><p>Ваше сообщение уже было добавлено ранее</p></td>
				 </tr>
   				 </table>

				}

				^case[empty-uid]{
					^bye[]
				}

				^case[fake-uid-exist]{
					^bye[]
				}

				^case[no-real-uid]{
					^bye[]
				}

				^case[referer]{
					^bye[]
				}

				^case[suspected-content]{
					^bye[]
				}
			}
		}

		^case[check.fields]{
		
		            <table class="table_check_field" border="0" width="90%">
					<tr>
					<td><span style="color:red^;margin: 0 15px 0 15px^;">Не заполнены обязательные поля формы</span></td>
					</tr>
					</table>   
				 
			$bShowForm(true)
		}

		^case[DEFAULT]{
			$exception.handled(false)
		}
	}
}


^if($bShowForm){

	^oAntiSpam.print{
$total[^if(^currency_.locate[id;$detail.price_type]){$currency_.currency}{}]
<div class="callme">
<div class="clear"></div>
<div class="form" id="divCallMe">
<div class="close" onclick="document.getElementById('divCallMe').style.display='none'^;"></div>
<div id="divCallMeBody">
<form name="formspecialorders" method="post" enctype="multipart/form-data">
<input type="hidden" name="special_id" value="$detail.id" />
<input type="hidden" name="operator_send_id" value="$detail.operator_send_id" />
<input type="hidden" name="country_id" value="$detail.country_id" />
<input type="hidden" name="resort_id" value="$detail.resort_id" />
<input type="hidden" name="hotel_id" value="$detail.hotel_id" />
<input type="hidden" name="hotel_name_en" value="$detail.hotel_name_en" />
<input type="hidden" name="hotel_rating_id" value="$detail.hotel_rating_id" />
<input type="hidden" name="dt_tour_start" value="$detail.dt_tour_start" />
<input type="hidden" name="dt_tour_end" value="$detail.dt_tour_end" />
<input type="hidden" name="dt_tour_valid" value="$detail.dt_tour_valid" />
<input type="hidden" name="dt_published" value="^now.sql-string[]" />
<input type="hidden" name="airlines_name_en" value="$detail.airlines_name_en" />
<input type="hidden" name="airlines_name_ru" value="$detail.airlines_name_ru" />
<input type="hidden" name="airport_start_id" value="$detail.airport_start_id" />
<input type="hidden" name="airport_end_id" value="$detail.airport_end_id" />
<input type="hidden" name="airport_start_back_id" value="$detail.airport_start_back_id" />
<input type="hidden" name="airport_end_back_id" value="$detail.airport_end_back_id" />

<input type="hidden" name="night_count" value="$detail.night_count" />
<input type="hidden" name="human_count" value="$detail.human_count" />
<input type="hidden" name="child_count" value="$detail.child_count" />

<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="hidden" name="uin" value="$cookie:special" />
<table class="formordersspecial" align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
<tr><th>Спецпредложение № $detail.id (${h_hotels.hotel_country.[$detail.country_id]}. ${h_hotels.hotel_resort_ru.[$detail.resort_id]}.)<br />$detail.hotel_name_en^if($detail.night_count){<br />$detail.night_count Ночей.}{} [^dtf:format[%d.%m.%Y;$detail.dt_tour_start] &ndash^; ^dtf:format[%d.%m.%Y;$detail.dt_tour_end]]^if($detail.price){<br />Стоимость тура: ^eval($detail.price*$total) рублей РФ.}{}</th></tr>
<tr><td><label class="valid">Имя*:</label><br><input type="Text" name="first_name" value="" style="font-size: 1.5em^; width:100%^;" /></td></tr>
<tr><td><label>Фамилия:</label><br><input type="Text" name="last_name" value="" style="font-size: 1.5em^; width:100%^;"/></td></tr>
<tr><td><label class="valid">Телефон*:</label><br><input type="Text" name="phone" value="" style="font-size: 1.5em^; width:100%^;" /></td></tr>
<tr><td><label class="valid">Эл. почта*:</label><br><input type="Text" name="email" value="" style="font-size: 1.5em^; width:100%^;" /></td></tr>
<tr><td><label>Текст сообщения:</label><br><textarea cols="20" rows="6" name="bodytext" style="font-size: 1.5em^; overflow: auto^; width:100%^;">$form:bodytext</textarea></td></tr>
<tr><td colspan="4"><input type="submit" name="action" value="Отправить запрос" class="post_wh" /></td></tr>
</table>

</form>

</div>
</div>
</div>

}{
		^switch[$exception.type]{
			^case[$oAntiSpam.CLASS_NAME]{
				$exception.handled(true)
				^switch[$exception.source]{
					^case[referer]{
						^rem{ *** РѕС‚РєСЂС‹С‚РёРµ С„РѕСЂРјС‹ СЃ РЅРµРёР·РІРµСЃС‚РЅРѕРіРѕ referer-Р° *** }
						^bye[]
					}

					^case[unknown-fields]{
						^rem{ *** РІ form РїСЂРёС€Р»Рё РЅРµРёР·РІРµСЃС‚РЅС‹Рµ РїРѕР»СЏ *** }
						^bye[]
					}
				}
			}
		}
	}
	
	

}

^debug[$oAntiSpam]
###########################################################################
@check[]
^if(!def $form:first_name){
	^throw[check.fields;]
}
^if(!def $form:phone){
	^throw[check.fields;]
}
^if(!^Lib:isEmail[$form:email]){
	^throw[check.fields;]
}
#end @check[]
###########################################################################
@debug[oAntiSpam][sKey;sValue]
#end @debug[]

@bye[]
<table class="table_check_spam" border="0" width="90%">
<tr>
	<td><p>Спам!</p></td>
</tr>
</table>
#$response:status(404)
#end @bye[]
#@mailform[]

@send_mail_user[]
$last[$last_id]
$getOrderSpecial[^db:getOrderSpecial[]]
^if(^getOrderSpecial.locate[id;$last]){
$to[<${getOrderSpecial.email}>]
	^mail:send[
      $.from[<mailbox@allureseas.ru>] 
      $.to[$to] 
      $.subject[http://$env:SERVER_NAME/] 
	  $.charset[$response:charset]
      $.text[Спасибо за предварительный запрос спецпредложения с нашего сайта (www.allureseas.ru).^#0AАдрес страницы спецпредложения на сайте: $getOrderSpecial.uri^#0AВы можете получить дополнительную информацию по данному туру в нашем офисе или связаться с нами по телефону в Москве: +7 (985) 769-61-08^#0A--------------------------------------------------------------^#0AЗапрос спецпредложения создан: ^now.sql-string[]] 
     ]
}{}
#@send_mail_user[]

