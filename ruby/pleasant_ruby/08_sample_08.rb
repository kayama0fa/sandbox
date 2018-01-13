# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.8 モジュールを作る")

# モジュールは以下の構文で作成できる
#
# module モジュール名
#   モジュールの定義
# end

module MHello
  VERSION ="0.0"
  def say_hello(name)
    puts "Hello, #{name}"
  end
  def say_goodbye(name)
    puts "Goodbye, #{name}"
  end
  # 外部にメソッドを公開するために必要
  module_function :say_hello, :say_goodbye

end

p MHello::VERSION  #=> "0.0"
MHello.say_hello("ruby") #=> "Hello, ruby"
MHello.say_goodbye("ruby")

include MHello
p VERSION           #=> "0.0"
say_hello("ruby")   #=> "Hello, ruby"
say_goodbye("perl") #=> "Goodbye, perl"

# * モジュールをクラスにMix-inすることは、インスタンスメソッドを追加す
#   ることになる。selfは、Mix-in先のクラスのインスタンスになる。モジュー
#   ル関数でselfは使わない方が良い。
