@visa[]
^h_exchange[]
$visa[^getVisa[]]
$visa_price[^getVisaPrice[]]
$visa_price_hash[^visa_price.hash[id]]
<table class="clobal" align="center" border="0" cellpadding="0" cellspacing="0" width="550px">
<tr>
<td colspan="2">
<h1>Мы предлагаем Вам свои услуги по оформлению документов на получение виз других государств. </h1>
<p>Возможно оформления <strong>разовых</strong> и <strong>многократных виз</strong>: деловых, туристических, студенческих.</p>
<p>Для оформления визы Вам необходимо собрать и доставить к нам все необходимые документы, для предоставления их в посольство или консульство той страны, в которую Вы собираетесь выехать.</p>

</td>
</tr>
<tr><td colspan="2"><hr /></td></tr>
<tr>
	<td width="400px">
	<div>

<script src="/js/_01.js" type="text/javascript"></script>
<table class="visa_screen" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<th></th>
<th>Страна</th>
<th>^$США</th>
<th>Евро</th>
<th>Руб.</th>
</tr>
^visa.menu{
$visa_price[$visa_price_hash.[$visa.id].visa_short_price]
<tr>
<td><span><img src="/img/flag/i/$visa.flag" alt="Виза $visa.country_ru" border="0"></span></td>
<td><span><a href="/visa/d/country/$visa.id/">Виза $visa.country_ru / $visa.country_en</a></span></td>
<td><span class="price">^if($visa_price){$visa_price}{}</span></td>
<td><span class="price">^if($visa_price){^eval($visa_price*$h_exchange.exchange.[3])}{}</span></td>
<td><span class="price">^if($visa_price){^eval($visa_price*$h_exchange.exchange.[1])}{}</span></td>
</tr>
}

</table>
	
	</div>
	</td>
	<td width="150px"><div>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td></td>
</tr>

</table>
	
	</div></td>
</tr>
<tr>
<td colspan="2" class="footer">
<hr />
$now[^date::now[]]
&copy^;2007 &mdash^; $now.year ^company_name_ru[]<br />^adress[]<br />Интернет: ^web[]<br>Почта: ^email[]<br>Рады видеть ^CNStats[]-го посетителя</td>
</tr>
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