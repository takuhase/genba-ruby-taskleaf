class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  # 検証用メソッドを定義
  validate: validate_name_not_including_comma

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません。') if name&.includes?(',')
  end
end
