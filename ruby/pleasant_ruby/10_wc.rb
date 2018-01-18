# coding: utf-8
#

lTotal = 0                      # 行数の合計
wTotal = 0                      # 単語数の合計
cTotal = 0                      # 文字数の合計

ARGV.each do |file|
  begin
    hndl = File.open(file)
    l = 0
    w = 0
    c = 0
    hndl.each_line do |line|
      l += 1
      c += line.size
      line.sub!(/^\s+/,"")      # 行頭の空白を削除
      ary = line.split(/\s+/)   # 単語区切りで分割
      w += ary.size
    end
    hndl.close                 # ファイルを閉じる
    # 結果の出力
    printf("%8d %8d %8d %s\n", l, w, c, file)

    lTotal += l
    wTotal += w
    cTotal += c
  rescue => ex
    puts ex.message
  end
end

printf("%8d %8d %8d %s\n", lTotal, wTotal, cTotal, "total")
