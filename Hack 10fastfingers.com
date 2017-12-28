var TimeGO=250;
var Wordcd;
var i =0;
var l =0;
var Hotskill;
function hackit(){
if(i<words.length){
Hotskill=words[i].split("");
l=0;
hackit1();
}
}
function hackit1(){
if(l<Hotskill.length){
Wordcd = Hotskill[l]; 
$('#inputfield').val($('#inputfield').val()+Wordcd);
l++;
setTimeout('hackit1()', TimeGO);
} else {
 $('#inputfield').val(words[i]+" ");
        var keyup = jQuery.Event('keyup');
        keyup.which = 32;
        $('#inputfield').trigger(keyup);
i++;
hackit();
}
}
setTimeout('hackit()', 250);
