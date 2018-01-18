# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter10 エラー処理と例外")

puts("# Chapter10.1 エラー処理について")
puts("# Chapter10.2 例外処理")
puts("# Chapter10.3 例外処理の書き方")

# # 例外処理の基本構文
# begin
#   # 例外を発生される可能性のある処理
# rescue => # 例外オブジェクトが代入される変数
#   # 例外が起こった場合の処理
# end

# 例外発生時に自動セットされる特殊変数
# $! : 最後に発生した例外（のオブジェクト）
# $@ : 最後に発生した例外の位置に関する情報

# $!.class     : 例外の種類
# $!.message   : 例外のメッセージ
# $!.backtrace : 例外の発生した位置に関する情報

puts("# Chapter10.4 後処理方")

# 例外の有無にかかわらず、常に実行したい処理は"ensure"節に記述する。

# begin
#   # 例外の発生する可能性のある処理
# rescue => # 変数
#   # 例外が起こった場合の処理
# ensure
#   # 例外の有無にかかわらず実行される処理
# end

def copy(from, to)
  src = File.open(from)
  begin
    dst = File.open(to, "w")
    data = src.read
    dst.write(data)
    dst.close
  rescue => ex
    puts ex.message
  ensure
    src.close
  end
end

puts("# Chapter10.5 やり直し")

# rescure節でretryを用いいると、begin以下の処理をもう一度やり直す

def reopen(file)
  retryMax = 5
  count = 0
  begin
    io = File.open(file)
    data = io.read
    puts data
    io.close
  rescue
    count += 1
    # ひらけなかったら5回リトライ
    if count<= retryMax then
      sleep 10 # 10 sec sleep
      retry
    end
  end
end

puts("# Chapter10.6 rescure修飾子")

# 式1 rescure 式2
# 式1の処理中に例外が発生した場合、式2の値が全体の値になる

n = Integer(input) rescue 0
# inputを整数型に変換できたらその値を、ダメだったら0を渡す

puts("# Chapter10.7 例外処理の構文の補足")

# メソッド全体を例外処理でくくるような場合次のように書ける

# def method
#   # 処理
# rescue => ex
#   # 例外処理
# ensure
#   # 後処理
# end

puts("# Chapter10.8 補足する例外を指定する")

# 補足する例外別に対処する場合

# begin
#   # 処理内容
# rescue Exception1 => 変数
#   # Exception1に対する処理
# rescue Exception2, Exception3 => 変数
#   # Exception2,3に対する処理
# rescue => 変数
#   # それ以外の例外が起こった場合の処理
# end

# 指定はクラス指定をする方法

# fileを開いてみて、ダメならfileBackupを開く
def openFile(file, fileBackup)
  if io.nil then
    io = File.open(file)
  end
  data = io.read
  return data
rescue Errno::ENOENT, Errno::EACCES
  io = File.open(fileBackup)
  retry
ensure
  io.close
end

puts("# Chapter10.9 例外クラス")

# * rescure節で指定した例外クラスを補足するほか、そのサブクラスも補足
# の対象になる
# * 自分で例外クラスを定義する場合、StandardErrorクラスを継承したクラ
# スを作成するのが一般的

puts("# Chapter10.10 例外を発生させる")

# 自分で例外を起こす場合、raiseメソッドを使う
#
# raise "Message" : RuntimeErrorを発生させる例外オブジェクトに指定のメッ
# セージをセットする。
#
# raise 例外クラス : 指定したクラスの例外を発生させる
#
# raise 例外クラス, "Message" : 指定の例外クラスに加えて、指定のメッセー
# ジをセットする。
#
# raise : rescure節の外ではRuntimeErrorを発生させ、rescure節の中では最
# 後に発生した例外をもう一度発生させる。（？？）
