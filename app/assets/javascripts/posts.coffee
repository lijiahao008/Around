$ ->
  $('.panel-google-plus > .panel-footer > .input-placeholder, .panel-google-plus > .panel-google-plus-comment > .panel-google-plus-textarea > button[type="reset"]').on 'click', (event) ->
    $panel = $(this).closest('.panel-google-plus')
    $comment = $panel.find('.panel-google-plus-comment')
    $comment.find('.btn:first-child').addClass 'disabled'
    $comment.find('textarea').val ''
    $panel.toggleClass 'panel-google-plus-show-comment'
    if $panel.hasClass('panel-google-plus-show-comment')
      $comment.find('textarea').focus()
    return
  $('.panel-google-plus-comment > .panel-google-plus-textarea > textarea').on 'keyup', (event) ->
    $comment = $(this).closest('.panel-google-plus-comment')
    $comment.find('button[type="submit"]').addClass 'disabled'
    if $(this).val().length >= 1
      $comment.find('button[type="submit"]').removeClass 'disabled'
    return
  return


$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'