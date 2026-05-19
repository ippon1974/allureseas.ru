function trim(str)
{
 return str.replace(/^[\s\xA0]+/, '').replace(/[\s\xA0]+$/, '').replace(/ +$/, '').replace(/^ +/, '');
}

function isEmail(email)
{
 var pattern = /^[-._A-Za-z0-9]{1,}@[-._A-Za-z0-9]{1,}\.[A-Za-z]{2,4}$/;
 return pattern.test(email);
}

function isPhone(phone)
{
 var pattern = /^([+])?[0-9\s\(\)-]{10,}$/;
 return pattern.test(phone);
}

function ajax_add4Compare(itemId, onlyAdd, state, compare_place)
{
 compare_place = !compare_place ? 'catalog' : compare_place;
 var ajax = new Ajax('/ajax/ajax_compare.php');
 ajax.addParam('itemId', itemId);
 ajax.addParam('onlyAdd', onlyAdd);
 ajax.addParam('state', state);
 ajax.addParam('compare_place', compare_place);
 ajax.run();
}

function compareItems()
{
 box = document.getElementsByName('compareID');
 for(i=0,k=box.length;i<k;i++)
 {
  if(box[i].checked)
  {
   ajax_add4Compare(box[i].value, 1, true);
  }
 }
 window.open ("/compare","statuswin","menubar=0,location=1,scrollbars=1,resizable=1,top=170,left=100");
}

function ajax_add2Order(itemId, price)
{
 var ajax = new Ajax('/ajax/ajax_order.php');
 ajax.addParam('op', 'order');  
 ajax.addParam('itemId', itemId);
 ajax.addParam('price', price);
 ajax.run();
}

function ajax_setVote(voteId, questionId)
{
 var ajax = new Ajax('/ajax/ajax_vote.php');
 ajax.addParam('voteId', voteId);
 ajax.addParam('questionId', questionId);
 ajax.run();
}

function Ajax(url)
{
 this.url = url;
 this.method = 'POST';
 this.getXmlHttp = function() {
 var xmlhttp;
  //try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP.5.0"); } catch (e) {
  // try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP.4.0"); } catch (e2) {
  //  try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP.3.0"); } catch (e3) {
     try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); } catch (e4) {
      try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); } catch (e5) {xmlhttp = false;}} //}}}
  if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {xmlhttp = new XMLHttpRequest();}
  return xmlhttp;
 }
 this.xmlhttp = this.getXmlHttp();
 this.params = 'ajax_key=1';
 this.addParam = function(name, value) {this.params += '&' + name + '=' + value;}
 this.run = function(){
  var xmlhttp = this.xmlhttp;
  xmlhttp.open(this.method, this.url, true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  //xmlhttp.setRequestHeader("Connection", "close");
  //xmlhttp.setRequestHeader("Content-length", this.params.length);
  xmlhttp.onreadystatechange = function() { if (xmlhttp.readyState == 4  && xmlhttp.status == 200) {eval(xmlhttp.responseText);}}
  xmlhttp.send(this.params);
 }
}

function plural(n, words)
{
 var plural=(n%10==1 && n%100!=11) ? 0 : ((n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20)) ? 1 : 2);
 return words[plural];
}