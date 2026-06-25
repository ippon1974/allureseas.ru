@auto[]
$db[^table::load[/../data/connection/db.cfg]]
$connect_string[mysql://$db.dbname:^db.passw.trim[]@$db.server/$db.dbname?charset=cp1251]
#$connect_string[mysql://u545600_allurese:4_2In_EsTsy@localhost/u545600_allureseas?charset=cp1251]

$MAIL[ 
   $.SMTP[localhost]
]

$request:charset[windows-1251]
$response:charset[windows-1251]
$response:content-type[
	$.value[text/html]
	$.charset[$response:charset]
]

...
# Add variable $bNewSql which you will use for switching between old/new classes.
# You'll change it to $bNewSql(1) later when you add all modifications and
# check site functionality with using old classes.
$bNewSql(0)

# modify code which create sql object.
^if($bNewSql){
#	for new classes specify your options. Use MySqlComp if you use in your code old
#	name convention style (last_insert_id) instead of new ones (lastInsertId).
#	You can switch to MySql class later when you change method names in your code.
	^use[MySqlComp.p]
	$MAIN:oSql[^MySqlComp::create[$SQL.connect-string;
		$.bDebug(1)
		$.sCacheDir[/../data/sql_cache]
		$.dCacheInterval(1/24)
	]]
}{
#	On Win32 rename old files because of Sql.p and sql.p are the same for OS.
#	Add instruction for use old class before old constructor
	^use[mysql.p]
	$MAIN:oSql[^mysql::init[$SQL.connect-string;
		$.is_debug(1)
		$.cache_dir[/../data/sql_cache]
	]]
}

...
#end @auto[]

@USE
#MySqlComp.p
LibComp.p
dtf.p
mailto.p
NConvert.p
#auth.p
uri.p
tnavigation.p
scroller.p
mailto.p
NConvert.p
Img.p
int2str.p
Antispam.p
db.p
WeatherXML.p
#@USE


@head[]
^if("/" eq $request:uri){
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="google-site-verification" content="S3eDAfRBbEFnBjTk1ZcTXikdTTNvUrCTGyJdy--qH14" />
<meta http-equiv="Content-Type" content="text/html^; charset=windows-1251" />
<meta name="description" content="^title_global[] | ^description_global[]" />
<meta name="keywords" content="^title_global[] | ^keywords_global[]" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/base-min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/style.css" media="all" />
<meta name='yandex-verification' content='76f41a1cb764ef69' />
	<title>^title_global[]</title>
</head>
}{
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html^; charset=windows-1251" />
<meta name="description" content="^title_global[] | ^description_global[]" />
<meta name="keywords" content="^title_global[] | ^keywords_global[]" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/base-min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/style.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/callback_mini.css">
<link rel="stylesheet" type="text/css" href="/css/callback.css">
<script type="text/javascript" src="/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/js/datepicker/jquery-ui-1.8.11.custom.min.js"></script>
	<title>^title_global[]</title>
</head>
}
#@head[]

@title_global[]
	$title_global[^table::load[/title_global.cfg]]
	^if(^title_global.locate[uri;$request:uri]){$result[$title_global.name]}{}
#end @title_global[]

@description_global[]
	$description_global[^table::load[/title_global.cfg]]
	^if(^description_global.locate[uri;$request:uri]){$result[$description_global.description]}{}
#end @description_global[]

@keywords_global[]
	$keywords_global[^table::load[/title_global.cfg]]
	^if(^keywords_global.locate[uri;$request:uri]){$result[$keywords_global.keywords]}{}
#end @keywords_global[]

@h_exchange[]
$h_exchange[
  $.exchange[
         $.1[32]
		 $.2[42]
		 $.3[0.752]
  ]
]
#@h_exchange[]

@ndc[]
22%
#@ndc[]

@company_name_ru[]
&laquo^;Привлекательность Морей&raquo^;
#@company_name_ru[]

@company_name_en[]
&laquo^;Allure Seas&raquo^;
#@company_name_en[]

@phone[]
#<noindex>+7 (495) 585-33-71</noindex>
#<noindex>+7 (495) 638-53-60</noindex>
<noindex>+7 (925) 585-33-71</noindex>
#@phone[]

@skype[]
<noindex>wazari1980</noindex>
#@skype[]

@web[]
<a href="http://www.allureseas.ru/">www.allureseas.ru</a>
#@web[]

@email[]
^mailto:print[mailbox@allureseas.ru][mailbox@allureseas.ru]["Привлекательность Морей"]
#email[]

@email_viarbat[]
^mailto:print[info@viparbat.ru][info@viparbat.ru]["VIP Арбат"]
#email_viarbat[]

@mode_time_working[]
Пн-Пт с 10:00 до 19:00<br />Суббота с 10:00 до 16:00<br />Воскресенье &mdash^; выходной день.
#@mode_time_working[]

@adress[]
$result[<noindex>Россия, 119019, г. Москва, ул. Новый Арбат, д. 21, офис 1646.</noindex>]
#@adress[]

@adress_post[]
$result[<noindex>Офис № 1646, ул. Новый Арбат д. 21, г. Москва, 119019.</noindex>]
#@adress_post[]

@banner_header_contacts_center[]
#<div class="banner_header_contacts_center">
#<span class="code">+7 (985)</span> <nobr><span class="phone"><noindex>769-61-08</noindex><sup class="city">Москва</sup></span></nobr>
#<p class="mode">^mode_time_working[]</p>
#</div>

<div class="banner_left">
<span>Реклама</span>
<div>
<p class="banner_left_header"><a href="http://htz.ru/services/makestone/" title="Производство изделий из камня" target="_blank">Производство изделий из камня</a></p>
<p class="banner_left_body">Столешницы на кухню, ступени, подоконники.</p>
<p class="banner_left_footer">Москва</p>
</div>
<div>
<p class="banner_left_header"><a href="http://htz.ru/services/grille/" title="Производство декоративных решеток из нержавеющей стали, латуни, меди, титана." target="_blank">Производство декоративных решеток из нержавеющей стали, латуни, меди, титана.</a></p>
<p class="banner_left_body">Производство декоративных решеток из нержавеющей стали, латуни, меди, титана.</p>
<p class="banner_left_footer">Москва</p>
</div>
</div>

#@banner_header_contacts_center[]

@banner_detal_right[]
#@banner_detal_right[]

@banner_center[]
#@banner_center[]

@banner_right[]
#@banner_right[]

@param_hotels[]
^if(in "/hotels/"){
$str[$request:uri]
$parts[^str.split[/;lh]]
$p_hotels[^db:getHotels[$.id(^form:id.int(0))]]
$param_hotel[$.country_id[$p_hotels.country_id]]
}{}
#@param_hotels[]

@h_navigation_new[]
$h_navigation_new[ 
   $.name_item[ 
         $.1[Отели]
		 $.2[]
		 $.3[Спецпредложения]
		 $.4[]
		 $.5[]
   ] 
 ] 
#@h_navigation_new[]

@navigation_new[]
^hNews[]
^h_navigation_new[]
^hHotDesc[]
$str[$request:uri] 
$parts[^str.split[/;lh]]
$sections_new[^table::load[/sections_new.cfg]]
$sections_new_parent[^table::load[/sections_new_parent.cfg]]
$hotels_global[^db:getHotels[]]
^if(in "/special/detal/"){$special_global[^db:getSpecial[$.id(^form:id.int(0))]]}{}
^if("/" eq $request:uri){}{<p class="index"><a href="/" title="Привлекательность Морей"><img src="/img/site/logo.gif" alt="" border="0"></a></p>}
<div style="margin: 0 0 1.5em 0^; border-bottom: 1px solid #ffffff^; width: 120%^; float: left^;">
<div style="width: 50%^; float: left^;">
<ul>^untaint[as-is]{
	^sections_new.menu{
	^if($sections_new.uri eq $request:uri || $sections_new.item eq $parts.3){
	<li class="active"><a href="$sections_new.uri" title="$sections_new.title">$sections_new.name</a>}{^if($sections_new.item eq $parts.1){<li class="active">}{<li>}<a href="$sections_new.uri" title="$sections_new.title">$sections_new.name</a>}<p>^sections_new_parent.menu{^if($sections_new.id==$sections_new_parent.parent_id){^if($sections_new_parent.uri eq $request:uri || $sections_new_parent.item eq $parts.3 || $sections_new_parent.parent_id ==1 && $sections_new_parent.country_id==$param_hotel.country_id || $sections_new_parent.parent_id ==3 && $sections_new_parent.country_id==$special_global.country_id){<strong><a style="color:#ff6600^;" href="$sections_new_parent.uri" title="$h_navigation_new.name_item.[$sections_new_parent.parent_id] $sections_new_parent.name">$sections_new_parent.name</a></strong>}{<a href="$sections_new_parent.uri" title="$h_navigation_new.name_item.[$sections_new_parent.parent_id] $sections_new_parent.name">$sections_new_parent.name</a>}}{}}[, ]</p></li>

}
}
</ul>
</div>
<div style="width: 50%^; float: left^;">^banner_header_contacts_center[]</div>
</div>
#@end navigation_new[]

@navigation_footer[]
$navigation_footer[^table::load[/sections_footer.cfg]]
<div class="menu_footer">
^navigation_footer.menu{
^if($navigation_footer.is_published == 1){^if($navigation_footer.uri eq $request:uri){<strong>$navigation_footer.name</strong>}{<a href="$navigation_footer.uri" title="$navigation_footer.name">$navigation_footer.name</a>}}{}
}[&nbsp^;]
</div>
<br />
#@navigation_footer[]


@hImgPatch[]
$h_patch[ 
   $.airport[
         $.1[/img/airport/def]
		 $.2[/img/airport/h]
		 $.3[/img/airport/b]
		 $.4[/img/airport/f]
		 $.5[/img/airport/s]
		 $.6[/img/airport/watermark]
   ]
]
#@hImgPatch[]

@hHotDesc[]
$h_hotels[
   $.region[ 
         $.1[Africa]
		 $.2[Asia]
		 $.3[Europe]
		 $.4[North America]
   ]
   $.region_ru[ 
         $.1[Африка]
		 $.2[Азия]
		 $.3[Европа]
		 $.4[Северная Америка]
   ]
   $.hotel_country_eng[ 
         $.1[Egypt]
		 $.2[Maldives]
		 $.3[Thailand]
		 $.4[Seychelles]
		 $.5[Turkey]
		 $.6[UAE]
		 $.7[Greece]
		 $.8[China]
		 $.9[Tunisia]
		 $.10[Mexico]
		 $.11[Bulgaria]
		 $.12[Spain]
   ]
   $.hotel_country[ 
         $.1[Египет]
		 $.2[Мальдивы]
		 $.3[Тайланд]
		 $.4[Сейшелы]
		 $.5[Турция]
		 $.6[ОАЭ]
		 $.7[Греция]
		 $.8[Китай]
		 $.9[Тунис]
		 $.10[Мексика]
		 $.11[Болгария]
		 $.12[Испания]
   ] 
   $.hotel_country_hotel[ 
         $.1[Египта]
		 $.2[Мальдив]
		 $.3[Тайланда]
		 $.4[Сейшел]
		 $.5[Турции]
		 $.6[ОАЭ]
		 $.7[Греции]
		 $.8[Китая]
		 $.9[Туниса]
		 $.10[Мексики]
		 $.11[Болгарии]
		 $.12[Испании]
   ] 
   $.hotel_country_hotel_special[ 
         $.1[Египту]
		 $.2[Мальдивам]
		 $.3[Тайланду]
		 $.4[Сейшелам]
		 $.5[Турции]
		 $.6[ОАЭ]
		 $.7[Греции]
		 $.8[Китаю]
		 $.9[Тунису]
		 $.10[Мексики]
		 $.11[Болгарии]
		 $.12[Испании]
   ] 
   $.hotel_country_hotel_tour[ 
         $.1[Египет]
		 $.2[Мальдивы]
		 $.3[Тайланд]
		 $.4[Сейшелы]
		 $.5[Турцию]
		 $.6[ОАЭ]
		 $.7[Грецию]
		 $.8[Китай]
		 $.9[Тунис]
		 $.10[Мексику]
		 $.11[Болгарию]
		 $.12[Испанию]
   ] 
   $.country_flag[ 
         $.1[flag_egypt]
		 $.2[flag_maledives]
		 $.3[flag_thailand]
		 $.4[]
		 $.5[flag_turkey]
		 $.6[flag_united_arab_emirates]
		 $.7[flag_greece]
		 $.8[]
		 $.9[flag_tunisia]
		 $.10[flag_mexico]
		 $.11[flag_bulgaria]
		 $.12[flag_spain]
   ] 
   $.item_country[ 
         $.1[egypt]
		 $.2[maldives]
		 $.3[thailand]
		 $.4[seychelles]
		 $.5[turkey]
		 $.6[uae]
		 $.7[greece]
		 $.8[china]
		 $.9[tunisia]
		 $.10[mexico]
		 $.11[bulgaria]
		 $.12[spain]
   ] 
   
    $.resort_item[ 
         $.1[hurghada] 
         $.2[elgouna] 
         $.3[marsaalam] 
         $.4[makadibay] 
         $.5[safaga] 
         $.6[somabay] 
         $.7[sharmelsheikh]
		 $.8[southmaleatoll]
		 $.9[northmaleatoll]
		 $.10[southariatoll]
		 $.11[rasdhooatoll]
		 $.12[dhaaluatoll]
		 $.13[faafuatoll]
		 $.14[haalifatoll]
		 $.15[mimaatoll]
		 $.16[baatoll]
		 $.17[raatoll]
		 $.18[adduatoll]
		 $.19[lhaviyaniatoll]
		 $.20[nonaatoll]
		 $.21[bangkok]
		 $.22[pattaya] 
		 $.23[phuket]
		 $.24[chang]
		 $.25[samui]
		 $.26[krabi]
		 $.27[phiphi]
		 $.28[Khao Lak]
		 $.29[La Digue Island]
		 $.30[Denis Island]
		 $.31[Desroches Island]
		 $.32[Praslin Island]
		 $.33[Fregat Island]
		 $.34[Cerf Island]
		 $.35[Cousine Island]
		 $.36[North Island]
		 $.37[Sainte Anne Island]
		 $.38[bursa]
		 $.39[antalya]
		 $.40[kemer]
		 $.41[belek] 
		 $.42[side]
		 $.43[alanya]
		 $.44[marmaris]
		 $.45[dalaman]
		 $.46[fethiye]
		 $.47[bodrum]
		 $.48[istanbul] 
		 $.49[didim] 
		 $.50[kusadasi] 
		 $.51[ozdere] 
		 $.52[mugla]
		 $.53[jumeirah]
		 $.54[jebelali]
		 $.55[dubai]
		 $.56[sharjah]
		 $.57[ajman]
		 $.58[abudhabi]
		 $.59[fujairah]
		 $.60[rasalkhaimah]
		 $.61[ummalquwain]
		 $.62[crete]
		 $.63[rhodes]
		 $.64[kos]
		 $.65[corfu]
		 $.66[santorini]
		 $.67[mykonos]
		 $.68[thessaloniki]
		 $.69[halkidiki]
		 $.70[athens] 
		 $.71[hammamet]
		 $.72[sousse]
		 $.73[monastir]
		 $.74[cancun]
		 $.75[playadelcarmen]
		 $.76[rivieramaya] 
		 $.77[puertomorelos]
		 $.78[mexicocity]
		 $.79[cozumelisland]
		 $.80[bansko]
		 $.81[borovets]
		 $.82[pamporovo]
		 $.83[razlog]
		 $.84[grancanaria] 
		 $.85[tenerife]
		 $.86[barcelona]
		 $.87[costabrava]
		 $.88[costadelgarraf]
		 $.89[costadaurada]
		 $.90[costadelsol]
		 $.91[mallorca]
		 $.92[lamolina]
   ] 
   
   $.hotel_resort[ 
         $.1[Hurghada] 
         $.2[El Gouna] 
         $.3[Marsa Alam] 
         $.4[Makadi Bay] 
         $.5[Safaga] 
         $.6[Soma Bay] 
         $.7[Sharm el-Sheikh]
		 $.8[South Male Atoll]
		 $.9[North Male Atoll]
		 $.10[South Ari Atoll]
		 $.11[Rasdhoo Atoll]
		 $.12[Dhaalu Atoll]
		 $.13[Faafu Atoll]
		 $.14[Ha Alif Atoll]
		 $.15[Mima Atol]
		 $.16[Ba Atoll]
		 $.17[Ra Atoll]
		 $.18[Addu Atoll]
		 $.19[Lhaviyani Atoll]
		 $.20[Nona Atol]
		 $.21[Bangkok]
		 $.22[Pattaya] 
		 $.23[Phuket]
		 $.24[o.Chang]
		 $.25[Samui]
		 $.26[Krabi]
		 $.27[o.Phi Phi]
		 $.28[Khao Lak]
		 $.29[La Digue Island]
		 $.30[Denis Island]
		 $.31[Desroches Island]
		 $.32[Praslin Island]
		 $.33[Fregat Island]
		 $.34[Cerf Island]
		 $.35[Cousine Island]
		 $.36[North Island]
		 $.37[Sainte Anne Island]
		 $.38[Bursa]
		 $.39[Antalya]
		 $.40[Kemer]
		 $.41[Belek] 
		 $.42[Side]
		 $.43[Alanya]
		 $.44[Marmaris]
		 $.45[Dalaman]
		 $.46[Fethiye]
		 $.47[Bodrum]
		 $.48[Istanbul] 
		 $.49[Didim] 
		 $.50[Kusadasi] 
		 $.51[Ozdere] 
		 $.52[Mugla]
		 $.53[Jumeirah]
		 $.54[Jebel Ali]
		 $.55[Dubai]
		 $.56[Sharjah]
		 $.57[Ajman]
		 $.58[Abu Dhabi]
		 $.59[Fujairah]
		 $.60[Ras Al Khaimah]
		 $.61[Umm Al Quwain]
		 $.62[Crete]
		 $.63[Rhodes]
		 $.64[Kos]
		 $.65[Corfu]
		 $.66[Santorini]
		 $.67[Mykonos]
		 $.68[Thessaloniki]
		 $.69[Halkidiki]
		 $.70[Athens] 
		 $.71[Hammamet]
		 $.72[Sousse]
		 $.73[Monastir]
		 $.74[Cancun]
		 $.75[Playa Del Carmen]
		 $.76[Riviera Maya] 
		 $.77[Puerto Morelos]
		 $.78[Mexico City]
		 $.79[Cozumel Island]
		 $.80[Bansko]
		 $.81[Borovets]
		 $.82[Pamporovo]
		 $.83[Razlog]
		 $.84[Gran Canaria] 
		 $.85[Tenerife]
		 $.86[Barcelona]
		 $.87[Costa Brava]
		 $.88[Costa Del Garraf]
		 $.89[Costa Daurada]
		 $.90[Costa Del Sol]
		 $.91[Mallorca]
		 $.92[La Molina]
   ] 
      $.hotel_resort_ru[ 
         $.1[Хургада] 
         $.2[Эль Гуна] 
         $.3[Марса Алам] 
         $.4[Макади Бей] 
         $.5[Сафага] 
         $.6[Сома Бэй] 
         $.7[Шарм-эш-Шейх]
		 $.8[Южный Мале Атолл]
		 $.9[Северный Мале Атолл]
		 $.10[Южный Ари Атолл]
		 $.11[Расду Атолл]
		 $.12[Даалу Атолл]
		 $.13[Фаафу Атолл]
		 $.14[Ха Алиф Атолл]
		 $.15[Миму Атолл]
		 $.16[Ба Атолл]
		 $.17[Ра Атолл]
		 $.18[Адду Атолл]
		 $.19[Лавиани Атолл]
		 $.20[Нону Атолл]
		 $.21[Бангкок]
		 $.22[Паттайя] 
		 $.23[о.Пхукет]
		 $.24[о.Чанг]
		 $.25[Самуи]
		 $.26[Краби]
		 $.27[о.Пхи Пхи]
		 $.28[Као Лак]
		 $.29[La Digue Island]
		 $.30[Denis Island]
		 $.31[Desroches Island]
		 $.32[Praslin Island]
		 $.33[Fregat Island]
		 $.34[Cerf Island]
		 $.35[Cousine Island]
		 $.36[North Island]
		 $.37[Sainte Anne Island]
		 $.38[Бурса]
		 $.39[Анталия]
		 $.40[Кемер]
		 $.41[Белек] 
		 $.42[Сиде]
		 $.43[Алания]
		 $.44[Мармарис]
		 $.45[Даламан]
		 $.46[Фетхие]
		 $.47[Бодрум]
		 $.48[Стамбул] 
		 $.49[Дидим] 
		 $.50[Кушадасы] 
		 $.51[Оздере] 
		 $.52[Мугла]
		 $.53[Jumeirah]
		 $.54[Джебель-Али]
		 $.55[Дубай]
		 $.56[Шарджа]
		 $.57[Аджман]
		 $.58[Абу-Даби]
		 $.59[Фуджейра]
		 $.60[Рас-аль-Хайма]
		 $.61[Умм-аль-Кувейн]
		 $.62[Крит]
		 $.63[Родос]
		 $.64[Кос]
		 $.65[Corfu]
		 $.66[Санторини]
		 $.67[Mykonos]
		 $.68[Салоники]
		 $.69[Халкидики]
		 $.70[Афины] 
		 $.71[Хаммамет]
		 $.72[Сусс]
		 $.73[Монастир]
		 $.74[Канкун]
		 $.75[Плайя-дель-Кармен]
		 $.76[Ривьера-Майя] 
		 $.77[Пуэрто-Морелос]
		 $.78[Mexico City]
		 $.79[Cozumel Island]
		 $.80[Банско]
		 $.81[Боровец]
		 $.82[Пампорово]
		 $.83[Разлог]
		 $.84[Гран-Канария] 
		 $.85[Тенерифе]
		 $.86[Барселона]
		 $.87[Коста Брава]
		 $.88[Коста дель Гарраф]
		 $.89[Коста Дорада]
		 $.90[Коста дель Соль]
		 $.91[Майорка]
		 $.92[Ла Молина]
   ] 
   $.hotel_rating[ 
         $.1[2*] 
         $.2[3*] 
         $.3[3*+] 
         $.4[4*] 
         $.5[4*+] 
         $.6[5*] 
         $.7[5*De Luxe]
		 $.8[Apart]
   ] 
   $.hotel_rating_img[ 
         $.1[<img src="/img/rating/2.gif" alt="" />] 
         $.2[<img src="/img/rating/3.gif" alt="" />] 
         $.3[<img src="/img/rating/3_5.gif" alt="" />] 
         $.4[<img src="/img/rating/4.gif" alt="" />] 
         $.5[<img src="/img/rating/4_5.gif" alt="" />] 
         $.6[<img src="/img/rating/5.gif" alt="" />]
		 $.7[<img src="/img/rating/5.gif" alt="" />]
		 $.8[<strong style="color:red^;">Apart</strong>]
   ] 
  $.hotel_rating_s_img[ 
         $.1[<img src="/img/rating/s/2.gif" alt="" />] 
         $.2[<img src="/img/rating/s/3.gif" alt="" />] 
         $.3[<img src="/img/rating/s/3_5.gif" alt="" />] 
         $.4[<img src="/img/rating/s/4.gif" alt="" />] 
         $.5[<img src="/img/rating/s/4_5.gif" alt="" />] 
         $.6[<img src="/img/rating/s/5.gif" alt="" />]
		 $.7[<img src="/img/rating/s/5.gif" alt="" />]
		 $.8[<strong style="color:red^;">Apart</strong>]
   ] 
   $.hotel_power[
         $.1[Full Board]
         $.2[Bed Breakfast] 
         $.3[Half Board] 
         $.4[All Inclusive] 
         $.5[Golden All Inclusive] 
         $.6[Ultra All Inclusive] 
         $.7[Extra All Inclusive] 
		 $.8[Deluxe All Inclusive] 
		 $.9[Imperial All Inclusive]
		 $.10[Premium All Inclusive]
		 $.11[Royal All Inclusive]
		 $.12[Superior All Inclusive]
		 $.13[Elite All Inclusive]
		 $.14[Only Bed]
		 $.15[Special Category]
   ] 
    $.hotel_power_code[
         $.1[FB]
         $.2[BB] 
         $.3[HB] 
         $.4[] 
         $.5[] 
         $.6[] 
         $.7[] 
		 $.8[] 
		 $.9[]
		 $.10[]
		 $.11[]
		 $.12[]
		 $.13[]
		 $.14[]
		 $.15[]
   ] 
   $.hotel_power_field[
         $.1[power_full_board]
         $.2[power_bed_breakfast] 
         $.3[power_half_board] 
         $.4[power_all_inclusive] 
         $.5[power_golden_all_inclusive] 
         $.6[power_ultra_all_inclusive] 
         $.7[power_extra_all_inclusive] 
		 $.8[power_deluxe_all_inclusive] 
		 $.9[power_imperial_all_inclusive]
		 $.10[power_premium_all_inclusive]
		 $.11[power_royal_all_inclusive]
		 $.12[power_superior_all_inclusive]
		 $.13[power_elite_all_inclusive]
		 $.14[power_only_bed]
		 $.15[power_special_category]
   ] 
   
   $.hotel_power_desc[ 
         $.1[Полный пансион &mdash^; трехразовое питание (завтрак, обед, ужин)] 
         $.2[Только завтрак] 
         $.3[Полупансион &mdash^; двухразовое питание (завтрак, ужин) ] 
         $.4[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.] 
         $.5[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.] 
         $.6[Питание, напитки местного и некоторые напитки импортного производства, большинство спортивных развлечений &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "ультра всё включено", устанавливает часы ее действия и место проведения. Разновидности этой системы могут носить различные названия: Deluxe All Inclusive, Superior All Inclusive и другие.] 
         $.7[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.] 
		 $.8[Питание, напитки местного и некоторые напитки импортного производства, большинство спортивных развлечений &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "ультра всё включено", устанавливает часы ее действия и место проведения. Разновидности этой системы могут носить различные названия: Deluxe All Inclusive, Superior All Inclusive и другие.] 
		 $.9[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.]
		 $.10[Питание, напитки местного и некоторые напитки импортного производства, большинство спортивных развлечений &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "ультра всё включено", устанавливает часы ее действия и место проведения. Разновидности этой системы могут носить различные названия: Deluxe All Inclusive, Superior All Inclusive и другие.]
		 $.11[Питание, напитки местного и некоторые напитки импортного производства, большинство спортивных развлечений &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "ультра всё включено", устанавливает часы ее действия и место проведения. Разновидности этой системы могут носить различные названия: Deluxe All Inclusive, Superior All Inclusive и другие.]
		 $.12[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.]
		 $.13[Питание, напитки местного производства, некоторые спортивные развлечения &mdash^; включены в стоимость. Каждый отель, по своему усмотрению, включает перечень услуг, входящих в систему "всё включено", устанавливает часы ее действия и место проведения.]
  		 $.14[Специальный тариф, куда не включено питание. Его вы можете приобрести за дополнительную плату.]
		 $.15[-]
   ] 
   
  $.hotel_type_desc[ 
         $.1[Наличие водной горки] 
         $.2[Отдых с детьми] 
         $.3[Корпоратив] 
         $.4[Процедуры (SPA)] 
         $.5[Городской отель]
		 $.6[Талоссотерапия]
		 $.7[Гольф]
		 $.8[Blue Flag]
		 $.9[Сваденбная церемония]
   ]
   
  $.hotel_type_desc_desc[ 
         $.1[Наличие в отеле как минимум одной водной горки.] 
         $.2[Отели, рекомендуемые для отдыха с детьми, и предполагает наличие минимум четырех услуг для детей таких как: детский сад, мини-клуб, услуги няни, аквапарк,  детский бассейн, детское меню.] 
         $.3[Отели, располагающие необходимым оборудованием для проведения конференций и рекомендуемые для организации incentive-туров для сотрудников предприятий и для туров, совмещающих отдых с обучением и проведением семинаров.] 
         $.4[Отели, имеющие SPA-центры, в которых проводятся оздоровительные процедуры.]
         $.5[Отели расположенные в городской черте]
		 $.6[Отели, имеющие талассо-центры, в которых проводятся оздоровительные процедуры.]
		 $.7[Отель имеет возможности по организации занятий данным видом спорта.]
		 $.8[Своеобразный сертификат качества содержания пляжа, его экологической чистоты, учрежденный Foundation for Environmental Education]
		 $.9[Отели с возможность проведения свадебных церемоний.]
   ]
   
  $.hotel_type_desc_field[ 
         $.1[water] 
         $.2[children] 
         $.3[incentive] 
         $.4[spa] 
         $.5[cIty]
		 $.6[talostoterapiya]
		 $.7[golf]
		 $.8[blue_flag]
		 $.9[wedding]
   ]
   
  $.date[
         $.1[1970]
         $.2[1971]
         $.3[1972]
         $.4[1973]
         $.5[1974]
		 $.6[1975]
         $.7[1976]
         $.8[1977]
         $.9[1978]
         $.10[1979]
		 $.11[1980]
         $.12[1981]
         $.13[1982]
         $.14[1983]
         $.15[1984]
		 $.16[1985]
         $.17[1986]
         $.18[1987]
         $.19[1988]
         $.20[1989]
		 $.21[1990]
         $.22[1991]
         $.23[1992]
         $.24[1993]
         $.25[1994]
		 $.26[1995]
         $.27[1996]
         $.28[1997]
         $.29[1998]
         $.30[1999]
		 $.31[2000]
         $.32[2001]
         $.33[2002]
         $.34[2003]
         $.35[2004]
		 $.36[2005]
         $.37[2006]
         $.38[2007]
         $.39[2008]
         $.40[2009]
		 $.41[2010]
         $.42[2011]
		 $.43[2012]
		 $.44[2013]
		 $.45[2014]
		 $.46[2015]
   ]
   $.db_field[
   		 $.1[country_id]
		 $.2[hotel_name_en] 
		 $.3[hotel_name_ru] 
		 $.4[hotel_rating_type] 
		 $.5[recommends]
		 $.6[exclusive] 
		 $.7[power_full_board] 
		 $.8[power_bed_breakfast] 
		 $.9[power_half_board]
		 $.10[power_all_inclusive] 
		 $.11[power_golden_all_inclusive] 
		 $.12[power_ultra_all_inclusive] 
		 $.13[power_extra_all_inclusive] 
		 $.14[power_deluxe_all_inclusive] 
		 $.15[power_imperial_all_inclusive] 
		 $.16[power_premium_all_inclusive] 
		 $.17[power_royal_all_inclusive]
		 $.18[power_superior_all_inclusive] 
		 $.19[power_elite_all_inclusive]
		 $.20[power_only_bed]
		 $.21[power_special_category]
		 $.22[resort_id]
		 $.23[founded_date]
		 $.24[building_conservation_date]
		 $.25[location]
		 $.26[size]
		 $.27[phone_fax]
		 $.28[website]
		 $.29[location_of_hotel]
		 $.30[water]
		 $.31[children]
		 $.32[incentive]
		 $.33[spa]
		 $.34[cIty]
		 $.35[golf]
		 $.36[blue_flag]
		 $.37[talostoterapiya]
		 $.38[wedding]
		 $.39[introduction_hotel]
		 $.40[infrastructure]
		 $.41[free_services]
		 $.42[paid_services]
		 $.43[def_services]
		 $.44[for_children]
		 $.45[amenities_room]
		 $.46[types_room]
		 $.47[add_information]
		 $.48[power_information]
		 $.49[spa_information]
		 $.50[news_hotel]
		 $.51[description]
		 $.52[keywords]
   ]
]
#@hHotDesc[]

@hWeather[]
$h_weather[
$.day_names[ 
         $.0[Вс] 
         $.1[Пн] 
         $.2[Вт] 
         $.3[Ср] 
         $.4[Чт] 
         $.5[Пт] 
         $.6[Сб] 
         ]
$.day_names_long[ 
         $.0[Восресенье] 
         $.1[Понедельник] 
         $.2[Вторник] 
         $.3[Среда] 
         $.4[Четверг] 
         $.5[Пятница] 
         $.6[Суббота] 
         ]
$.code_weather[
         $.122[Облачно]
         $.113[Ясно]
         $.116[Облачно с прояснениями]
		 $.119[Облачно]
		 $.143[Туман]
		 $.176[Переменная облачность, небольшой дождь]
		 $.263[Местами дождь]
		 $.296[Небольшой дождь]
		 $.362[Небольшой снег]
         ]
]
#@hWeather[]

@hCalendar[] 
$calendar_locale[ 
   $.month_names[ 
         $.1[Январь] 
         $.2[Февраль] 
         $.3[Март] 
         $.4[Апрель] 
         $.5[Май] 
         $.6[Июнь] 
         $.7[Июль] 
         $.8[Август] 
         $.9[Сентябрь] 
         $.10[Октябрь] 
         $.11[Ноябрь] 
         $.12[Декабрь] 
   ] 
   $.day_names[ 
         $.0[пн] 
         $.1[вт] 
         $.2[ср] 
         $.3[чт] 
         $.4[пт] 
         $.5[сб] 
         $.6[вс] 
   ] 
   $.day_colors[ 
         $.0[#000000] 
         $.1[#000000] 
         $.2[#000000] 
         $.3[#000000] 
         $.4[#000000] 
         $.5[#800000] 
         $.6[#800000] 
   ] 
]
#@hCalendar[]

@hTime[]
$h_time[ 
   $.hour[ 
         $.1[01]
		 $.2[02]
		 $.3[03]
		 $.4[04]
		 $.5[05]
		 $.6[06]
		 $.7[07]
		 $.8[08]
		 $.9[09]
	     $.10[10]
		 $.11[11]
		 $.12[12]
		 $.13[13]
		 $.14[14]
		 $.15[15]
		 $.16[16]
		 $.17[17]
		 $.18[18]
	     $.19[19]
		 $.20[20]
		 $.21[21]
		 $.22[22]
		 $.23[23]
		 $.24[00]
   ] 
   $.minute[ 
         $.1[01]
		 $.2[02]
		 $.3[03]
		 $.4[04]
		 $.5[05]
		 $.6[06]
		 $.7[07]
		 $.8[08]
		 $.9[09]
		 $.10[10]
		 $.11[11]
		 $.12[12]
		 $.13[13]
		 $.14[14]
		 $.15[15]
		 $.16[16]
		 $.17[17]
		 $.18[18]
		 $.19[19]
		 $.20[20]
		 $.21[21]
		 $.22[22]
		 $.23[23]
		 $.24[24]
		 $.25[25]
		 $.26[26]
		 $.27[27]
		 $.28[28]
		 $.29[29]
		 $.30[30]
		 $.31[31]
		 $.32[32]
		 $.33[33]
		 $.34[34]
		 $.35[35]
		 $.36[36]
		 $.37[37]
		 $.38[38]
		 $.39[39]
		 $.40[40]
		 $.41[41]
		 $.42[42]
		 $.43[43]
		 $.44[44]
		 $.45[45]
		 $.46[46]
		 $.47[47]
		 $.48[48]
		 $.49[49]
		 $.50[50]
		 $.51[51]
		 $.52[52]
		 $.53[53]
		 $.54[54]
		 $.55[55]
		 $.56[56]
		 $.57[57]
		 $.58[58]
		 $.59[59]
		 $.60[00]
   ] 
   $.night_count[ 
         $.1[1]
		 $.2[2]
		 $.3[3]
		 $.4[4]
		 $.5[5]
		 $.6[6]
		 $.7[7]
		 $.8[8]
		 $.9[9]
		 $.10[10]
		 $.11[11]
		 $.12[12]
		 $.13[13]
		 $.14[14]
		 $.15[15]
		 $.16[16]
		 $.17[17]
		 $.18[18]
		 $.19[19]
		 $.20[20]
		 $.21[21]
		 $.22[22]
		 $.23[23]
		 $.24[24]
		 $.25[25]
		 $.26[26]
		 $.27[27]
		 $.28[28]
		 $.29[29]
		 $.30[30]
		 $.31[31]	
		 $.32[0]	
   ]
   $.human_count[ 
         $.1[1]
		 $.2[2]
		 $.3[3]
		 $.4[4]
		 $.5[5]
		 $.6[6]
		 $.7[7]
		 $.8[8]
		 $.9[9]
		 $.10[0]
   ]
   $.child_count[ 
         $.1[1]
		 $.2[2]
		 $.3[3]
		 $.4[4]
		 $.5[5]
		 $.6[0]
   ]
   $.age_child[ 
         $.1[1]
		 $.2[2]
		 $.3[3]
		 $.4[4]
		 $.5[5]
		 $.6[6]
		 $.7[7]
		 $.8[8]
		 $.9[9]
		 $.10[10]
		 $.11[11]
		 $.12[12]
		 $.13[13]
		 $.14[14]
		 $.15[15]
   ]
 ]
#@hTime[]


@hNews[]
$h_news[ 
   $.article_type_id[ 
         $.1[Новости компании]
		 $.2[Новости рынка]
		 $.3[Выставки]
		 $.4[Статьи]
		 $.5[Спецпредложение]
		 $.6[Акции]
   ] 
   $.item[ 
         $.1[cnews]
		 $.2[marketnews]
		 $.3[show]
		 $.4[item]
		 $.5[specials]
		 $.6[actions]
   ] 
 ]
#@hNews[]

@getCNStats[hParam]
$hParam[^hash::create[$hParam]]
$result[^MAIN:pSQL.table{
	SELECT
		hits AS id,
		hosts,
		t_hits,
		t_hosts,
		last,
		visible,
		t_users,
		users,
		u_hits,
		u_hosts,
		u_t_hits,
		u_t_hosts
	FROM
		cns_counter
}[
	^if(def $hParam.limit){$.limit($hParam.limit)}
	^if(def $hParam.offset){$.offset($hParam.offset)}
]]
#@getCNStats[]

@num_decline[num;nominative;genitive_singular;genitive_plural]
^if($num > 10 && (($num % 100) \ 10) == 1){
        $result[$genitive_plural]
}{
        ^switch($num % 10){
                ^case(1){$result[$nominative]}
                ^case(2;3;4){$result[$genitive_singular]}
                ^case(5;6;7;8;9;0){$result[$genitive_plural]}
        }
}
#@num_decline[]


@all_getalfa[]
$al[^MAIN:oSql.table{SELECT (LEFT (hotel_name_en,1)) AS letter FROM full_hotels WHERE is_published = 1 GROUP BY LCASE(LEFT(hotel_name_en,1))}]
^al.sort{$al.letter}
<table class="abc" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top">
^al.menu{
       <td>^if($form:letter eq $al.letter){<a class="act" href="/hotels/abc/letter/$al.letter/" title="Отели на букву $al.letter">$al.letter</a>}{<a href="/hotels/abc/letter/$al.letter/" title="Отели на букву $al.letter">$al.letter</a>}</td>
}</tr>
</table>
#@all_getalfa[]


@CNStats[]
$CNStats[^getCNStats[]]
$result[$CNStats.t_users]
#@CNStats[]

@footer[]
$now[^date::now[]]
<br />
<hr />
<br />
<div class="footer">
#^navigation_footer[]
Компания &laquo^;Привлекательность Морей&raquo^; <em>желает Вам незабываемых путешествий!<br /></em>
2010 &mdash^; $now.year &laquo^;Allure Seas&raquo^; (<em>beta</em>)&nbsp^;&nbsp^; Электропочта: <strong>^email[]</strong>
<br />^if($request:uri eq "/ad/"){<span class="ad">Реклама на сайте</span>}{<span class="ad"><a href="/ad/">Реклама на сайте</a></span>}
</div>
<br />
<!-- Yandex.Metrika counter -->
<!-- /Yandex.Metrika counter -->
#@footer[]