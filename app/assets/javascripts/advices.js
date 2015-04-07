$(document).ready(function(){
  $('.advice .advice-content p').tweetLinkify({
    excludeMentions: true,
    excludeHashtags: true,
    hyperlinkTarget: "blank"
  });
})