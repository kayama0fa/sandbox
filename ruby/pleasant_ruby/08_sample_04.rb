# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.3 aliasとundef")

# alias : すでに存在するメソッドに対して別名を割り当てたい場合
# "alias 別名 本来の名前"  メソッド名を直接書いた場合
# "alis :別名 :本来の名前" シンボルを使う場合

# 例：Array#size <-> Array#length

class C1
  def hello
    "Hello"
  end
end
class C2 < C1
  alias old_hello hello
  def hello
    "#{self.old_hello}, agin"
  end
end

c = C2.new
p c.old_hello   #=> Hello
p c.hello       #=> Hello, agin

# 定義したメソッドをなかったことにしたい場合、undefを使用する
# undef メソッド名
# undef :メソッド名
# 
# スーパークラスで定義されているものを使わせたくない場合に削除するなど。
# 使い所は微妙？

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.5 特異クラス")

# 特異クラス定義を使うと、任意のオブジェクトに、そのオブジェクトだけが
# 利用できるメソッド。特異メソッドを追加できる。

str1 = "aaa"
str2 = "bbb"

class << str1
  def say
    puts "say #{self}"
  end
end

str1.say #=> say aaa
# str2.say #=> NoMethodError

# 使い所・・・

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.6 モジュールとは")

# モジュールは、Rubyの特徴的な機能の一つ。
# モジュールは、処理の部分だけをまとめる機能。（クラスはデータと処理を持ったもの）
#
# * モジュールはインスタンスを持つことができない
# * モジュールは継承できない

puts("# Chapter08.7 モジュールの使い方")

# * モジュールをクラスに混ぜ合わせることを"Mix-in"という。
# * includeを使うことで、モジュールのメソッドや定数をクラスに取り入れることができる。

module MyModule
  # 共通して提供したいメソッド、定数
  ConstA = "abc"
end
class MyClass
  include MyModule # MyModuleの機能を取り入れる
  def const
    ConstA # MyModuleで定義したConstA値を返す
  end
end
class MyClass2
  include MyModule
  ConstA ="ABC" # MyModule::ConstAを上書き可能
  def const
    ConstA
  end
end

c = MyClass.new
p c.const   #=> "abc"
c2 = MyClass2.new
p c2.const  #=> "ABC"

# 名前空間とは、メソッドや定数やクラスの名前を区別して管理する単位。
#
# 例えばあるモジュールAのmethodXとモジュールBのmethodXは、それぞれ別の
# ものとして扱われる。定数や各種変数についても同様。
#
# includeを使うことで、モジュールで定義された定数やメソッドをそのクラ
# スの名前空間に取り込むことができる。例えば以下のような書き方が可能

class  MathPlus
  include Math
  def self.pi
    PI
  end
  def self.s(a)
    Math.sqrt(a) # なんか"sqrt(a)"だけでは、うまく動かない・・・
  end
end
p MathPlus.pi
p MathPlus.s(2)
