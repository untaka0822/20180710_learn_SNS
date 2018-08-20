<?php
    session_start();
    require_once('dbconnect.php');
    // requireとの違いは、ファイルがすでに読み込まれている場合は再読み込みをしないという点です。

    //ログインユーザー情報の取得
    $sql = 'SELECT * FROM `users` WHERE `id`=?';
    $data = array($_SESSION["id"]);
    $stmt = $dbh->prepare($sql);
    $stmt->execute($data);

    $login_user = $stmt->fetch(PDO::FETCH_ASSOC);

    // GET送信で飛んでいる値、feed_idの値を条件にUPDATE文で値を更新するため、元のデータを取得
    $feed_id = $_GET["feed_id"]; // timeline.phpでaタグを押された時に飛ぶGET送信の値を扱いやすいよう値を代入

    // 更新ボタンが押された時
    if (!empty($_POST)) {
        // UPDATE文で$_POST['feed']の値を更新してtimeline.phpに遷移する
        // UPDATE `テーブル名` SET `更新したいカラム名`=更新したい値 WHERE 条件
        // 必ず条件をつける！！！！！！！！！！！！！
        $sql = "UPDATE `feeds` SET `feed`=? WHERE `id`=?";
        $data = array($_POST['feed'], $feed_id);
        // $data[0]が$_POST['feed']の値、// $data[1]が$feed_idの値
        $stmt = $dbh->prepare($sql);
        $stmt->execute($data);

         header("Location: timeline.php");
         exit;
    }

    $sql = "SELECT `feeds`.*,`users`.`name`,`users`.`img_name` FROM `feeds` LEFT JOIN `users` ON `feeds`.`user_id`=`users`.`id` WHERE `feeds`.`id`=$feed_id";
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    $feed = $stmt->fetch(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
    <title>Learn SNS</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body style="margin-top: 60px;">
    <?php include('nav.php'); ?>
    <div class="container">
        <div class="row">
            <!-- ここにコンテンツ -->
            <div class="col-xs-4 col-xs-offset-4">
                <form class="form-group" method="post">
                    <img src="user_profile_img/<?php echo $feed['img_name']; ?>" width="60">
                    <?php echo $feed['name']; ?><br>
                    <?php echo $feed['created']; ?><br>
                    <textarea name="feed" class="form-control"><?php echo $feed['feed']; ?></textarea>
                    <input type="submit" value="更新" class="btn btn-warning btn-xs">
                </form>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery-3.1.1.js"></script>
    <script src="assets/js/jquery-migrate-1.4.1.js"></script>
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
