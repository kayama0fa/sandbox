# coding: utf-8
#
# Chapter 03.

puts("# --------------------------------------------------------------------------")
puts("# Chapter03.1 コマンドラインからのデータ入力")

# $ ruby 03_sample.rb 1 2 3
# -> ["1", "2", "3"]
p(ARGV)

# 入力の数値（文字列型）を整数型に変換
nums = []
ARGV.each do |arg|
  nums.push(arg.to_i)
  # to_i : cast int
  # to_f : cast float(double?)
end
p(nums)
