jQuery ->
  $('.recipe_name').on 'focusout', ->
    $(this).parents('form').submit()

  $(window).on 'unload', ->
    $('.recipe_name:focus').parents('form').submit()

  $('.recipe_name').autocomplete
    source: "/private/recipes/search"
