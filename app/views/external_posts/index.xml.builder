xml.posts do
  @external_posts.each do |post|
    if post.published?
      xml.post do
        xml.id(post.id)
        xml.title(post.title)
        xml.body(post.body)
        xml.created_at(post.created_at.strftime("Criado em %d/%m/%Y"))
        xml.last_updated(post.updated_at.strftime("Última vez atualizado em %d/%m/%Y"))
      end
    end
  end
end