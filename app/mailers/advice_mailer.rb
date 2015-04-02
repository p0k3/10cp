class AdviceMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application
  layout 'mailer'

  def send_confirmation_validation(advice)
    @advice = advice
    @to = @advice.user_email
    @from = "contact@10conseilspour.fr"

    mail(to: @to, from: @from, subject: "10 Conseils pour - Votre conseil a été validé et publié") do |format|
      format.html
    end
  end

  def send_confirmation_invalidation(advice)
    @advice = advice
    @to = @advice.user_email
    @from = "contact@10conseilspour.fr"

    mail(to: @to, from: @from, subject: "10 Conseils pour - Votre conseil n'a pas été validé") do |format|
      format.html
    end
  end

end