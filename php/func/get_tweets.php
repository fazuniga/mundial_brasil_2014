<?php
session_start();

require_once('../data/twitter_settings.php');
require_once("twitteroauth/twitteroauth/twitteroauth.php"); //Path to twitteroauth library
 
$search = "@timberners_lee OR netneutrality OR #openinternet";
$notweets = 50;
 
function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
  $connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
  return $connection;
}
   
$connection = getConnectionWithAccessToken($ConsumerKey, $ConsumerSecret, $AccessToken, $AccessTokenSecret);
 
$search = str_replace("#", "%23", $search); 
$tweets = $connection->get("https://api.twitter.com/1.1/search/tweets.json?q=".$search."&count=".$notweets);
  
echo json_encode($tweets);
?>