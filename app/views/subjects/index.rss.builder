#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "10 Conseils Pour"
    xml.description "Tout ce qu'il faut savoir sur tout réuni dans les meilleurs conseils. Retrouvez des conseils pour la maison, la famille, le travail, vos loisirs et même pour votre ordinateur"
    xml.link root_url

    for subject in @subjects
      xml.item do
        xml.title "##{subject.theme_title} - #{subject.title}"
        xml.description subject.description
        xml.pubDate subject.created_at.to_s(:rfc822)
        xml.author subject.authorname
        xml.link subject_url(subject.slug, subject.id)
        xml.guid subject.id
      end
    end
  end
end