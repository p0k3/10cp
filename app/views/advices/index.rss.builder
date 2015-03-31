xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "10 Conseils Pour"
    xml.description "Tout ce qu'il faut savoir sur tout réuni dans les meilleurs conseils. Retrouvez des conseils pour la maison, la famille, le travail, vos loisirs et même pour votre ordinateur"
    xml.link root_url

    for advice in @advices
      xml.item do
        xml.title advice.title
        xml.description advice.description
        xml.pubDate advice.created_at.to_s(:rfc822)
        xml.link subject_url(advice.subject_slug, advice.subject_id)
        xml.guid subject_url(advice.subject_slug, advice.subject_id)
      end
    end
  end
end