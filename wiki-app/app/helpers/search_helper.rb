module SearchHelper
  def article_search(word)
    matches = []
    articles = Article.all
    articles.each do |article|
      if article.content.downcase.include?(word.downcase)
        matches << article
      end
    end
    matches
  end
end
