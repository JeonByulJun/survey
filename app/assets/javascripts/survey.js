$(function() {
   var button = $("#qnairebutton");
   button.attr('disabled', 'disabled');
   $('input[name=type]').change(function(e){
       if($(this).val() == "1" || $(this).val() == "2"){
           button.removeAttr('disabled');
       } else{
           button.attr('disabled', 'disabled');
       }
   });
});