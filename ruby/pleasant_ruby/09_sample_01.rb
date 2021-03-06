# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.1 代入演算子")

# a = a + 1 <=> a += 1
# b = b * 2 <=> b *= 2

# 代入演算子一覧
# &&=
# ||=
# ^=
# &=
# |=
# <<= : shift
# >>= : shift
# +=
# -=
# *=
# /=
# %=
# **=

# 変数以外、メソッドを経由してオブジェクトの操作にも使うことができる
#
# $stdin.lineno += 1
# $stdin.lineno  = $stdin.lineno + 1
#
# 対象オブジェクトのメソッドが値の参照と設定の2つのアクセスメソッドを
# 持っている必要がある

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.2 論理演算子の応用")

# 論理演算子の特徴
# * 左側の式から順に評価される
# * 論理式の真偽が決定すると、残りの式は無視される
# * 最後に評価された式の結果が論理式全体の値になる
#

# 以下の式は全て同一
# 
# item = nil
# if ary
#    item = ary.first
# end
#
# item = ary && ary.first
#
# item = ary&.first
#
# 最後の"&."は、「安全参照演算子」や「nilチェック付きメソッド呼び出し」
# 機能で、Ruby 2.3以降に利用可能

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.3 条件演算子")

# 三項演算子のこと
# 条件 ? 式1 : 式2
a = 1
b = 2
max = (a>b) ? a : b
p max #=>2

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.4 範囲演算子")

# 範囲を表すすオブジェクトがある。
range = Range.new(1,10)
# => 1..10

# 範囲演算子は2つある
# "x..y"  : xからyまでの範囲
# "x...y" : xからy-1までの範囲
p (0..2).to_a  #=> [0,1,2]
p (0...2).to_a #=> [0,1]

# 範囲演算子は、文字列にも使用可能
p ("a" .. "c").to_a  #=> ["a","b","c"]
p ("a" ... "c").to_a #=> ["a","b"]

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.5 演算子の優先順位")

# 演算子の高いもの順
# ::
# []
# +(単項演算子) ! ~
# **
# -(単項演算子)
# * / %
# + -
# << >>
# &
# | ^
# > >= < <=
# <=> == === != =~ !~
# &&
# ||
# ?:(三項演算子)
# .. ...
# = (+=, -=, *=, /=などを含め)
# not
# and or

puts("# --------------------------------------------------------------------------")
puts("# Chapter09.6 演算子を定義する")

# Rubyは演算子の多くをインスタンスメソッドとして実装されている。
# そのため、ユーザーが新たに定義を再定義したり、意味を変えることができる。
# ただし、例外として以下の演算子の意味を変えることはできない。
# ::, &&, ||, .., ..., ?:, not, =, and, or

class Point
  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x, @y = x, y
  end
  def inspect
    "(#{x},#{y})"
  end
  def +(b)
    self.class.new(x+b.x, y+b.y)
  end
  def -(b)
    self.class.new(x-b.x, y-b.y)
  end

  # 定義可能な単項演算子は、"+,-,~,!"の4つ
  def +@
    dup # 自分の複製を返す
  end
  def -@
    self.class.new(-x,-y) # x,yの正負を逆にする
  end
  def ~@
    self.class.new(-y,x) # 90度反転させた座標を返す
  end

  # 添字メソッド : 配列やハッシュで用いられるobj[i], obj[i]=xのこと。
  # これらはそれぞれ、[],[]=という名前で定義できる。
  def [](index)
    case index
    when 0
      x
    when 1
      y
    else
      raise ArgumentError, "out of range `#{index}`"
    end
  end
  def []=(index, val)
    case index
    when 0
      self.x = val
    when 1
      self.y = val
    else
      raise ArgumentError, "out of range `#{index}`"
    end
  end
end

p0 = Point.new(0,1)
p1 = Point.new(3,4)
p p0  #=> (0,1)
p p1  #=> (3,4)
p p0 + p1 #=> (3,5)
p p0 - p1 #=> (-3,-3)

p +p0 #=> (0,1)
p -p0 #=> (0,-1)
p ~p0 #=> (-1,0)

p p0[0] #=> 0
p p0[1] #=> 1
p p0[0] = 3 #=> 3
p p0 #=> (3,1)
