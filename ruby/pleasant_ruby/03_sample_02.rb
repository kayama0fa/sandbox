# coding: utf-8
#
# Chapter 03.02

puts("# --------------------------------------------------------------------------")
puts("# Chapter03.2 ファイルからの読み込み")

filename = ARGV[0]
fh = File.open(filename)        # create file handle object.
# text = fh.read                  # get all file data and stdout
# print(text)

# # ファイル名を指定して読み込む場合
# text = File.read(filename)

# (Q.一行ずつ読み込むのは、fh.readlineだがループはどうやるか？)
# 以下の方法は、エラーが起きる。
# 03_sample_02.rb:26:in `readline': end of file reached (EOFError)
#   from 03_sample_02.rb:26:in `<main>'
# while line = fh.readline do
#   print(line)
# end

# # 正解はeach_line
# fh.each_line do |line|
#   print(line)
# end

fh.close                        # close file handle(?)

