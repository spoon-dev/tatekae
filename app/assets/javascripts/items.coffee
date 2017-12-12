# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class ActPayments
  constructor: (@html) ->
    @data = $.map @html, (n, i) ->
      new ActPayment(n)

  pr: ->
    @data.reduce (prev, current, i, arr) ->
      return prev + current.isChecked

class ActPayment
  constructor: (@html) ->

  isChecked: ->
    if $(@html).find('.is-act-payer').prop('checked')
      return 1
    return 0

  setAmount: (amount) ->
    $(@html).find('.act-amount').html(amount)


$(document).on 'turbolinks:load', ->
  data = $.map $('.act-payment'), (n, i) ->
    new ActPayment(n)

  console.log data[0].setAmount = 10

