# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter11 ブロック")

puts("# Chapter11.1 ブロックとは")

# ブロックとは、メソッド呼び出しの際に、引数と一緒に渡すことができる処
# 理のかたまり。例えば、each, timeメソッド
#
# ブロックを受け取ったメソッドは、必要な回数だけブロックを実行する。

(1..5).each do |i|
  puts i ** 2
end
# この例の場合、do~endがブロック

# ブロック付き呼び出しの一般系は次の通り。
#
# オブジェクト.メソッド(引数) do |ブロック変数|
#   繰り返したい処理
# end
# または
# オブジェクト.メソッド(引数) { |ブロック変数|
#   繰り返したい処理
# }

ary = ["a","b","c"]

ary.each { |var|
  puts var
}
# a
# b
# c

ary.each_with_index do |var, i|
  print "ary[#{i}]=#{var}\n"
end
# ary[0]=a
# ary[1]=b
# ary[2]=c

puts("# Chapter11.2 ブロックの使われ方")

# * 繰り返しで使用される
sum = 0
outcome = {"参加費": 1000, "ストラップ代": 800, "懇親会費": 4500}
# outcome.each do |pair|
#   sum += pair[1]
# end
outcome.each do |key,val|
  sum += val
end
puts "合計:#{sum}"

# * 定型の処理を隠す（？）

def openAndPrint(file)
  File.open(file) do |hndl|  # これもブロック
    hndl.each_line do |line|
      print line
    end
  end # ファイルのクローズが不要
end

# 次の処理と等価
def openAndPrint2(file)
  hndl = File.open(file)
  file.each_line do |line|
    print line
  end
ensure
  file.close
end

# * 計算の一部を差し替える


