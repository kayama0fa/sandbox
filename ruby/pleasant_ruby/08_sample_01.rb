# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.1 クラスとは")

puts('# オブジェクトのクラスを知るには、".class"メソッドを使う')
ary = Array.new
str = "abc"
p ary.class  #=> Array
p str.class  #=> String

puts('あるオブジェクトがあるインスタンスなのか判断するには、".instance_of?"を使用する')
ary = Array.new
str = "abc"
p ary.instance_of?(Array)  #=> true
p ary.instance_of?(String) #=> false
p str.instance_of?(String) #=> true

puts('あるオブジェクトがあるクラスの継承したインスタンスかを調べるには、".isa_a?"を使用する')
ary = Array.new
str = "abc"
p ary.is_a?(Object) #=> true
p ary.is_a?(String) #=> false
p str.is_a?(Object) #=> true
