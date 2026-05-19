@auto[]
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


@head[]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html^; charset=windows-1251" />
<meta name="description" content="^title_global[] | ^description_global[]" />
<meta name="keywords" content="^title_global[] | ^keywords_global[]" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/base-min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/style.css" media="all" />

<link rel="stylesheet" type="text/css" href="/css/datepicker/themes/flick/jquery.ui.all.css">
#<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">

<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/js/datepicker/jquery-ui-1.8.11.custom.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="/css/calendar/tcal.css" />
<script type="text/javascript" src="/js/calendar/tcal.js"></script>
	
	<title>^title_global[]</title>
</head>
#@head[]

@title_global[]
^hHotDesc[]
$title_global[^db:getHotels[$.id(^form:id.int(0))]]
$result[Отель $title_global.hotel_name_en $title_global.hotel_rating | Курорт: $h_hotels.hotel_resort_ru.[$title_global.resort] | $h_hotels.hotel_country.[$title_global.country_id]]
#end @title_global[]

@description_global[]
^hHotDesc[]
	$description_global[^db:getHotels[$.id(^form:id.int(0))]]
	$result[$description_global.location]
#end @description_global[]

@keywords_global[]
^hHotDesc[]
	$keywords_global[^db:getHotels[$.id(^form:id.int(0))]]
	$result[$keywords_global.keywords ^if($h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id] eq "Мальдивы" || $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id] eq "Сейшелы"){Горящие туры на $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id]}{Горящие туры в $h_hotels.hotel_country_hotel_tour.[$keywords_global.country_id]}]
#end @keywords_global[]

@getalfa[]
^hHotDesc[]
$hotel[^db:getHotels[$.id(^form:id.int(0))]]
$al[^MAIN:oSql.table{SELECT (LEFT (hotel_name_en,1)) AS letter, country_id FROM full_hotels WHERE is_published = 1 AND country_id = '$hotel.country_id' GROUP BY LCASE(LEFT(hotel_name_en,1))}]
^al.sort{$al.letter}
<table class="abc" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
^al.menu{
       <td>^if($form:letter eq $al.letter){<a class="act" href="/region/country/$h_hotels.item_country.[$al.country_id]/hotels/abc/letter/$al.letter/" title="Отели $h_hotels.hotel_country_hotel.[$al.country_id] на букву $al.letter">$al.letter</a>}{<a href="/region/country/$h_hotels.item_country.[$al.country_id]/hotels/abc/letter/$al.letter/" title="Отели $h_hotels.hotel_country_hotel.[$al.country_id] на букву $al.letter">$al.letter</a>}</td>
}</tr>
</table>
#@getalfa[]

