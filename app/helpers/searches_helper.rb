module SearchesHelper
  def search_button
    content_tag :button, content_tag(:i, nil, class: 'fas fa-search-plus') + ' Search',
                type: 'submit', name: 'commit', class: 'btn btn-success'
  end

  def languages_labels languages
    content_tag :div do
      languages.each do |language|
        concat content_tag :h5, (content_tag :span, language, class: 'badge badge-info')
      end
    end
  end

  def language_label language
    content_tag(:span, language, class: 'badge badge-info')
  end

  def search_total_results search
    search.results.count
  end

  def search_placeholder search
    search.name.nil? ? 'Search for repositories' : search.name
  end
end
