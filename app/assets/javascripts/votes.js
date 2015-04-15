function vote(advice_id, is_good, data_type){
  console.log(is_good);
  if(data_type=="json"){
    $.ajax({
      url: '/votes.json',
      dataType: data_type,
      method: "POST",
      data: {advice_id: advice_id, is_good: is_good},
      success: function(data){
        console.log(data);
        meta = '#vote-false'+'-'+data.advice_id;
        console.log(meta);
        $(meta).html('Merci pour votre vote');
        $(meta).addClass('disabled');
        $(meta).attr('onclick', '#');
        meta = '#vote-true'+'-'+data.advice_id;
        console.log(meta);
        $(meta).html('Merci pour votre vote');
        $(meta).addClass('disabled');
        $(meta).attr('onclick', '#');
      },
      error: function(data){
        var errors = data;
        console.log(data);
        console.log(errors.join(', '));
      }
    });
  }else{
    $.ajax({
      url: '/votes.js',
      method: "POST",
      data: {advice_id: advice_id, is_good: is_good}
    });
  }
}