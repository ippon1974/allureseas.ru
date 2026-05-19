@GetNews[]
$news[^getNews[$.limit(50)]]
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
	$result[^news.title.match[\^[([^^\^]]+)\^]][g]{<a href="/news/detal/id/$news_.id/">$match.1</a>}]
}{
    $result[<a href="/news/detal/id/$news_.id/">$news_.title</a>]
}
#end @printTitle[]







