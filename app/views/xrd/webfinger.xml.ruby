Nokogiri::XML::Builder.new do |xml|
  xml.XRD(xmlns: 'http://docs.oasis-open.org/ns/xri/xrd-1.0') do
    xml.Subject @canonical_account_uri
    xml.Alias url_for_target(@account)
    xml.Link(rel: 'http://webfinger.net/rel/profile-page', type: 'text/html', href: url_for_target(@account))
    xml.Link(rel: 'http://schemas.google.com/g/2010#updates-from', type: 'application/atom+xml', href: account_url(@account, format: 'atom'))
    xml.Link(rel: 'salmon', href: api_salmon_url(@account.id))
    xml.Link(rel: 'magic-public-key', href: @magic_key)
  end
end.to_xml
