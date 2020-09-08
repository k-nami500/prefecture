require "thor"
require "pry"
require "csv"

class Prefecture
  attr_reader :prefecture, :prefectural_office_location

  def initialize(params)
    @prefecture = params[:prefecture]
    @prefectural_office_location = params[:prefectural_office_location]
  end
end

class Import

  def self.prefecture_data
    prefectures = []
    CSV.foreach("prefecture_data.csv", headers: true) do |row|
      prefectures << Prefecture.new(prefecture: row["prefecture"], prefectural_office_location: row["prefectural_office_location"])
    end
    return prefectures
  end
end

class Main
  @@prefecture_data = Import.prefecture_data

  def show_prefecture
    puts "以下の都道府県から選択してください。"
    puts "＊＊＊＊＊＊＊＊＊＊＊＊"
    @@prefecture_data.each do |answer|
      puts "#{answer.prefecture}"
    end
    puts "＊＊＊＊＊＊＊＊＊＊＊＊"
    print "回答する都道府県　＞"
    @input_prefecture = gets.chomp
  end

  def question
    loop do
      if @@prefecture_data.find{|answer| answer.prefecture == @input_prefecture}
        print "#{@input_prefecture}の県庁所在地はどこでしょうか？　＞"
        @input_answer = gets.chomp
        break
      else
        print "入力ミスなく上記の都道府県を入力してください。　＞"
        @input_prefecture = gets.chomp
      end
    end
  end

  def answer_check
    loop do
      if @@prefecture_data.find{|answer| answer.prefectural_office_location == @input_answer}
        print "正解です！！！"
        break
      else
        print "不正解です。もう一度回答してください。　＞"
        @input_answer = gets.chomp
      end
    end
  end
end

main = Main.new
main.show_prefecture
main.question
main.answer_check