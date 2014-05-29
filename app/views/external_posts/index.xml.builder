xml.posts do
  @external_posts.each do |post|
    if post.published?
      xml.post do
        xml.id(post.id)
        xml.title(post.title)
        xml.body(post.body)
        xml.created_at(post.created_at)
        xml.last_updated(post.updated_at)
      end
    end
  end
end