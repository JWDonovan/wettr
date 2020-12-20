class Wettr::CLI
  def run
    response = Wettr::API.new.call_by_zip_code(zip_code: 43230, country_code: "gb")
    puts response
  end
end