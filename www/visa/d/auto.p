@title[]
$title[^getVisa[$.id(^form:id.int(0))]]
$result[Виза $title.country_ru]
#@title[]

@visa_detal[]
$visa_detal[^getVisa[$.id(^form:id.int(0))]]
$visa_detal_menu[^getVisa[]]
<table class="clobal" align="center" border="0" cellpadding="0" cellspacing="0" width="550px">
<tr>
<td colspan="2">
<h1><a href="/visa/">Все визы</a></h1>
<h2><img src="/img/flag/small/$visa_detal.flag" alt="Виза Бельгия" border="0"> Виза $visa_detal.country_ru</h2>
</td>
</tr>
<tr><td colspan="2"><hr /></td></tr>
<tr>
	<td width="400px">
<div>


</div>
	</td>
	<td width="150px"><div>
<table class="right" border="0" cellpadding="0" cellspacing="0" width="100%">
	^visa_detal_menu.menu{
	^if($form:id==$visa_detal_menu.id){
	<tr>
	<td><img src="/img/flag/i/$visa_detal_menu.flag" alt="" border="0"></td>
	<td><strong>$visa_detal_menu.country_ru</strong></td>
	</tr>
	}{
	<tr>
	<td><img src="/img/flag/i/$visa_detal_menu.flag" alt="" border="0"></td>
	<td><a href="/visa/d/country/$visa_detal_menu.id/">$visa_detal_menu.country_ru</a></td>
	</tr>
	}
	}
</table>

	</div></td>
</tr>
<tr><td colspan="2" class="footer">
<hr />
$now[^date::now[]]
&copy^;2007 &mdash^; $now.year ^company_name_ru[]<br />^adress[]<br />Интернет: ^web[]<br>Почта: ^email[]</td></tr>
</table>
<!-- CNStats begin -->
<span id="cnstats_span"><script type="text/javascript">
cnsd=document;
cnst=escape(cnsd.title);
cnst=cnst.replace(/\+/g,'%2B');
cnsa=navigator.appName;
cnsn=(cnsa.substring(0,2)=='Mi')?0:1;
cnss=screen;cnspx=(cnsn==0)?cnss.colorDepth:cnss.pixelDepth;
if (cnsd.getElementById)
{
	var i=cnsd.createElement('img');
	var amp=String.fromCharCode(38);
	var iurl='http://allureseas.ru/php/cnstats/cnt-gif1x1.php?';
	iurl+='e='+cnss.width+'.'+cnss.height;
	iurl+=amp+'d='+cnspx+amp+'r='+escape(cnsd.referrer);
	iurl+=amp+'p='+escape(cnsd.location)+amp+'t='+cnst;
	i.src=iurl;
	i.width=1;i.height=1;i.border=0;
	cnsd.getElementById('cnstats_span').appendChild(i);
}
</script></span><noscript><img src="http://allureseas.ru/php/cnstats/cnt-gif1x1.php?468&amp;c=0" width="1" height="1" border="0" alt="" /></noscript>
<!-- CNStats end -->
<!-- Yandex.Metrika counter -->
<div style="display:none;"><script type="text/javascript">
(function(w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter10190593 = new Ya.Metrika({id:10190593, enableAll: true});
        }
        catch(e) { }
    });
})(window, "yandex_metrika_callbacks");
</script></div>
<script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript" defer="defer"></script>
<noscript><div><img src="//mc.yandex.ru/watch/10190593" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
#@visa[]

@footer[]
<hr />
$now[^date::now[]]
&copy^;2007 &mdash^; $now.year ^company_name_ru[]<br />^adress[]<br />Интернет: ^web[]<br>Почта: ^email[]</td></tr>
<!-- CNStats begin -->
<span id="cnstats_span"><script type="text/javascript">
cnsd=document;
cnst=escape(cnsd.title);
cnst=cnst.replace(/\+/g,'%2B');
cnsa=navigator.appName;
cnsn=(cnsa.substring(0,2)=='Mi')?0:1;
cnss=screen;cnspx=(cnsn==0)?cnss.colorDepth:cnss.pixelDepth;
if (cnsd.getElementById)
{
	var i=cnsd.createElement('img');
	var amp=String.fromCharCode(38);
	var iurl='http://allureseas.ru/php/cnstats/cnt-gif1x1.php?';
	iurl+='e='+cnss.width+'.'+cnss.height;
	iurl+=amp+'d='+cnspx+amp+'r='+escape(cnsd.referrer);
	iurl+=amp+'p='+escape(cnsd.location)+amp+'t='+cnst;
	i.src=iurl;
	i.width=1;i.height=1;i.border=0;
	cnsd.getElementById('cnstats_span').appendChild(i);
}
</script></span><noscript><img src="http://allureseas.ru/php/cnstats/cnt-gif1x1.php?468&amp;c=0" width="1" height="1" border="0" alt="" /></noscript>
<!-- CNStats end -->
<!-- Yandex.Metrika counter -->
<div style="display:none;"><script type="text/javascript">
(function(w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter10190593 = new Ya.Metrika({id:10190593, enableAll: true});
        }
        catch(e) { }
    });
})(window, "yandex_metrika_callbacks");
</script></div>
<script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript" defer="defer"></script>
<noscript><div><img src="//mc.yandex.ru/watch/10190593" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
#@footer[]






