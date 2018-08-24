$(function() {
    $('.js-like').on('click', function() {
    	var feed_id = $(this).siblings('.feed-id').text();
        var user_id = $('#signin-user').text();
        var like_btn = $(this);
        var like_count = $(this).siblings('.like_count').text();
        console.log(feed_id+': いいねをしたfeedのid');   //feed_idを取得できているか確認
        console.log(user_id+': いいねをしたuserのid');   //user_idを取得できているか確認

        $.ajax({
            // 送信先、送信するデータなど
            url: 'like.php', // 飛ばされるファイル名
            type: 'POST', // 送信方法
            datatype: 'json', // 送信するデータの形式
            data: { // 送信する内容
                'feed_id': feed_id,
                'user_id': user_id,
            }
        })
        .done(function(data) {
            // 成功時の処理
            if (data == 'true') {
                like_count++;
                like_btn.siblings('.like_count').text(like_count);
            }
        })
        .fail(function(err) {
            // 失敗時の処理
            console.log(err);
        })
    });
});