<?php

$ch = curl_init();
$options = array(CURLOPT_URL => $request_url,
    CURLOPT_HEADER => FALSE,
    CURLOPT_RETURNTRANSFER => TRUE,
    CURLOPT_CONNECTTIMEOUT => 1,
    CURLOPT_DNS_CACHE_TIMEOUT => 1,
    CURLOPT_TIMEOUT => $timeout);
curl_setopt_array($ch, $options);

$result_array["xml"] = curl_exec($ch);


$errorno = curl_errno($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
if ($errorno != 0) {
    $error = curl_error($ch);
    $log = Logger::get_instance();
    $log_msg = "CURL error  $request_url    {$error}";
    $log->log(__FILE__, __LINE__, $log_msg, L_B_ERROR);
} else if ($http_code != 200) {
    $log = Logger::get_instance();
    $log_msg = "CURL error  $request_url    with HTTP_CODE:{$http_code}";
    $log->log(__FILE__, __LINE__, $log_msg, L_B_ERROR);
} else {//normal,break out the loop.
    curl_close($ch);
    break;
}

curl_close($ch);