@detal[]
^hHotDesc[]
$h_hotel_[$h_hotels]
$hotel[^db:getHotels[$.id(^form:id.int(0))]]
$special_[^db:getSpecial[]]
$special_select_arhive[^special_.select($special_.is_archive==0)]
$special_select[^special_select_arhive.select($special_select_arhive.hotel_id==$hotel.id)]
$currency_[^db:getCurrency[]]
^if($hotel){
<table class="detal" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr><td colspan="2">^getalfa[]</td></tr>
<tr valign="top">
	<td width="65%" class="left_tbl">
	<div class="sub_navi">
	<a href="/hotels/" title="Отели">Отели</a> /
	<a href="/region/country/$h_hotels.item_country.[$hotel.country_id]/hotels/" title="$h_hotels.hotel_country.[$hotel.country_id]">$h_hotels.hotel_country.[$hotel.country_id]</a> / 
	<a href="/region/country/$h_hotels.item_country.[$hotel.country_id]/hotels/result_select/resort/$hotel.resort/" title="$h_hotels.hotel_resort_ru.[$hotel.resort]">$h_hotels.hotel_resort_ru.[$hotel.resort]</a> / 
	<strong>Отель $hotel.hotel_name_en $hotel.hotel_rating</strong>
	</div>
	
	^if($special_select){
	<div class="detal_header_special">
	^special_select.sort{$special_select.dt_tour_start}
	^special_select.menu{
	$found($special_select.night_count)
	$found_human($special_select.human_count)
    $found_human_child($special_select.child_count)
	$total[^if(^currency_.locate[id;$special_select.price_type]){$currency_.currency}{}]
    $total_rub[^if($special_select.price){$text(^eval($special_select.price*$total))}{}]
	
	<p><strong>$currency.id<a href="/special/detal/id/$special_select.id/" title="Спецпредложение в отель: $special_select.hotel_name_en">$special_select.hotel_name_en</a></strong><br>
	Даты: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_start] &mdash^; ^dtf:format[%d.%m.%Y;$special_select.dt_tour_end] на ^num_decline[$found; $found ночь; $found ночи; <span>$found</span> ночей]. Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special_select.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}.<br />Стоимость тура: $text (<em>^int2str:money2str($text) в т.ч. НДС 22%</em>)</p>
	}
	<span><a href="/special/$h_hotels.item_country.[$hotel.country_id]/" title="Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel.country_id]">Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel.country_id]</a></span>
	</div>
	}{^if(^special_.locate[country_id;$hotel.country_id]){<div class="detal_header_special"><span><a href="/special/$h_hotels.item_country.[$hotel.country_id]/" title="Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel.country_id]">Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$hotel.country_id]</a></span></div>}{}}
	
	^mailform[]
	
	<h1>$hotel.hotel_name_en $hotel.hotel_rating <sup>$h_hotels.hotel_rating_img.[$hotel.hotel_rating_type]</sup></h1>
	
	^if($hotel.power_special_category){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_special_category]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_special_category]
	</fieldset>
	}{}
	
	
	^if($hotel.power_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_ultra_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_ultra_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_ultra_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_full_board){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_full_board]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_full_board]
	</fieldset>
	}{}
	
	^if($hotel.power_bed_breakfast){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_bed_breakfast]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_bed_breakfast]
	</fieldset>
	}{}
	
	^if($hotel.power_half_board){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_half_board]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_half_board]
	</fieldset>
	}{}
	
	^if($hotel.power_golden_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_golden_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_golden_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_extra_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_extra_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_extra_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_deluxe_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_deluxe_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_deluxe_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_imperial_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_imperial_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_imperial_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_premium_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_premium_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_premium_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_royal_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_royal_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_royal_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_superior_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_superior_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_superior_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_elite_all_inclusive){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_elite_all_inclusive]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_elite_all_inclusive]
	</fieldset>
	}{}
	
	^if($hotel.power_only_bed){
	<fieldset>
	<legend align="center">$h_hotels.hotel_power.[$hotel.power_only_bed]</legend>
	$h_hotels.hotel_power_desc.[$hotel.power_only_bed]
	</fieldset>
	}{}
	

