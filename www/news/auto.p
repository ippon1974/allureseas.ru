@GetNews[]
^hNews[]
$news[^db:getNews[$.limit(50)]]
<table id="news" border="0" cellpadding="4" cellspacing="4" width="80%">
^news.menu{
$last_update[^date::create[$news.dt]]

<tr valign="top">
<td class="dt">^dtf:format[%d.%m.%Y;$news.dt]</td>
<td>^printTitle[]</td>
</tr>
}
</table>
#@GetNews[]

@printTitle[]
^if(def $news.title && ^news.title.match[\^[[^^\^]]+\^]]){
	$result[^news.title.match[\^[([^^\^]]+)\^]][g]{<a href="/news/$h_news.item.[$news.article_type_id]/detal/id/$news.id/">$match.1</a>}]
}{
    $result[<a href="/news/$h_news.item.[$news.article_type_id]/detal/id/$news.id/">$news.title</a>]
}
#end @printTitle[]







