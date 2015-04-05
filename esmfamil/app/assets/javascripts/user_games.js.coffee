# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

PrivatePub.subscribe "/user_games/new/" + data2.creator.to_s, (data1, data2,  channel) ->
  alert data1.user_game.nickname + ' به بازی ملحق شد'
