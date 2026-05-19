@meta_title[]
$title[^getNews[$.id(^form:id.int(0))]]
$result[$title.title]
#@meta_title[]

@meta_description[]
$description[^getNews[$.id(^form:id.int(0))]]
$result[$description.lead]
#@meta_description[]

@meta_keywords[]
$keywords[^getNews[$.id(^form:id.int(0))]]
$result[Кондиционер, установка кондиционеров, ремонт кондиционеров, сервисное обслуживание кондиционеров.]
#@meta_description[]

@detal[]
^hNews[]
$detal[^getNews[$.id(^form:id.int(0))]]
^if($detal){
<h1>$h_news.article_type_id.[$detal.article_type_id]</h1>
^TitleItem[]
^Body[]
}{^Lib:location[/404/]}
#end @detal[]

@TitleItem[]
^untaint[as-is]{
	^if(def $detal.title){<h3><div class="date">^dtf:format[%d %h %Y;$detal.dt;$dtf:rr-locale]</div>^detal.title.match[[\[\]]][g]{}</h3>}
    
}
#@printArticleItem[]

@Body[]
^untaint[as-is]{
^if(def $detal.img_1){<p><img class="thumb" src="/news/img/h/${detal.img_1}.jpg" alt="$detal.title" border="0"></p>}{}
 $detal.body
}
#@Body[]