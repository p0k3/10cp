class SubjectMailerPreview
  def send_confirmation_validation
    SubjectMailer.send_confirmation_validation Subject.last
  end
  def send_confirmation_invalidation
    SubjectMailer.send_confirmation_invalidation Subject.invalidated.last
  end
end
