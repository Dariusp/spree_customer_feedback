Spree.Feedback = () ->
  $(".rating").raty({
    path:'/assets/',
    click: (score, evn)->
      rate_type = $(this).data("rate-name")
      rate_product = $(this).data("rate-product")
      rate_feedback = $(this).data("rate-feedback")
      $.post Spree.routes.feedback, {score: score, rate_type: rate_type, rate_product:rate_product, rate_feedback:rate_feedback}, (data) ->
        alert(data)
  })


Spree.ready ($) ->
  Spree.Feedback()