$(document).ready(function() {
$('tr:odd').addClass('odd');
$('tr:even').addClass('even');  
$('th').parent().addClass('table-heading');
$('tr:not([th]):even').addClass('even'); 
$('tr:not([th]):odd').addClass('odd');
$('td:contains("Henry")').addClass('highlight');
});

