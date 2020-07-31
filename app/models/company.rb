class Company < ApplicationRecord
  has_rich_text :description

  EMAIL_FORMAT = /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/.freeze

  validates :email, allow_blank: true, format: {
                      with: EMAIL_FORMAT,
                      message: "domain must be getmainstreet.com",
                    }
end
