# frozen_string_literal: true

# ApplicationHelper provides utility methods for views.
module ApplicationHelper
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

  private

  def default_meta_tags
    { site: 'TodayFashion',
      title: '天気予報や体質による服装決めとファッションアイテム管理サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'TodayFashionを使えば、クローゼットを可視化し、当日服のコーディネートを天気や体質に合わせて決めてくれます。',
      keywords: '服,天気',
      canonical: request.original_url,
      separator: '|',
      og: og_meta_tags,
      twitter: twitter_meta_tags }
  end

  def og_meta_tags
    {
      site_name: :site,
      title: :title,
      description: :description,
      type: 'website',
      url: request.original_url,
      image: image_url('todayfashion-icon.png'), # 配置するパスやファイル名によって変更すること
      local: 'ja-JP'
    }
  end

  def twitter_meta_tags
    {
      card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
      site: '@todayfashion514', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
      image: image_url('todayfashion-icon.png') # 配置するパスやファイル名によって変更すること
    }
  end
end
