module MessagesHelper
	def recipients_options(chosen_recipient = nil)
	  	if chosen_recipient != nil
	  		chosen_recipient_user_id = chosen_recipient.id
	  	end
	    s = ''
	    Profile.all.each do |profile|
	      s << "<option value='#{profile.user_id}' #{'selected' if profile.user_id == chosen_recipient_user_id}>#{profile.first_name + " " + profile.last_name}</option>"
	    end
	    s.html_safe
	end
end
