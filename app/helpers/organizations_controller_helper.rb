require 'httparty'

module OrganizationsControllerHelper
  GITHUB_URL_REGEX = /\A(http:\/\/www.|https:\/\/www.|www.)*github.com\/(\S+)\/(\S+)(.git)*\z/

  def github_url?(url)
    url =~ GITHUB_URL_REGEX
  end

  def valid_url?(url)
    response = HTTParty.get(url)

    github_url?(url) && response.code == 200
  end

  def parse_github_url(github_url)
    github_url =~ GITHUB_URL_REGEX
    github_org = $2
    github_repo = $3

    {github_org: github_org, github_repo: github_repo}
  end

  def get_github_details(submitted_url)
    if valid_url?(submitted_url)
      parse_github_url(submitted_url)
    else
      raise "The submitted url is not valid."
    end
  end
end
