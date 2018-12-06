# Loads all Languages known to GitHub
require 'yaml'
GithubLanguages = YAML.load_file(Rails.root.join('lib/assets/', 'github_languages.yml'))