function vote(advice_id, is_good){
  console.log(is_good);
  $.ajax({
    url: '/votes',
    method: "POST",
    data: {advice_id: advice_id, is_good: is_good},
    success: function(data){
      console.log(data);
      meta = '#vote-'+data.is_good+'-'+data.advice_id;
      console.log(meta);
      $(meta).html('Merci pour votre vote');
      $(meta).addClass('disabled');
      $(meta).attr('onclick', '#');
    },
    error: function(data){
      var errors = data;
      console.log(errors.join(', '));
    }
  })
}