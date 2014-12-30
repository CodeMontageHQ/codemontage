require 'net/http'
require 'open-uri'

module GithubLinkValidator
  GITHUB_URL_REGEX = /\A(http:\/\/|https:\/\/|www.)*github.com\/([\w\-]+)\/([\w\-]+)(\/[\w\-]*\/*)*(.git)*\z/

  def github_url?(url)
    url =~ GITHUB_URL_REGEX
  end

  def append_https(url)
    if url.start_with?('https')
      url
    elsif url.start_with?('http')
      url.gsub!(/http:/, 'https:')
    else
      url = 'https://' + url
    end
  end

  def remove_www(url)
    return url.gsub!(/www./, '') if url.match(/www./)
    url
  end

  def valid_url?(url)
    github_preferred_url = remove_www(append_https(url))

    begin
      response = Net::HTTP.get_response(URI(github_preferred_url))
      response.code == "200"
    rescue
      false
    end
  end

  def parse_github_url(url)
    url =~ GITHUB_URL_REGEX
    github_org = $2
    github_repo = $3

    {github_org: github_org, github_repo: github_repo}
  end

  def get_github_details(url)
    if github_url?(url) && valid_url?(url)
      parse_github_url(url)
    end
  end
end
