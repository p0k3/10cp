class AdviceMailerPreview
  def send_confirmation_validation
    AdviceMailer.send_confirmation_validation Advice.validated.last
  end
  def send_confirmation_invalidation
    AdviceMailer.send_confirmation_invalidation Advice.invalidated.last
  end
end
