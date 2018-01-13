# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.2 クラスを作る")

class HelloWorld
  # クラス変数。クラス固有の変数（固定化する方法ないのかな・・・）
  @@default_name = "Ruby"
  # Class.newした時の初期化処理を記述する
  def initialize(myname = @@default_name)
    @name = myname # インスタンス変数に初期設定
    # - インスタンス変数は、インスタンスごとに内部で保持している変数
    # - インスタンス変数は、外部から直接参照することはできない
  end
  # Classのメソッド say_hello
  def say_hello
    puts "Hello, #{@name}"
  end
  def change_name(myname = @@default_name)
    @name = myname
  end
  def change_default_name(myname)
    @@default_name = myname
  end
  # nameメソッドで、現在の@nameを返す
  def name
    puts @name
  end
  # obj.name = "xxx" で、@nameを変更する
  def name=(myname)
    @name = myname
  end
end

hw = HelloWorld.new()
hw.say_hello #=> "Hello, Ruby"
hw = HelloWorld.new("php")
hw.say_hello #=> "Hello, php"
hw.change_name("Python")
hw.say_hello #=> "Hello, Python"

hw.name       #=> "Python"
hw.name="elisp"
hw.say_hello  #=> "Hello, elisp"

# 上記のように、いちいちアクセサーを用意しなくても良い方法がある。
# 「アクセスメソッド」
# 
# attr_reader :name   | 参照のみを可能にする
# attr_writer :name   | 変更のみを可能にする
# attr_accessor :name | 参照、変更を可能にする(attr_reader, attr_writer両方を定義した場合と同じ)

class NewHelloWorld
  @@default_name = "Ruby"
  # アクセサー@nameの定義
  attr_accessor :name
  def initialize(name = @@default_name)
    @name = name
  end
  def say_hello
    puts "Hello, #{@name}"
  end
  # @name = self.name
  def greet
    puts "Hi, I'm #{self.name}."
  end
end

hw = NewHelloWorld.new
hw.say_hello                    #=> "Hello, Ruby"
puts "hw.name is #{hw.name}"
hw.name = "perl"
hw.say_hello                    #=> "Hello, perl"
hw.greet                        #=> "Hi, I'm perl."

# クラスメソッド : クラスそのものをレシーバとするメソッド
#
# クラスメソッドは、"class << ClassName ~ end"という特殊なクラス定義の
# 中にインスタンスメソッドを定義する。

class << HelloWorld
  def hello(name)
    puts "#{name} said hello"
  end
end

HelloWorld.hello "Jhon"

class HelloWorld2
  # クラスメソッドは、次のように「class << self ~ end」で書くこともできる
  # このようなクラス定義を「特異定義クラス」と呼ぶ
  class << self
    def hello(name = DefaultName)
      puts "#{name} said hello-2."
    end
  end
  # "def self.(method名) ~ end" という書き方もできる。
  def self.goobye(name)
    puts "#{name} said goobye."
  end

  # Classで定数を定義する場合は以下の通り
  DefaultName = "Ruby"
  # 外部アクセスする場合、"HelloWorld2::DefaultName" と書く

  # クラス変数は"@@variable"で定義する。厄介そうな副作用が出やすいから、
  # 使わない方が無難ぽい気がする。

end

# # どう使えばいいものかだけど、それ以外「def クラス名.メソッド名 ~ end」
# # 形式で定義することもできる
#
# def HelloWorld2.goobye(name)
#   puts "#{name} said goobye."
# end

HelloWorld2.hello("Bob")        #=> Bob said hello-2.
HelloWorld2.goobye("Alice")     #=> Alice said goobye.
HelloWorld2.hello               #=> Ruby said hell-2.
p HelloWorld2::DefaultName      #=> "Ruby"

# メソッドの呼び出しの制限
#
# public    : インスタンスメソッドとして使えるように公開。
# private   : レシーバーを指定して呼び出しできないようにする。要するに非公開。
# protected : 同一のクラス内であればインスタンスメソッドとして使用できる。

class AccessTest
  public
  def pub
    puts "this method is public."
  end
  private
  def priv
    puts "this method is private."
  end
end

a = AccessTest.new
a.pub                           #=> "this method is public."
# a.priv                          #=> error

class Point
  attr_accessor :x, :y          # Accessor x,y
  protected     :x=, :y=        # x=,y=をprotected宣言

  def initialize(x=0.0, y=0.0)
    @x, @y = x, y
  end
  def swap(other)
    x1, y1 = @x, @y
    @x, @y = other.x, other.y
    other.x, other.y = x1, y1
    self
  end
  def show
    puts("x,y=#{@x},#{@y}")
  end
end

p1 = Point.new(1,2)
p2 = Point.new(3,4)
p1.show     #=> x,y=1,2
p2.show     #=> x.y=3,4
p1.swap(p2)
puts "swap"
p1.show     #=> x,y=3,4
p2.show     #=> x,y=1,2

# p1.x=10 #=> NoMethodErrorになる

