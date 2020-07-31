namespace :test_data do
  desc 'add test rich text blocks'
  task rich_texts: :environment do
    add_rich_text_to_companies
  end

  def add_rich_text_to_companies
    Company.all.each do |company|
      add_rich_text_to_company(company)
    end
  end

  def add_rich_text_to_company(company)
    company.description = "<h3>#{company.name} is the best choice</h3>
                     <p>#{company.name} is by far your best choice to be your provider you should look no further.</p>
                     <ul>
                      <li>Benfifit or feature number one of #{company.name}</li>
                      <li>#{company.name} is really the best for sure</li>
                      <li>You should hire #{company.name} and nobody else</li>
                     </ul>
                     <p>We focus on providing you with a written detailed estimate for your painting making sure that you know there are no hidden costs. We also like to give you different options that meet your budget needs. Following our first visit, we help you with painting colors and setting up an upcoming date for your project.</p>"
    company.save
  end
end
