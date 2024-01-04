class WeatherInfo
  def initialize(prefectures)
    @prefectures = prefectures
  end

  def select_prefecture
    puts <<~TEXT
            ☀~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~☀
            ☁                              ☁
            ☂        明日の天気予報        ☂
            ☆                              ☆
            ☀~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~☀

          TEXT

    # 都道府県一覧をインデックス番号付きで一覧出力
    @prefectures.each.with_index(1) do |prefecture, i|
      puts "#{i.to_s.rjust(2)}. #{prefecture["prefecture"]}"
    end
    puts <<~TEXT

            明日の天気情報を３時間毎に表示します。
            都道府県の番号を入力してください。
          TEXT
    while true
      input = gets.to_i
      # 正しいリスト番号が入力されればメソッドを抜ける
      if input.between?(1, @prefectures.count)
        return @prefectures[input - 1]
      else
        # リスト番号以外が入力されればエラー表示し再ループ
        puts <<~TEXT
                --------------------------------------------
                error ： 表示の番号のみを入力してください。
                --------------------------------------------
              TEXT
      end
    end
  end

  def get_weather_forecast(prefecture)
    # 外部API「OpenWeatherMap」から天気情報を取得
    response = open("http://api.openweathermap.org/data/2.5/forecast" + "?q=#{prefecture["english"]}&appid=#{WEATHER_API_KEY}&units=metric&lang=ja")
    # 取得したデータをJSONとして解析
    data = JSON.parse(response.read)
    # JSONデータ内の一部の情報のみ取得しハッシュ化
    datas = { list: data["list"], prefecture_name: data["city"]["name"] }
  end

  def display_weather_forecast(weathers)
    # 曜日を日本語表示できるようにしておく
    wd = ["日", "月", "火", "水", "木", "金", "土"]
    # 翌日
    tomorrow = Date.today + 1
    puts <<~TEXT


           ☀~~☆~~☁~~☂~~☀~~☆~~☁~~☂~~☀~~☆~~☁~~☂

              #{weathers[:prefecture_name]}の#{tomorrow.strftime("%m/%d(#{wd[tomorrow.wday]})")}の天気予報   

           ☀~~☆~~☁~~☂~~☀~~☆~~☁~~☂~~☀~~☆~~☁~~☂

         TEXT
    weathers[:list].each do |weather|
      # DateTime型に変換
      date_and_time = DateTime.parse(weather["dt_txt"])
      # 比較用にDate型も用意
      date = Date.parse(weather["dt_txt"])
      # 翌日の情報だけに限定して一覧表示
      if date == tomorrow
        puts <<~TEXT
               ---------------------------
               #{date_and_time.strftime("%p%H時頃")}
               天気：#{weather["weather"][0]["description"]}
               気温：#{weather["main"]["temp"]}℃
               ---------------------------
             TEXT
      end
    end
  end
end
