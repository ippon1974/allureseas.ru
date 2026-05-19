@title_global[]
$title[^db:getNews[$.id(^form:id.int(0))]]
$result[^printTitle[]]
#@title[]

@printTitle[]
^if(def $title.title && ^title.title.match[\^[[^^\^]]+\^]]){
	$result[^title.title.match[\^[([^^\^]]+)\^]][g]{$match.1}]
}{
    $result[$title.title]
}
#@printTitle[]

@GetNews[]
$news[^db:getNews[$.id(^form:id.int(0))]]
<table id="news" border="0" cellpadding="4" cellspacing="4" width="80%">
<tr>
	<td>^printArticleItem[]</td>
</tr>
<tr>
	<td>^untaint[as-is]{$news.body}</td>
</tr>
</table><br />
#@GetNews[]


@printArticleItem[]
^untaint[as-is]{
	^if(def $title.title){<h1>^title.title.match[[\[\]]][g]{}</h1>}
	<span style="color:#b5b5b5^;">^dtf:format[%d %h %Y;$title.dt;$dtf:rr-locale]</span>
}
#@printArticleItem[]







