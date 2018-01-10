# coding: utf-8
#

print("Hello, ruby.\n")       # printメソッドで出力
print('Hello, ruby.\n')       # ''は変数や特殊文字などの展開をしない。
print("\n")
print "Hello!", "Ruby!\n"     # ()省略可能, ","で複数の文字列出力

puts("HELLO, RUBY.")          # printと比べて自動改行

print("あいうえお\n")

# "p" オブジェクトの内容表示に使用する\n"
p "abc" # "abc"
p 100   # 100
p "100" # "100"
p "アイウエオ" # "アイウエオ"
# 文字化けする場合、実行時に "ruby -E UTF-8 01_sample.rb"

print(100, "\n")                # Fixnum(整数) Object
print(3.14, "\n")               # Float(倍精度浮動小数点数) Object

# 普通に四則演算を使える
# +,-,*,/,%(剰余)
puts(1+1)
puts(3-4)
puts(5*6)
puts(7/8)     # これは整数で割り算されているのか "0"
puts(7.0/8.0) # これは不動小数点で計算。"0.875"
puts(9%2)     # 余りの１が返る

# 数学関数(Math)
puts(Math.sin(90))
puts(Math.cos(45))
puts(Math.sqrt(100))

# 変数割り当て
var01 = "abcdefg"
print("var01=", var01, "\n")
print("var01=#{var01}\n")       # ""中に変数を展開したい場合、#{}
var02 = 1234
print("var02=", var02, "\n")
var03 = "ABC\nEFG"
print("var03=", var03, "\n")

# 定数: 定数を使いたい場合、大文字始まりで宣言する
#  (本にはまだ書いてないけんなので、いずれまた)
Const01 = "abc"
print("Const01=", Const01, "\n")

# Comment sample

=begin

Comment sample

=end

