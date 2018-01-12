# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter07.1 メソッドの呼び出し")

# Objectの呼び出し構文
#  object.method(arg1,arg2,...,argn)

# ブロック付きメソッドの呼び出し構文
#
#   object.method(arg1,...) do |var1, var2, ...|
#     ブロックの内容
#   end
#
# do ~ endの部分がブロック。eachやloopメソッドのように、ブロックを伴っ
# て呼ばれるメソッド。「ブロック付きメソッド呼び出し」と呼ぶ
# ブロックなので、{ ~ } も使うことができる。

# 演算子の形をしているメソッドもある。
#
# obj + arg
# obj =~ arg
# -obj
# obj[arg1]

puts("# --------------------------------------------------------------------------")
puts("# Chapter07.2 メソッドの分類")

=begin

rubyのメソッドは、レシーバにより３種類に分けることができる。

* インスタンスのメソッド
* クラスのメソッド
* 関数的なメソッド

=end

puts("インスタンスのメソッド例")

p "10,20,30".split(",") #=> [10,20,30]
p [3,2,1].index(2)      #=> 1
p 10.to_s               #=> "10"
p Time.now.to_s         #=> "YYYY-MM-DD HH:MI:SS +0900"

puts("クラスメソッドの例")
p Array.new  #=> 新しい配列を作る "[]"
p Time.now   #=> 新しいタイムオブジェクトを作る
# インスタンスではなくクラスで利用できるメソッド。newとか典型的。

# 次のように絵残滓の形をしているクラスメソッドもある（どうやって定義しているのだろう？)
p Array[1,2,3] #=> [1,2,3]

# "." の代わりに "::" も使うことができる
p Array::new #=> 上と同様の効果。[]

puts("関数的メソッド")
# レシーバがないメソッドを、関数的メソッドと呼ぶ。
# printやputsなどがこれに当たる。

puts("# --------------------------------------------------------------------------")
puts("# Chapter07.3 メソッドの定義")

# def メソッド名(引数1,2,3..)
#   処理内容
# end

# メソッド名は、アルファベット、数値、アンダースコアを使用することがで
# きる。ただし、数値始まりにすることはできない。

# "引数=デフォルト値"と書くことができる
def hello(target="ruby")
  puts("hello, #{target}")
end
hello()        #=> "hello, ruby
hello("perl")  #=> "hello, perl"

# メソッドの戻り値として "return" を使用できる
# returnを省略した場合、最後に実行された文の評価値を返す

def hello2(target="ruby")
  return "hello, #{target}"
end
puts hello2()
puts hello2("perl")

# ブロック付きメソッドの定義

def myloop
  while true
    yield
  end
end

i = 0
myloop do
  break if i>=4
  i += 1
  p i
end

# イマイチまだ納得のいく感じじゃないから。11章まち。

# メソッドの引数が不定な場合の書き方

def sum(*arg)
  sum = 0
  arg.each { |i| sum += i }
  sum
end

print "sum 1to4 is ", sum(1,2,3,4), "\n"

# キーワードを用いた引数。
#
# 引数にハッシュを用いた方法。指定順番が固定されない、場合によっては読
# みやすくなる。デフォルト値が指定できるなどのメリット。

def area(x:0, y:0, z:0)
  x*y*z
end

puts area(x:1,y:1,z:2) #=> 2
puts area(x:1,z:2,y:3) #=> 6
puts area()            #=> 0

# 引数の定義に存在しないキーワードを使いたい場合、"**変数名"を使用する

def method(a:0,b:0,**arg)
  return [a,b,arg]
end

p method(a:1,b:2,c:3,d:4) #=> [1, 2, {:c=>3, :d=>4}]

def method2(a, b:0,c:0)
  return a+b+c
end
p method2(1) #=> 1
p method2(1, b:3,c:4) #=>8

# メソッドを呼び出すとき引数にハッシュを渡すこともできる。

hash= {x:1,y:2,z:3}
p area(hash)

# 配列を引数に展開する
# 「*配列」を引数に渡すことで、配列を引数として展開できる。
# その際、もちろんメソッドの引数の数とあっていなければならない。

def sumABC(a=0,b=0,c=0)
  a+b+c
end
ary=[1,2]
p sumABC(0,*ary) #=> 3
ary=[1,2,3]
p sumABC(*ary)   #=> 6


# ";"を構文区切りとして使用できる。以下の構文はOK
puts "A"; puts "B"

