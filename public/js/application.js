$(document).ready(function() {
  var $this = $(this),
    $stats = $('.statsBar'),
    $viewStats = $('.viewStats');

  $viewStats.on('click', function(){
    if ($stats.hasClass('hide')) {
      $stats.removeClass('hide').addClass('show');
    }
    else {
      $stats.removeClass('show').addClass('hide');
    }
  });
});
