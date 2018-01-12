# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter04.1 オブジェクト")
puts("# Chapter04.2 クラス")
puts("# Chapter04.3 変数")

# ローカル変数 : 先頭がアルファベットの小文字か"_"始まり
# グローバル変数 : "$"始まり(あまり使うべきではないなー)
# インスタンス変数 : "@"始まり
# クラス変数 : "@@"始まり
# 擬似変数 : nil, true, false, self

puts("# Chapter04.4 定数")

# 定数 : const, 先頭が大文字始まり
#        RUBY_VERSION, RUBY_PLATFORMのようなあらかじめ定義された定数もある
p(RUBY_VERSION)
p(RUBY_PLATFORM)

# 普通の定数と意味が違うのかも。以下のコードはエラーにならず動いてしまう。
CONST_X = 1
CONST_X.freeze
puts(CONST_X)
CONST_X = 2                     # 期待に反してエラーも起きずに書き換えられる(警告は出る)
puts(CONST_X)

puts("# Chapter04.5 予約語")

# rubyで予約済みの名前

puts("# Chapter04.6 多重代入")

a,b,c = 1, 2, 3
# a=1, b=2, c=3
a,b,*c = 1, 2, 3, 4
# a=1, b=2, c=[3,4]
a,*b,c = 1, 2, 3, 4
# a=1, b=[2,3], c=4

# 入れ替えに便利
a,b=1,2
b,a=a,b
# b=1, a=2

# 関数型言語でよくあるhead & tailな使い方
head,*tail = [1,2,3,4]
p("head=#{head}") # 1
p("tail=#{tail}") # 2

