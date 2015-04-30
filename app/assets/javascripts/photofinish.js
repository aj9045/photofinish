$(document).ready(function(){
  $('.drop-menu').hide();
  $('.drop').click(function(e) {
    e.preventDefault()
    $(this).parent().find('.drop-menu').toggle();
      console.log("hey")
  })

});