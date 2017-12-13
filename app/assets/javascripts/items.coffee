# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  updateAmount()

  $('#tmp-amount').keyup ->
    updateAmount()

  $('.is-act-payer').change ->
    updateAmount()

  $('#registered_at_date, #registered_at_time').change ->
    registered_at = $('#registered_at_date').val() + " " + $('#registered_at_time').val()
    $('#registered_at').val registered_at

updateAmount = ->
  # clear act-amount
  $('.act-amount').html("")

  # get tmp-amount value
  tmp_amount = $('#tmp-amount').val()
  if !isFinite(tmp_amount)
    return
  if tmp_amount <= 0
    return

  # get checked act-payments
  checked_act_payments = $('.act-payment').filter ->
    $(this).find('.is-act-payer').prop('checked')

  # get act-payers-count
  act_payers_count = checked_act_payments.length
  if act_payers_count <= 0
    return

  # calc act-amount
  act_amount = ActAmount(tmp_amount, act_payers_count)

  # set act-amount
  checked_act_payments.find('.act-amount').html(act_amount)


ActAmount = (tmp_amount, act_payers_count) ->
  Math.ceil(tmp_amount / act_payers_count) * -1
