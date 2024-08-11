# app/helpers/closets_helper.rb

module ClosetsHelper
  def display_clothes_photo(temperature, constitution_id, user)
    subcategory_ids = get_subcategory_ids(temperature, constitution_id)
    displayed_urls = []

    subcategory_ids.uniq.each do |subcategory_id|
      closet_item = find_appropriate_closet_item(user, subcategory_id)

      next if closet_item.nil?

      update_closet_item(closet_item)
      add_to_displayed_urls(displayed_urls, closet_item.image_url)
    end

    displayed_urls.compact
  end

  private

  def find_appropriate_closet_item(user, subcategory_id)
    user.closets
        .where(subcategory_id:)
        .where('last_displayed_at IS NULL OR last_displayed_at < ?', 24.hours.ago)
        .order('RANDOM()')
        .first ||
      user.closets
          .where(subcategory_id:)
          .order('RANDOM()')
          .first
  end

  def update_closet_item(closet_item)
    closet_item.update(last_worn_on: Time.zone.today, last_displayed_at: Time.zone.now)
  end

  def add_to_displayed_urls(displayed_urls, image_url)
    displayed_urls << image_url unless displayed_urls.include?(image_url)
  end
end
