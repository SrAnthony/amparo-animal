console.log "Menu.js loaded!"
menuToggle = ->
  $('#mobile-menu').toggleClass('hide')
  $('#computer-menu').toggleClass('mobile hidden')

$('#mobile-menu a').on 'click', menuToggle
$('#menu-toggler').on 'click', menuToggle
