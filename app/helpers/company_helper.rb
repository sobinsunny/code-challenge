module CompanyHelper
  def city_state_label(company)
    return if company.zip_code.nil?

    "#{company.city}, #{company.state}. "
  end
end
