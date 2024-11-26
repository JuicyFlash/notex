class Page < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  has_ancestry

  def d_title
    title.presence || "Без названия"
  end
end