<dl>
^if($hotel.founded_date){<dd>Дата основания: ${hotel.founded_date} г.</dd>}{}
^if($hotel.building_conservation_date){<dd>Дата реконструкции: ${hotel.building_conservation_date} г.</dd>}{}
^if(def $hotel.resort){<dd>Курорт: $h_hotels.hotel_resort_ru.[$hotel.resort]</dd>}{}
^if(def $hotel.location){<dd>Месторасположение: $hotel.location</dd>}{}
^if(def $hotel.size){<dd>Общая площадь: ${hotel.size}м&sup2^;</dd>}{}
^if(def $hotel.phone_fax){<dd>Телефон/факс: $hotel.phone_fax</dd>}{}
^if(def $hotel.website){<dd>Веб сайт отеля: ^hotel.website.match[(?<![="])((?i:https?://|ftp://|mailto:)(?:[:\w~%{}./?=&@,#-]+))][g]{<a class="red" style="text-decoration: underline^;" href="$match.1" target="_blank"><strong>$match.1</strong></a>}</dd>}{}
</dl>

$rep[^table::create{from	to
–	&mdash^;
\r\n	</dd><dd>
м2	м&sup2^;}]

$infrastructure[^hotel.infrastructure.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$free_services[^hotel.free_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$paid_services[^hotel.paid_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$def_services[^hotel.def_services.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$for_children[^hotel.for_children.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]
$amenities_room[^hotel.amenities_room.match[(^^|\n)(.*)(\n|^$)][gm]{<dd>$match.2 </dd>$match.3}</dd>]

<dl>
<dd>^hotel.location_of_hotel.replace[$rep]</dd>
</dl>

^if($hotel.water || $hotel.children || $hotel.spa || $hotel.incentive || $hotel.cIty || $hotel.golf || $hotel.talostoterapiya || $hotel.blue_flag){
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
	 	 ^if(^hotel.locate[$h_hotel_.hotel_type_desc_field.[$key];$key]){<li>$value &nbsp^;<img src="/img/i/question.gif" width="11" height="11" class="q_sign" prop_id="$key" title="Узнать описание" /></li>}{}
	}
</ul>


<script>
var prop_descr=new Array()^;
^h_hotel_.hotel_type_desc.foreach[key;value]{
	 	 ^if(^hotel.locate[$h_hotel_.hotel_type_desc_field.[$key];$key]){prop_descr[$key]="<p><b>$value</b></p><p>$h_hotel_.hotel_type_desc_desc.[$key]</p>"^;}{}
	}
</script>

}{}

<table border="0" width="100%">
<tr>
<td style="padding-bottom: 0px^; padding-left: 15px^; padding-right: 15px^;">
<dl>
^if(def $hotel.introduction_hotel){<dt>Представление об отеле</dt><dd>^hotel.introduction_hotel.replace[$rep]</dd>}{}
^if(def $hotel.infrastructure){<dt>Инфраструктура</dt>^infrastructure.replace[$rep]}{}
^if(def $hotel.free_services){<dt>Бесплатные услуги</dt>^free_services.replace[$rep]}{}
^if(def $hotel.paid_services){<dt>Платные услуги</dt>^paid_services.replace[$rep]}{}
^if(def $hotel.def_services){<dt>Услуги</dt>^def_services.replace[$rep]}{}
^if(def $hotel.for_children){<dt>Для детей</dt><dd>^for_children.replace[$rep]}{}
^if(def $hotel.amenities_room){<dt>В номере</dt><dd>^amenities_room.replace[$rep]}{}
</dl>
</td>
</tr>

^if(def $hotel.types_room){
<tr>
<td style="padding-left: 15px^; padding-right: 15px^;">
<p style="padding-bottom: 0.5em^; font-size: 1.3em^;"><strong>Типы комнат</strong></p>
^untaint[as-is]{^hotel.types_room.replace[$rep]}<br /><br />
</td>
</tr>
}{}

^if(def $hotel.add_information){
<tr>
<td style="padding-left: 15px^; padding-right: 15px^;">
<p style="padding-bottom: 0.5em^; font-size: 1.3em^;"><strong>Дополнительная информация</strong></p>
^untaint[as-is]{^hotel.add_information.replace[$rep]}<br />
</td>
</tr>
}{}

^if(def $hotel.power_information){
<tr>
<td style="padding-left: 15px^; padding-right: 15px^;">
<p style="padding-bottom: 0.5em^; font-size: 1.3em^;"><strong>Концепция питания</strong></p>
^untaint[as-is]{^hotel.power_information.replace[$rep]}<br />
</td>
</tr>
}{}

^if(def $hotel.spa_information){
<tr>
<td style="padding-left: 15px^; padding-right: 15px^;">
<p style="padding-bottom: 0.5em^; font-size: 1.3em^;"><strong>SPA информация</strong></p>
^untaint[as-is]{^hotel.spa_information.replace[$rep]}<br />
</td>
</tr>
}{}


^if(def $hotel.news_hotel){
<tr>
<td style="padding-left: 15px^; padding-right: 15px^;">
<p style="padding-bottom: 0.5em^; font-size: 1.3em^;"><strong>Новости отеля</strong></p>
^untaint[as-is]{^hotel.news_hotel.replace[$rep]}<br />
</td>
</tr>
}{}


</table>
	
</td>
   <td class="right_tbl" width="35%">
   
 <div class="fieldset_img">
 <fieldset class="">
 <legend align="center" title="Фото отеля: $hotel.hotel_name_en $hotel.hotel_rating">Фото отеля: $hotel.hotel_name_en $hotel.hotel_rating</legend>
 
    <table class="table_img" border="0" cellpadding="0" cellspacing="0" width="80%">
	<tr valign="top">
	<td width="125px">^if(def $hotel.hotel_img_1){<a href="/hotels/img/h/${hotel.hotel_img_1}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_1}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	<td>^if(def $hotel.hotel_img_2){<a href="/hotels/img/h/${hotel.hotel_img_2}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_2}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	</tr>
	<tr valign="top">
	<td>^if(def $hotel.hotel_img_3){<a href="/hotels/img/h/${hotel.hotel_img_3}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_3}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	<td>^if(def $hotel.hotel_img_4){<a href="/hotels/img/h/${hotel.hotel_img_4}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_4}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	</tr>
	<tr valign="top">
	<td>^if(def $hotel.hotel_img_5){<a href="/hotels/img/h/${hotel.hotel_img_5}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_5}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	<td>^if(def $hotel.hotel_img_6){<a href="/hotels/img/h/${hotel.hotel_img_6}.jpg" title="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" target="_blank"><img src="/hotels/img/f/${hotel.hotel_img_6}.jpg" alt="Фото отеля $hotel.hotel_name_en $hotel.hotel_rating" border="0"></a>}{}</td>
	</tr>
</table>

</fieldset>
</div>

^block_right_detal[]

	</td>
</tr>
</table>

}{^Lib:location[/404/]}
#@detal[]

@mailform[][oAntiSpam;bShowForm]
^hHotDesc[]
$now[^date::now[]]
$detail[^db:getHotels[$.id(^form:id.int(0))]]
$oAntiSpam[^Antispam::create[$hAntiSpamParams]]

^debug[$oAntiSpam]

$bShowForm(true)

^oAntiSpam.exec{

	^check[]

	<div style="margin: 1.0em 0 0 0^;">
	<p>Ваше имя: $form:name</p>
	<p>Телефон: $form:phone</p>
	</div>
	
	^connect[$connect_string]{
^void:sql{INSERT INTO form_orders_hotels
         (country_id, resort_id, hotel_id, hotel_name_en, hotel_rating, name, phone, email, night_from, night_to, data_from, data_to, adults, child, comments, dt, is_published) 
      values  
         ('$form:country_id', '$form:resort_id', '$form:hotel_id', '$form:hotel_name_en', '$form:hotel_rating', '$form:name', '$form:phone', '$form:email', '$form:night_from', '$form:night_to', '$form:data_from', '$form:data_to', '$form:adults', '$form:child', '$form:comments', '$form:dt' , '$form:is_published')}}

	$to[<mailbox@allureseas.ru>]
	^mail:send[
      $.from[$form:email] 
      $.to[$to] 
      $.subject[Запрос отеля $form:hotel_name_en $form:hotel_rating | $h_hotels.hotel_country.[$hotel.country_id] $h_hotels.hotel_resort_ru.[$hotel.resort]] 
	  $.charset[$response:charset]
      $.text[^#0AЗапрос отеля: $form:hotel_name_en $form:hotel_rating^#0AСсылка: $form:uri^#0AСтрана: $h_hotels.hotel_country.[$form:country_id]^#0AКурорт: $h_hotels.hotel_resort.[$form:resort_id]^#0AКол-во ночей: $form:night_from — $form:night_to^#0AДаты вылета: ^dtf:format[%d %h %Y;$form:data_from;$dtf:rr-locale] — ^dtf:format[%d %h %Y;$form:data_to;$dtf:rr-locale]^#0AКол-во взрослых: $form:adults^#0AКол-во детей: $form:child^#0AИмя клиента: $form:name^#0AКонтактный телефон: $form:phone^#0AЭлектронная почта: $form:email^#0AТекст сообщения: $form:comments^#0A-----------------^#0AСообщение отправлено: ^now.sql-string[]^#0AIP адрес отправителя: $env:REMOTE_ADDR] 
] 
    <div style="border: 2px solid #006400^; background-color: #eefff7^; margin: 1.0em 0 0 0^; color:006633^; padding: 5px^;">
					<p>Ваше сообщение отправлено...</p>
				   </div>
	$bShowForm(false)
}{
	$bShowForm(false)
	$exception.handled(true)
	^switch[$exception.type]{
		^case[$oAntiSpam.CLASS_NAME]{
			^switch[$exception.source]{
				^case[unknown-uid]{
					<div style="border: 2px solid #ff9900^; background-color: #FFEBCD^; margin: 1.0em 0 0 0^; padding: 5px^;">
					<p>Ваше сообщение уже было добавлено <strong>ранее</strong>.</p>
					</div>
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
		           <div style="color:red^; border: 2px solid #ff6347^; background-color: #fcfcfc^; margin: 1.0em 0 0 0^; padding: 5px^;">
					<p><strong>Не заполнены обязательные поля</strong>.</p>
				   </div>
			$bShowForm(true)
		}

		^case[DEFAULT]{
			$exception.handled(false)
		}
	}
}


^if($bShowForm){

	^oAntiSpam.print{

	
<script type="text/javascript" src="/js/100.js"></script>
<form name="formhotelsorders" method="post" enctype="multipart/form-data">
<input type="hidden" name="country_id" value="$hotel.country_id" />
<input type="hidden" name="resort_id" value="$hotel.resort" />
<input type="hidden" name="hotel_id" value="$hotel.id" />
<input type="hidden" name="hotel_name_en" value="$hotel.hotel_name_en" />
<input type="hidden" name="hotel_rating" value="$hotel.hotel_rating" />
<input type="hidden" name="dt" value="^now.sql-string[]" />
<input type="hidden" name="uri" value="http://${env:SERVER_NAME}$request:uri" />
<input type="hidden" name="is_published" value="1" />
<table class="formordershotels" cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><th colspan="4"><p>Предварительный запрос отеля: $hotel.hotel_name_en $hotel.hotel_rating ($h_hotels.hotel_country.[$hotel.country_id] $h_hotels.hotel_resort_ru.[$hotel.resort])</p></th></tr>
<tr>
	<td><p><span>Ваше имя</span>:&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;<input type="Text" name="name" /></p></td>
	<td><p>Ночей от: <select name="night_from" style="width:40px^;">
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
    <option value="25">25</option>
    <option value="26">26</option>
    <option value="27">27</option>
    <option value="28">28</option>
    <option value="29">29</option>
    <option value="30">30</option>
    <option value="31">31</option>
	</select></p></td>
	<td><p>Вылет от: <input type="text" name="data_from" class="tcal" value="$form:data_from" style="background-color: White^; width:115px^;" /></p></td>
	<td><p>Взрослых: 
	<select name="adults" style="width:40px^;">
	<option value="1">1</option>
   	<option value="2">2</option>
   	<option value="3">3</option>
   	<option value="4">4</option>
   	<option value="5">5</option>
   	<option value="6">6</option>
   	<option value="7">7</option>
   	<option value="8">8</option>
   	<option value="9">9</option>
   	</select></p></td>
</tr>
<tr>
	<td><p><span>Ваш телефон</span>: <input type="Text" name="phone" /></p></td>
	<td><p>Ночей до: 
	<select name="night_to" style="width:40px^;">
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
    <option value="25">25</option>
    <option value="26">26</option>
    <option value="27">27</option>
    <option value="28">28</option>
    <option value="29">29</option>
    <option value="30">30</option>
    <option value="31">31</option>
	</select></p></td>
	<td><p>Вылет до: <input type="text" name="data_to" class="tcal" value="$form:data_to" style="background-color: White^; width:115px^;" /></p></td>
	<td><p>Детей:&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;&nbsp^;
	<select name="child" style="width:40px^;">
   	<option value="">0</option>
   	<option value="1">1</option>
   	<option value="2">2</option>
   	<option value="3">3</option>
   	<option value="4">4</option>
   	</select></p></td>
</tr>
<tr><td><p><span>Электр. почта</span>: <input type="Text" name="email" /></p></td><td></td><td></td><td></td></tr>
<tr valign="top"><td valign="top" colspan="4"><p>Текст сообщения:<br /><textarea cols="20" rows="3" name="comments" style="overflow: auto^; width:100%^;">$form:comments</textarea></p></td></tr>
<tr><td colspan="4"><p><input type="submit" name="action" value="Отправить запрос" class="class" style="font-weight: bolder^; height: 2em^; background-color: #ffa500^; color: #000^; width:150px^; margin: 0^; padding: 0^;" /></p></td></tr>
</table>
</form>
	
	


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
#end @main[]


###########################################################################
@check[]
^if(!def $form:name){
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
<p>Спамеры!</p>
#$response:status(404)
#end @bye[]
#@mailform[]

@block_right_detal[]
<div class="block_right_detal">

^specRightList[]

^altHotels[]

<div class="viewStoryHotel">^viewStoryHotel[]</div>
</div>
#@block_right_detal[]

@altHotels[]
^hHotDesc[]
$hotelsAll[^db:getHotels[]]
$altHotels[^db:getHotels[$.id(^form:id.int(0))]]

$hotelsAll_cell[^hotelsAll.select($hotelsAll.country_id==$altHotels.country_id)] 
$hotelsAll_cell_cell[^hotelsAll_cell.select($hotelsAll_cell.resort==$altHotels.resort)] 
$hotelsAll_cell_cell_star[^hotelsAll_cell_cell.select($hotelsAll_cell_cell.hotel_rating_type==$altHotels.hotel_rating_type)] 

$hotelsAll_cell_cell_star_copy[^table::create[$hotelsAll_cell_cell_star;
            $.limit(15)
            ]]
^hotelsAll_cell_cell_star_copy.sort{$hotelsAll_cell_cell_star_copy.hotel_name_en}

<div class="altHotels">
<fieldset>
<legend align="center">Похожие отели. ${h_hotels.hotel_country.[$hotelsAll_cell_cell_star_copy.country_id]}. ${h_hotels.hotel_resort_ru.[$hotelsAll_cell_cell_star_copy.resort]}.</legend>
^hotelsAll_cell_cell_star_copy.menu{
<dl>
^if($hotelsAll_cell_cell_star_copy.id==$altHotels.id){}{
<dt><a href="/hotels/detal/id/$hotelsAll_cell_cell_star_copy.id/" title="Отель $hotelsAll_cell_cell_star_copy.hotel_name_en $hotelsAll_cell_cell_star_copy.hotel_rating">$hotelsAll_cell_cell_star_copy.hotel_name_en $hotelsAll_cell_cell_star_copy.hotel_rating</a> <sup>$h_hotels.hotel_rating_s_img.[$hotelsAll_cell_cell_star_copy.hotel_rating_type]</sup></dt>
<dd>$hotelsAll_cell_cell_star_copy.location</dd>
}
</dl>
}
</fieldset>
</div>
#@altHotels[]

@specRightList[]
^hHotDesc[]
$special_[^db:getSpecial[]]
$Hotels_[^db:getHotels[$.id(^form:id.int(0))]]
$special_select_arhive[^special_.select($special_.is_archive==0)]
$special_select_all[^special_select_arhive.select($special_select_arhive.country_id==$Hotels_.country_id)]

$special_select[^table::create[$special_select_all;
            $.limit(10)
            ]]


^if($special_select){
<div class="detal_right_special">
<fieldset>
<legend align="center">Спецпредложения по ${h_hotels.hotel_country_hotel_special.[$special_select.country_id]}.</legend>
^special_select.menu{
$found($special_select.night_count)
$found_human($special_select.human_count)
$found_human_child($special_select.child_count)
$total[^if(^currency_.locate[id;$special_select.price_type]){$currency_.currency}{}]
$total_rub[^if($special_select.price){$text(^eval($special_select.price*$total))}{}]
<dl>
<dt><a href="/special/detal/id/$special_select.id/" title="Спецпредложение в отель: $special_select.hotel_name_en">$special_select.hotel_name_en</a> <sup>$h_hotels.hotel_rating_s_img.[$special_select.hotel_rating_id]</sup></dt>
<dd>${h_hotels.hotel_country.[$special_select.country_id]}. ${h_hotels.hotel_resort_ru.[$special_select.resort_id]}.</dd>
<dd>Даты: ^dtf:format[%d.%m.%Y;$special_select.dt_tour_start] &mdash^; ^dtf:format[%d.%m.%Y;$special_select.dt_tour_end] на ^num_decline[$found; $found ночь; $found ночи; <span>$found</span> ночей]. Кол-во человек: ^num_decline[$found_human; $found_human взрослый; $found_human взрослых; $found_human взрослых] ^if($special_select.child_count){ + ^num_decline[$found_human_child; $found_human_child ребенок; $found_human_child детей; $found_human_child детей]}{}.<br />Стоимость тура: $text (<em>^int2str:money2str($text) в т.ч. НДС 22%</em>)</dd>
</dl>
}
<p><a href="/special/$h_hotels.item_country.[$special_select.country_id]/" title="Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$special_select.country_id]">Все спецпредложения по $h_hotels.hotel_country_hotel_special.[$special_select.country_id]</a></p>
</fieldset>
</div>}{}
#@specRightList[]

@viewStoryHotel[]
#@viewStoryHotel[]