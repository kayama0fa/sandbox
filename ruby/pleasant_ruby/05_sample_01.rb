# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter05.1 条件判断とは")
puts("# Chapter05.2 Rubyでの条件")

# 文字列クラスのemptyメソッド。１以上の長さの文字列があればtrue、でな
# ければfalseを返す。最後の?はsyntax sugar?
p "".empty? #=> true
p "A".empty? #=> false

puts("# Chapter05.3 論理演算子")

p 1 && 0 #=> 0
p 1 || 1 #=> 1
p !1     #=> false
p !nil   #=> true

# 上記より優先度の低い and, or, not がある

puts("# Chapter05.4 if文")

# # if文の基本
# if X then
#   # 文
# elsif Y # thenは省略可能
#   # 文
# else
#   # 文
# end

puts("# Chapter05.5 unless文")

# # ifの逆
# unless X
#   # 文
# end

puts("# Chapter05.6 case文")

obj = {
  a: 10,
  b: 11,
  c: 12
}
obj.each do |k,v|
  case v%3
  when 0
    print("x%3=0, key:#{k}=#{v}\n")
  when 1, 2
    print("x%3=1 or 2, key:#{k}=#{v}\n")
  # when 2
  #   print("x%3=2, key:#{k}=#{v}\n")
  else
    print("no much")
  end
end
# whenには、マッチするものを列挙することができる。正規表現でマッチさせ
# ることもできる。（別のメソッドを呼んでマッチさせるような書き方はでき
# ないのかな）

puts("===の扱い。ゆるい感じ（どの程度？）でマッチさせる演算子")
p(/abc/ === "abcdefg") #=> true
p(String === "AAA")    #=> true
p((1..4) === 3)        #=> true

# (x..y)はxからyまでの数値の連続（配列オブジェクトと言うべきか）
(1..4).each do |x|
  puts(x)
end

puts("# Chapter05.7 if修飾子とunless修飾子")

# 次のように、実行する式の後ろに書くことができる
puts "ok" if 1>0

puts("# Chapter05.8 まとめ")

# 全てのObjectは「アイデンティティ(ID)」と「値」を持っている。
#
# 「アイデンティティ(ID)」とは、オブジェウトに割り当てられたユニークな
# .object_idで得ることができる

a = []
b = []
p a.object_id  #=> 70222862104880 (実行するたびに別の値が入る)
p b.object_id  #=> 70222862104860 (実行するたびに別の値が入る)

# .equal? メソッドで同一のオブジェクトかどうか判別できる
a2=a
p a.equal?(b)  #=> false
p a.equal?(a2) #=> true

# 値が同一か、"=="で判定できるが、他に".eql?"メソッドがある
a = 1
b = 1
c = 1.0
p a.eql?(b) #=> true
p a.eql?(c) #=> false
