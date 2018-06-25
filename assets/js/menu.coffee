console.log "Menu.js loaded!"
menuToggle = ->
  $('#mobile-menu').toggleClass('hide')
  $('#computer-menu').toggleClass('mobile hidden')

$('#mobile-menu a').on 'click', menuToggle
$('#menu-toggler').on 'click', menuToggle

$('.gallery-grid').NewWaterfall({width:190})

$('.ui.dropdown').dropdown()
