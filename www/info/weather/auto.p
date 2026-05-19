@GetInfo[]
$info[^table::load[/sections_footer.cfg]]
<table class="info" border="0" cellpadding="0" cellspacing="0" width="95%">
<tr valign="top">
<td class="info_left" width="25%">
<div class="info_left_div">
^left_nav_info[]
<br />


</div>
</td>
	<td class="info_center">
	<div>
	<h1 class="fontheader">^title_global[]</h1>
    ^if(^info.locate[uri;$request:uri]){<p class="title_desc_header">$info.description</p>}{}
	
	
	
	</div>
	</td>
<td class="info_right" width="20%">
	<div class="div_info_right">
    
	</div>
</td>
</tr>
</table>
#GetInfo[]


@showWeatherInfo1[]
^hWeather[]
$now[^date::now[]]
$days[^date:calendar[rus]($now.year;$now.month)]
$x[^xdoc::load[/weather.ashx.xml]]
#$x[^xdoc::load[http://api.worldweatheronline.com/free/v1/weather.ashx?q=moscow&format=xml&num_of_days=5&key=v6ac7d5bgabp986qre58vbh3]]
$list[^x.select[/data/weather]]

<table class="" border="1" cellpadding="0" cellspacing="0" width="100%">
<tr>
  ^for[j](0;$list-1){
	<th>
    $node[$list.$j]
	$str[^dtf:format[%w %d;^node.selectString[string(date)];$dtf:rs-locale]] 
    $parts[^str.split[ ;lh]]
	$h_weather.day_names.[$parts.0] $parts.1<br>
	</th>
	}
</tr> 
<tr>
  ^for[j](0;$list-1){
	<td>
    $node[$list.$j]
    <p>От ^if(^node.selectString[string(tempMinC)]<0 || ^node.selectString[string(tempMinC)]==0){^node.selectString[string(tempMinC)]}{+^node.selectString[string(tempMinC)]}</p>
    <p>До ^if(^node.selectString[string(tempMaxC)]<0 || ^node.selectString[string(tempMinC)]==0){^node.selectString[string(tempMaxC)]}{+^node.selectString[string(tempMaxC)]}</p>
    <p>$h_weather.code_weather.[^node.selectString[string(weatherCode)]]</p>
	</td>
	}
</tr> 
</table>
#@showWeatherInfo1[]

@show[]
#Хургада
$d[^date::now[]]
^hWeatherDesc[]
^cache[/../data/cache/w/eg/62318/^math:md5[$d.year $d.month $d.day]](60*60*12){
$sourceDoc[^xdoc::load[http://informer.gismeteo.ru/xml/62463_1.xml]]
$list[^sourceDoc.select[MMWEATHER/REPORT/TOWN/FORECAST]]
<h1 style="margin: 0px 0 5px 0^; color: #b63f29^; font-size: 2.1em^;">$w_h.citi_names.[62463]</h1>
<p><em>Прогноз на ^dtf:format[%d %h %Y;$news.dt;$dtf:rr-locale]г.</em></p>
<table class="weather_tbl" cellpadding="3" cellspacing="2" border="0" width="100%"><tr>
^for[j](0;$list-1){
    $node[$list.$j]
    <td>
	<p class="head">$w_h.day_names.[^node.selectString[string(@weekday)]]</p>
	<p class="head_sub">$w_h.day_day.[^node.selectString[string(@tod)]]</p>
    <p>$w_h.cloudiness_img.[^node.selectString[string(PHENOMENA/@cloudiness)]]&nbsp^;&nbsp^;$w_h.cloudiness.[^node.selectString[string(PHENOMENA/@cloudiness)]]</p>
    <p>$w_h.precipitation_img.[^node.selectString[string(PHENOMENA/@precipitation)]]&nbsp^;&nbsp^;$w_h.precipitation.[^node.selectString[string(PHENOMENA/@precipitation)]]</p>
    <p><span>Атмосферное давление</span>: Макс. ^node.selectString[string(PRESSURE/@max)]мм.рт.ст.<br /> Мин. ^node.selectString[string(PRESSURE/@min)]мм.рт.ст.</p>
    <p><span>Температура воздуха</span>: Макс. + ^node.selectString[string(TEMPERATURE/@max)]C&deg^;<br />Мин. + ^node.selectString[string(TEMPERATURE/@min)]C&deg^;</p>
    <p><span>Скорость ветра</span>:<br />Макс. &mdash^; ^node.selectString[string(WIND/@max)]м.с.<br />Мин. &mdash^; ^node.selectString[string(WIND/@min)]м.с.</p>
    <p><span>Влажность воздуха</span>:<br />Макс. ^node.selectString[string(RELWET/@max)]%<br />Мин. ^node.selectString[string(RELWET/@min)]%</p>
	</td>
	}
}</tr></table>
#@showWeatherInfo1[]




@showWeatherInfo[]
$xdoc[^xdoc::load[http://allureseas.ru/XML_daily.xml]]
$list[^xdoc.select[/ValCurs/Valute]]
^xdoc.selectString[string(/ValCurs/@Date)]<br><br>
^for[j](0;$list-1){
    $node[$list.$j]
	^node.selectString[string(@ID)]
	^node.selectString[string(Name)] — ^node.selectString[string(Value)]<br>
	}
#@showWeatherInfo1[]






@calendar[] 
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
$now[^date::now[]] 
$new_after[^date::now(+5)]
$date_after_week[^date::create($now+7)]
$days[^date:calendar[rus]($now.year;$now.month)] 
<br><br>
<table cellspacing="1" border="1" width="100%">
 

 
^days.menu{
$new_after.weekday
   <tr> 
      ^for[week_day](0;6){     
			^if($new_after.day >= $now.day){
			<td>
               $days.$week_day
            </td>
			}{}
			
      } 
   </tr> 
} 
</table> 




























