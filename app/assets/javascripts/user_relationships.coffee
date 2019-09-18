# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("div.follow_btn").click ->
    if $(this).hasClass('already')
      # いいねの取り消し
      delete_url = '/user_relationships/'+$('#show_user_id').val()
      $.ajax
        url: delete_url
        type: 'delete'
    else
      # いいね追加
      $.ajax
        url: '/user_relationships/'
        type: 'post'
        data: { id : $('#show_user_id').val() }
