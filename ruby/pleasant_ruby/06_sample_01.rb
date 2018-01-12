# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.1 繰り返しの基本")
puts("# Chapter06.2 繰り返しで気をつけること")
puts("# Chapter06.3 繰り返しの実現方法")

=begin

繰り返し処理をするメソッド、構文
* times method
* for
* while
* untile
* each method
* loop method

=end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.4 timesメソッド")

3.times do |i| # 0,1,2まで３回繰り返す
  puts "a#{i}"
end
# do~endの代わりに{~}と書くこともできる
2.times {
  puts "a"
}

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.5 for文")

sum = 0
for i in 1..5 do # doは省略可能
  sum += i
end
puts "sum 1..5 = #{sum}"

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.6 一般的なfor文")

ary=[1,2,3,4,5]
for i in ary do
  puts i
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.7 while文")

i=0
while i<5
  p i
  i += 1
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.8 until文")

# until条件を満たすまでループは続く。whileとは逆。
# ifに対するunlessみたいなもの。あまり使わないかも。
i=0
until i==3 do
  p i
  i += 1
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.9 eachメソッド")

ary=["a","b","c"]
ary.each do |x|
  p x
end
# forでも実現できるがどう使い分ける？eachの方がOOPぽい？


puts("# --------------------------------------------------------------------------")
puts("# Chapter06.10 loopメソッド")

# loopは無条件にループし続ける
i = 0
loop do
  break if i>=3
  p i
  i += 1
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.11 繰り返しの制御")

# break : 繰り返しの中断
# next  : 次の繰り返し判定に移る
# redo  : 同じ条件で繰り返しをやり直す

i=0
while i<10
  if i%2 == 1
    puts "i%2=1 (i=#{i})"
    i += 1
    next
  end
  if i%3 == 1
    puts "i%3=1 (i=#{i})"
    i += 2
    next
  end
  i += 1
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter06.12 まとめ")

# timesメソッド : 回数の指定された繰り返し
# for           : Objectから要素を取り出し続ける(eachのシンタックスシュガー)
# while         : 指定の条件の満たす間繰り返す
# until         : 指定の条件を満たさない間繰り返す
# eachメソッド  : Objectから要素を取り出し続ける
# loopメソッド  : 無条件に繰り返し続ける

# do~end, {~}の使い分け。「広く使われている」ルールとして、
# * 複数行にまたがる場合は、do~en
# * 一行に治まる場合は{~}
#   10.times {|i| p i}