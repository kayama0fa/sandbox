# coding: utf-8
#
# Chapter 03.03

puts("# --------------------------------------------------------------------------")
puts("# Chapter03.3 メソッドの作成")

# 引数なし、リターンなしのメソッド
def hello
  puts("hello from method.")
end

# リターンありのメソッド
def return_hello
  return "return hello."
end

# 引数ありリターンありのメソッド
def addAB(a,b)
  return a+b
end

hello()
puts(return_hello())
puts(addAB(1,2))

puts("# --------------------------------------------------------------------------")
puts("# Chapter03.4 別のファイルを読み込む")
# 別のRubyファイルを読み込む

#require_relative "./03_sample_04_1.rb" # これでもOK
require_relative "03_sample_04_1"
print("03_sample_04_1.method_01() = ", method_01(4,1), "\n")

require "date"
today = Date.today
puts(today) # YYYY-MM-DD
p(today)    # <Date: YYYY-MM-DD ((以下略>
require "pp"
pp(today)   # p()の場合と変わらず。Pretty-Printモジュールとのこと
