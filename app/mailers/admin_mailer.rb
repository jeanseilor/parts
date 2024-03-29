class AdminMailer < ApplicationMailer

	def update_email(current_admin, admin)
		@current_admin = current_admin
		@admin = admin

		mail(to: @admin.email, subject: "Seus dados foram alterados")
	end

	def send_message(current_admin, recipient, subject, message)
		@current_admin = current_admin
		@admin = recipient
		@subject = subject
		@message - message
		mail(to: @admin, subject: @subject)
	end
end
