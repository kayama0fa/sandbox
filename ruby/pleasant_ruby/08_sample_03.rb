# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.3 クラスを拡張する")

# すでに定義されているクラスを拡張することができる

class String
  # ワード数をカウントする
  def count_word
    ary = self.split(/\s+/)
    return ary.size
  end
end

str = "Jhon is running."
p str.count_word  #=> 3

# 継承: 以下の書式で継承クラスを作ることができる
#
# class NewClass < SuperClass
#   以下、クラスの定義を書く
# end

class RingArray < Array         # Arrayクラスを継承してRingArrayを宣言
  def [](i)                     # 演算子[]を再定義
    idx = i % size              # 新しいインデックスを求める
    super(idx)                  # スーパークラス(Array)の同名メソッドを呼び出す
  end
end

puts("# 継承テスト")
wday = RingArray["A","B","C"]
puts wday[0] #=> A
puts wday[1] #=> B
puts wday[2] #=> C
puts wday[3] #=> A # 循環している（ように見える）

# * 通常のクラスは、暗黙でObjectクラスの継承になる
# * ObjectよりもっとシンプルなBasicObjectクラスがある

puts "Oboject.instance_methodsで定義されているメソッドを取得できる"
p RingArray.instance_methods
