@GetNews[]
^hNews[]
$news[^db:getNews[]]
$news_[^news.select($news.article_type_id==2)]
<table id="news" border="0" cellpadding="4" cellspacing="4" width="80%">
^news_.menu{
<tr valign="top">
<td class="dt">^dtf:format[%d.%m.%Y;$news_.dt]</td>
<td>^printTitle[]</td>
</tr>
}
</table>
#@GetNews[]

@printTitle[]
^if(def $news_.title && ^news_.title.match[\^[[^^\^]]+\^]]){
	$result[^news_.title.match[\^[([^^\^]]+)\^]][g]{<a href="/news/$h_news.item.[$news_.article_type_id]/detal/id/$news_.id/">$match.1</a>}]
}{
    $result[<a href="/news/$h_news.item.[$news_.article_type_id]/detal/id/$news_.id/">$news_.title</a>]
}
#end @printTitle[]







