class Company < ApplicationRecord
  EMAIL_FORMAT = /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/.freeze

  has_rich_text :description

  validates :email, allow_blank: true, format: {
                      with: EMAIL_FORMAT,
                      message: "domain must be getmainstreet.com",
                    }
  validate :valid_zip_code, if: :zip_code
  before_save :set_state_and_city, if: :zip_code

  private

  def set_state_and_city
    zip_code_data = ZipCodes.identify(zip_code)
    self.city = zip_code_data[:city]
    self.state = zip_code_data[:state_code]
  end

  def valid_zip_code
    return if ZipCodes.identify(zip_code).present?
    errors.add("zip code", "Invalid Zip code")
  end
end
