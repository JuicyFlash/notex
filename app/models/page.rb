class Page < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  def d_title
    title.presence || "Без названия"
  end
end
