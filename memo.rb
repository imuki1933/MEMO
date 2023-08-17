require "csv" 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_s 

puts "選択：" + memo_type 
input_number = memo_type.chomp
  
if input_number == "1"
puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
file_name = gets.chomp
  
puts"メモの内容を入力して下さい。Ctrl+Dで保存します。"
imput_memo = STDIN.read
memo = imput_memo.chomp
CSV.open("#{file_name}.csv" , "w") do |csv|
csv.puts ["#{memo}"]

end

elsif input_number == "2"
puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
file_name = gets.chomp

file_data = CSV.read("#{file_name}.csv")

puts "既存のメモに追加したい内容を入力して下さい。Ctrl+Dで保存します。"
imput_memo = STDIN.read
memo = imput_memo.chomp

CSV.open("#{file_name}.csv" , "a") do |csv|
csv.puts ["#{memo}"]

end

else
puts "1か2の数字を入力してください。"
end