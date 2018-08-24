<?php
	require_once("dbconnect.php");

    $feed_id = $_POST["feed_id"];
    $user_id = $_POST["user_id"];

    $sql = "INSERT INTO `likes` (`user_id`, `feed_id`) VALUES (?, ?);";
    $data = [$user_id, $feed_id]; // 左はarray($user_id, $feed_id);と同じ
    $stmt = $dbh->prepare($sql);
    $res = $stmt->execute($data);

     echo json_encode($res);
?>