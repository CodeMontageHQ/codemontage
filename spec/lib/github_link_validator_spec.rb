require 'spec_helper'
require "#{Rails.root}/lib/github_link_validator"

describe GithubLinkValidator do
  include GithubLinkValidator

  let (:valid_github_urls) { ['http://www.github.com/codemontagehq/codemontage',
                              'https://www.github.com/courte/codemontage',
                              'http://github.com/dbness/codemontage',
                              'www.github.com/codemontagehq/codemontage',
                              'https://github.com/courte/codemontage',
                              'github.com/dbness/codemontage',
                              'https://github.com/CodeMontageHQ/codemontage/pull/269'] }

  let (:valid_github_url) { 'www.github.com/codemontagehq/codemontage' }

  describe '#github_url?' do

    it 'returns true for accurate github repo urls' do
      good_github_urls = valid_github_urls + ['https://github.com/fake/repo', 'www.github.com/banana/pudding-cup']

      good_github_urls.each do |github_url|
        expect(github_url?(github_url)).to be_true
      end
    end

    it 'returns false for inaccurate github repo urls' do
      urls = ['http://www.cnn.com', 'http://www.google.com/search?q=this+american+life', 'github.com/courte', 'https://commonplacebooks.com']

      urls.each do |url|
        expect(github_url?(url)).to be_false
      end
    end
  end

  describe '#valid_url?' do

    it 'returns true for urls that are ok or redirect' do

      valid_github_urls.each do |valid_url|
        expect(valid_url?(valid_url)).to be_true
      end
    end

    it 'returns false for invalid urls' do
      invalid_urls = ["http://www.ajiofj.io", "https://bananacrabcakepalace.net", "https://github.com/woinvewnus/cuxywwe", "www.github.com/courte/notarepo", "github.com/ospreys-2014/phase-1-guide"]

      invalid_urls.each do |invalid_url|
        expect(valid_url?(invalid_url)).to be_false
      end
    end
  end

  describe '#parse_github_url' do

    it 'returns the github org, pulled from the input url' do
      url = 'www.github.com/codemontagehq/codemontage'
      github_details = parse_github_url(valid_github_url)
      expect(github_details[:github_org]).to eq('codemontagehq')
    end

    it 'returns the github repo, pulled from the input url' do
      github_details = parse_github_url(valid_github_url)
      expect(github_details[:github_repo]).to eq('codemontage')
    end
  end

  describe '#get_github_details' do

    it "returns the github org and repo in a hash" do
      github_details = get_github_details(valid_github_url)
      expect(github_details).to eq({github_org: 'codemontagehq', github_repo: 'codemontage'})
    end
  end
end
