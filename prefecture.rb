require "thor"
require "pry"

class Answer
  attr_reader :prefecture, :prefectural_office_location

  def initialize(params)
    @prefecture = params[:prefecture]
    @prefectural_office_location = params[:prefectural_office_location]
  end
end


def prefecture_data
  answers_params = [
    { prefecture: "北海道", prefectural_office_location: "札幌市"},
    { prefecture: "青森県", prefectural_office_location: "青森市"},
    { prefecture: "岩手県", prefectural_office_location: "盛岡市"},
    { prefecture: "宮城県", prefectural_office_location: "仙台市"},
    { prefecture: "秋田県", prefectural_office_location: "秋田市"},
    { prefecture: "山形県", prefectural_office_location: "山形市"},
    { prefecture: "福島県", prefectural_office_location: "福島市"},
    { prefecture: "茨城県", prefectural_office_location: "水戸市"},
    { prefecture: "栃木県", prefectural_office_location: "宇都宮市"},
    { prefecture: "群馬県", prefectural_office_location: "前橋市"},
    { prefecture: "埼玉県", prefectural_office_location: "さいたま市"},
    { prefecture: "千葉県", prefectural_office_location: "千葉市"},
    { prefecture: "東京都", prefectural_office_location: "新宿区"},
    { prefecture: "神奈川県", prefectural_office_location: "横浜市"},
    { prefecture: "新潟県", prefectural_office_location: "新潟市"},
    { prefecture: "富山県", prefectural_office_location: "富山市"},
    { prefecture: "石川県", prefectural_office_location: "石川市"},
    { prefecture: "福井県", prefectural_office_location: "福井市"},
    { prefecture: "山梨県", prefectural_office_location: "山梨市"},
    { prefecture: "長野県", prefectural_office_location: "長野市"},
    { prefecture: "岐阜県", prefectural_office_location: "岐阜市"},
    { prefecture: "静岡県", prefectural_office_location: "静岡市"},
    { prefecture: "愛知県", prefectural_office_location: "名古屋市"},
    { prefecture: "三重県", prefectural_office_location: "津市"},
    { prefecture: "滋賀県", prefectural_office_location: "大津市"},
    { prefecture: "京都府", prefectural_office_location: "京都市"},
    { prefecture: "大阪府", prefectural_office_location: "大阪市"},
    { prefecture: "兵庫県", prefectural_office_location: "神戸市"},
    { prefecture: "奈良県", prefectural_office_location: "奈良市"},
    { prefecture: "和歌山県", prefectural_office_location: "和歌山市"},
    { prefecture: "鳥取県", prefectural_office_location: "鳥取市"},
    { prefecture: "島根県", prefectural_office_location: "島根市"},
    { prefecture: "岡山県", prefectural_office_location: "岡山市"},
    { prefecture: "広島県", prefectural_office_location: "広島市"},
    { prefecture: "山口県", prefectural_office_location: "山口市"},
    { prefecture: "徳島県", prefectural_office_location: "徳島市"},
    { prefecture: "香川県", prefectural_office_location: "香川市"},
    { prefecture: "愛媛県", prefectural_office_location: "松山市"},
    { prefecture: "高知県", prefectural_office_location: "高知市"},
    { prefecture: "福岡県", prefectural_office_location: "福岡市"},
    { prefecture: "佐賀県", prefectural_office_location: "佐賀市"},
    { prefecture: "長崎県", prefectural_office_location: "長崎市"},
    { prefecture: "熊本県", prefectural_office_location: "熊本市"},
    { prefecture: "大分県", prefectural_office_location: "大分市"},
    { prefecture: "宮崎県", prefectural_office_location: "宮崎市"},
    { prefecture: "鹿児島県", prefectural_office_location: "鹿児島市"},
    { prefecture: "沖縄県", prefectural_office_location: "那覇市"}
  ]

  answers = []
  answers_params.each do |params|
    answers << Answer.new( 
      prefecture: params[:prefecture],
      prefectural_office_location: params[:prefectural_office_location]
    )
  end
  return answers
end


def show_prefecture
  @input_prefecture = nil
  @input_answer = nil
  
  puts "以下の都道府県から選択してください。"
  puts "＊＊＊＊＊＊＊＊＊＊＊＊"
  prefecture_data.each do |answer|
    puts "#{answer.prefecture}"
  end
  puts "＊＊＊＊＊＊＊＊＊＊＊＊"
  print "回答する都道府県　＞"
  @input_prefecture = gets.chomp
end

def question
  loop do
    if prefecture_data.find{|answer| answer.prefecture == @input_prefecture}
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
    if prefecture_data.find{|answer| answer.prefectural_office_location == @input_answer}
      print "正解です！！！"
      break
    else
      print "不正解です。もう一度回答してください。　＞"
      @input_answer = gets.chomp
    end
  end
end

def main_action
  show_prefecture
  question
  answer_check
end

main_action
