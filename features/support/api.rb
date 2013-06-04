module ApiSupport
  def last_xml
    Nokogiri.parse(last_response.body)
  end
end
