#!/bin/bash

# 前のコマンドが異常終了した場合、実行を中断する。
if [ $? != 0 ]; then exit; fi

# 半角スペースを区切り文字として指定
cut -d " " -f 7

log=/var/log/messages
count=10

exho "アクセス数の多い${count}ページ"
cat $log | grep -v "[検索で除外するワード]" | cut -d " " -f 7 | sort | uniq -c |sort -r | head -n $count

exho "アクセス数の多い${count}ページ"
cat $log | grep -v "[検索で除外するワード]" | cut -d " " -f 7 | sort | uniq -c |sort -r | tail -n $count

# csvの編集
# 区切り文字｢,｣を指定して、列の番号を指定して、数値順にソートする。
sort -t "," -k 3 -n

# 前のコマンドが異常終了した場合、実行を中断する。
if [ $? = 0 ]
then
  ＜処理＞
else
  echo "処理の途中でエラーが発生しました。処理を中断します。"
fi
