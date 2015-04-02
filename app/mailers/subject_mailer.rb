class SubjectMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application
  layout 'mailer'

  def send_confirmation_validation(subject)
    @subject = subject
    @to = @subject.user_email
    @from = "contact@10conseilspour.fr"

    mail(to: @to, from: @from, subject: "10 Conseils pour - Votre sujet a été validé et publié") do |format|
      format.html
    end
  end

  def send_confirmation_invalidation(subject)
    @subject = subject
    @to = @subject.user_email
    @from = "contact@10conseilspour.fr"

    mail(to: @to, from: @from, subject: "10 Conseils pour - Votre sujet n'a pas été validé") do |format|
      format.html
    end
  end

end