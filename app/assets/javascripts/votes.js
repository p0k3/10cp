function vote(advice_id, is_good){
  console.log(is_good);
  $.ajax({
    url: '/votes.js',
    method: "POST",
    data: {advice_id: advice_id, is_good: is_good}
  });
}