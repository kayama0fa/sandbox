# coding: utf-8
#
# Chapter 02.

puts("# --------------------------------------------------------------------------")
puts("# Chapter02.1 配列")

# 配列
x = ["猪", "鹿", "蝶"]
puts(x[0])
puts(x[1,2])
x[0] = "いの"
p(x) # ["いの", "鹿", "蝶"]
# 当たり前だけどオブジェクトや数値など様々なものを格納可能

print("配列のサイズを求めるには、?.sizeを使う。x.size=", x.size, "\n")

puts("eachを使った配列の繰り返し")
x.each do |a|
  puts("x.each -> #{a}")
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter02.2 ハッシュ")

# 以下は、シンボルを表現する。要するにシンボルも変数に格納できる
sym = :foo
sym2 = :"foo"
p(sym)

song = {
  :title => "A",
  :artist => "B"
}
artist = :artist
print("title:", song[:title], " artist:", song[artist], "\n")
name = {first: "ka"}
name[:last] = "yama0fa"

print( name[:first], ".", name[:last], "\n")

puts("song.each")
song.each do |k,v|
  print("  #{k},#{v}\n")
end

puts("# --------------------------------------------------------------------------")
puts("# Chapter02.3 正規表現")

word = "Ruby"
if /Ruby/ =~ word then  # 注意：0でもtrue扱い。nilでfalse
  puts("much /uby/ <-> #{word}")
else
  puts("not much")
end
p(/Ruby/ =~ word)

# nil: オブジェクトが存在しないことを示す特殊な値。
