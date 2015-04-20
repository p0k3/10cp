$(document).ready(function(){
  $('.advice .advice-content p').tweetLinkify({
    excludeMentions: true,
    excludeHashtags: true,
    hyperlinkTarget: "blank"
  });

  $('.advices').masonry({
    itemSelector: '.advice',
    gutterWidth: 30,
    columnWidth: 100
  });
})