console.log "Menu.js loaded!"
menuToggle = ->
  $('#mobile-menu').toggleClass('hide')
  $('#computer-menu').toggleClass('mobile hidden')

$('#mobile-menu a').on 'click', menuToggle
$('#menu-toggler').on 'click', menuToggle

$('.gallery-grid').NewWaterfall({width:190})

$('.ui.dropdown').dropdown()

# Quando clica no Enviar Foto ele altera a src da imagem
$('#upload-img').on 'click', () ->
  $('#form-img-loader').toggleClass('active')
  img = $('#image-random')[0].dataset.image
  $('#form-img')[0].src = img
  $('#form-img').on 'load', () ->
    $('#form-img-loader').toggleClass('active')
    $('#upload-img').toggleClass('hide')


if $('#animal_image')[0].value != ""
  console.log("Não está vazio")
  $('#form-img')[0].src = $('#animal_image')[0].value
