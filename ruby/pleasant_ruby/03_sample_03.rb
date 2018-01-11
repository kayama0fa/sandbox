# coding: utf-8
#
# Chapter 03.02

puts("# --------------------------------------------------------------------------")
puts("# Chapter03.2 ファイルからの読み込み")

regexp = Regexp.new(ARGV[0])
filename = ARGV[1]

# マッチしたものを出力する。ついでにマッチした行数も表示する。
fh = File.open(filename)
fh.each_line do |line|
  if regexp =~ line then
    print("<#{fh.lineno}> #{line}")
  end
end
fh.close
