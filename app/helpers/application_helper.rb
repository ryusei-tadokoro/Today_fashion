# frozen_string_literal: true

# ApplicationHelper provides utility methods for views.
module ApplicationHelper
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

  def clothing_index(constitution_id)
    clothing_index_tag = []
    clothing_index_tag << case constitution_id
                          when 1 # 暑がり
                            image_tag('clothing_index1.png')
                          when 2 # やや暑がり
                            image_tag('clothing_index2.png')
                          when 3 # 標準
                            image_tag('clothing_index3.png')
                          when 4 # やや寒がり
                            image_tag('clothing_index4.png')
                          when 5 # 寒がり
                            image_tag('clothing_index5.png')
                          else
                            '**新規登録またはログインを行い,体質設定を行なってください**'
                          end
    clothing_index_tag
  end

  private

  def get_subcategory_ids(temperature, constitution_id)
    case constitution_id
    when 1 # 暑がり
      case temperature
      when ...3 then [18, 7, 2, 10, 6]
      when 3...7 then [17, 7, 2, 10, 29]
      when 7...11 then [17, 6, 8, 11, 35]
      when 11...15 then [17, 6, 2, 29, 11]
      when 15...18 then [7, 1, 10, 29]
      when 18...22 then [20, 1, 10, 29]
      when 22... then [1, 11, 29]
      end

    when 2 # やや暑がり
      case temperature
      when ...4 then [18, 7, 2, 10, 6]
      when 4...8 then [18, 7, 2, 10, 29]
      when 8...12 then [17, 6, 8, 11, 35]
      when 12...16 then [17, 6, 2, 29, 11]
      when 16...19 then [7, 1, 10, 29]
      when 19...23 then [20, 1, 10, 29]
      when 23... then [1, 11, 29]
      end

    when 3 # 標準
      case temperature
      when ...5 then [18, 7, 2, 10, 6]
      when 5...9 then [18, 7, 2, 10, 29]
      when 9...13 then [17, 6, 8, 11, 35]
      when 13...17 then [17, 6, 2, 29, 11]
      when 17...20 then [7, 1, 10, 29]
      when 20...24 then [20, 1, 10, 29]
      when 24... then [1, 11, 29]
      end

    when 4 # やや寒がり
      case temperature
      when ...6 then [18, 7, 2, 10, 6]
      when 6...10 then [18, 7, 2, 10, 29]
      when 10...14 then [17, 6, 8, 11, 35]
      when 14...18 then [17, 6, 2, 29, 11]
      when 18...21 then [7, 1, 10, 29]
      when 21...25 then [20, 10, 29]
      when 25... then [1, 11, 29]
      end

    when 5 # 寒がり
      case temperature
      when ...7 then [18, 7, 2, 10, 6]
      when 7...11 then [18, 7, 2, 10, 29]
      when 11...15 then [17, 6, 8, 11, 35]
      when 15...19 then [17, 6, 2, 29, 11]
      when 19...22 then [7, 1, 10, 29]
      when 22...26 then [20, 1, 10, 29]
      when 26... then [1, 11, 29]
      end

    else
      []
    end
  end

  def default_meta_tags
    {
      site: 'TodayFashion',
      title: '天気予報や体質による服装決めとファッションアイテム管理サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'TodayFashionを使えば、クローゼットを可視化し、当日服のコーディネートを天気や体質に合わせて決めてくれます。',
      keywords: '服,天気',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('todayfashion-icon.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@todayfashion514', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('todayfashion-icon.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
