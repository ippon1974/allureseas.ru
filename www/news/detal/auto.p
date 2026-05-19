@title[]
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
^printArticleItem[]
<div class="bodynews">^untaint[as-is]{$news.body}</div>
#@GetNews[]


@printArticleItem[]
^untaint[as-is]{
	^if(def $title.title){<h1>^title.title.match[[\[\]]][g]{}</h1>}
	<span style="color:#b5b5b5^;">^dtf:format[%d %h %Y;$title.dt;$dtf:rr-locale]</span>
}
#@printArticleItem[]







