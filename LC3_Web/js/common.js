function copyTable2(tableId) {
  var ta = document.getElementById(tableId); 
  var range = document.createRange();
  range.selectNode(ta); 
  window.getSelection().addRange(range); 
  document.execCommand('copy'); 
  window.getSelection().removeAllRanges();
}

function toHref(ahref) {
	window.location.href=ahref;
}