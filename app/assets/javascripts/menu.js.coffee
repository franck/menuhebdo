jQuery ->
  $('.recipe_name').on 'focusout', ->
    $(this).parents('form').submit()
