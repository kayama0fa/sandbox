# coding: utf-8
#

puts("# --------------------------------------------------------------------------")
puts("# Chapter08.10 オブジェクト指向プログラミング")


def fetch_and_downcase(ary, index)
  if str = ary[index]
    return str.downcase
  end
end

ary = ["BOO","FOO","WOO"]
p fetch_and_downcase(ary, 1)  #=> foo
p fetch_and_downcase(ary, 0)  #=> boo

hash = {0 => "BOO", 1=>"FOO", 2=>"WOO"}
p fetch_and_downcase(hash, 1) #=> foo
p fetch_and_downcase(hash, 0) #=> boo

# なぜハッシュでも同じように動くか？
# * ary[index]という形式で要素が取り出せる
# * 取り出した要素がdowncaseメソッドを持っていること

