# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.9 Mix-in")

module M
  def meth
    "meth"
  end
end
class C
  include M  # ある種のスーパークラスの機能として働く
end
c = C.new
puts c.meth     #=> meth
p C.include?(M) #=> true # インスタンスを指定した場合はエラーになる

# クラスの継承順に列挙
p C.ancestors  #=> [C, M, Object, Kernel, BasicObject]
# 親クラスを返す
p C.superclass #=> Object

# * Rubyでは多重継承はできない
# * Mix-in機能を使うことで、ちょっと似たようなことができる

# * Enumerableモジュールというのがある。eachメソッドを持つクラスにイン
#   クルードすると、each_with_indexメソッドやcollectメソッドなどの、
#   「要素を順に処理する」ためのメソッドが追加される。
#
# * Enumerabeモジュールは、Array,Hash,IO Classなどでincludeされている。
#
# * 単純継承とMix-inの組み合わせは、クラスの設計、理解しやすさを満たす
#   一つの方法といえる。

# Mix-inを使ったときのメソッドの検索順
#
# 1. 継承関係と同じく、メソッド名が同名の場合、モジュールよりもinclude
# しているクラスが優先される。
#
# 2. クラスに複数のモジュールをincludeした場合、後からincludeされたモ
# ジュールが優先される
#
# 3. includeが入れ子になった場合、検索順は後からincludeされたものが基
# 本的に採用される（例は、書籍のP152参照）
#
# 4. 同じモジュールを2回以上includeしても2回目以降は無視される。

# extend method

module Edition
  def edition(n)
    "#{self} 第#{n}版"
  end
end

str = "楽しいRuby"
str.extend(Edition) #=> StringオブジェクトにEditionモジュールをMix-inする

p str.edition(1)     #=> "楽しいRuby 第1版"

# クラスとMix-in

# * Rubyのクラスは、それ自体"Class"クラスのオブジェクト。
# * クラスメソッドは、クラスをレシーバとするメソッド。
# * クラスメソッドは、クラスオブジェクトに対するインスタンスメソッド
# 該当するメソッド
# * Classクラスのインスタンスメソッド
# * クラスオブジェクトの特異メソッド

module ClassMethod
  def cmethod
    "class method"
  end
end

module InstanceMethod
  def imethod
    "instance method"
  end
end

class MyClass
  extend ClassMethod     # クラスメソッドの追加
  include InstanceMethod # インスタンスメソッドの追加
end

p MyClass.cmethod     #=> "class method"
p MyClass.new.imethod #=> "instance method" # newがある点、注意

# (注:ここら辺の用語理解、使い分けがまだ曖昧)

