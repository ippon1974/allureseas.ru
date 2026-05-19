$(document).ready(
function(){

if($('#product_view_1').hasClass('customer')) {
         $('.user_desc').show();
 } else {
 $('.user_desc').hide();
 }
  $("img.q_sign").click(
  function(){
   var offset = $(this).offset();
   $("#prop_desc_win_content").html(prop_descr[$(this).attr('prop_id')]);
   $("#prop_desc_win").css({top: offset.top, left: offset.left-10, display: "block"})
   return false;
  });
 });
 
$(document).keyup(function(e){
 if(e.keyCode == 27 && !$("#prop_desc_win").is(':hidden'))
 {
  $('#prop_desc_win').hide()
 }
});
//==
var totalImg = 5;
var currentImg = 1;

function showPhoto(k)
{
 if(k==totalImg) {
 $('input.rightArrow').hide();
 } else {
 $('input.rightArrow').show();
 }
  if(k==1) {
 $('input.leftArrow').hide();
 } else {
 $('input.leftArrow').show();
 }
 if($('#big_' + k).hasClass('bigPhoto')) {
  $('#zoomPhoto').show();
 } else {
  $('#zoomPhoto').hide();
 }
 $('#product_view_' + currentImg).css({"display":"none"});
 $('#product_preview_' + currentImg).removeClass("selected");
 currentImg = k;
 $('#product_view_' + k).fadeIn("slow");
 if($('#product_view_' + k).hasClass('customer')) {
  $('.user_desc').show();
 } else {
 $('.user_desc').hide();
 }
 var co = $('#product_preview_' + k);
 var to = $('#previews');
 var tw = to.width();
 var tl = parseInt(to.css('left'));
 var lw = $('div.previews-inner').width();
 var cw = co.width();
 var cl = co.position().left;
 co.addClass("selected");

 if(tw <= lw) return false;
 var hl = lw / 2 - cw / 2;
 var d = hl - (cl + tl);
 var nl = tl + d;
 nl = nl > 0 ? 0 : (nl < -tw + lw ? -tw + lw : nl)-2;
 to.animate({'left': nl + 'px'}, 300);
};