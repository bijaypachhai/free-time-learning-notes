# Postfix as a Mail Transfer Agent
Postfix is a Mail Transfer Agent (MTA) used by Gitlab (and many other system) to send email -- for example, account confirmations, password resets, pipeline notifications, etc.

## What is Postfix used for in GitLab ?
In a self managed GitLab instance, postfix is typically used to :

|Relay outbound emails from GitLab (notifications and alerts)   |
|---------------------------------------------------------------|
|Act as a send-only SMTP client to forward emails via an external mail server (e,g. Gmail or custom SMTP provider)|

## No Need for Postfix, Send emails via Gmail SMTP directly from GitLab

Open `/etc/gitlba/gitlab.rb` configuration file and add following settings.

```ruby
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_address'] = "smtp-relay.gmail.com" # route outgoing non-gmail messages
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "your-email@gmail.com"
gitlab_rails['smtp_password'] = "your-app-password"
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['gitlab_email_from'] = "admin@webexpertsnepal.com"
gitlab_rails['gitlab_email_reply_to'] = "admin@webexpertsnepal.com"

gitlab_rails['gitlab_email_from'] = 'your-email@gmail.com'

```

> Caution: Gmail does not allow login with your main password. You need to create an App Password. Visit https://myaccount.google.com/apppassword and create a new app password for "Mail", and use that 16 character password in smtp_password.

After updating the config run: `sudo gitlab-ctl reconfigure`

### Test Email Delivery

> Make sure you use well known terminals while running the below command, as I ran into problem with Ghostty

```bash
$sudo gitlab-rails console

```

```ruby
Notify.test_email('recipent@example.com', 'Test Email', 'This is a test email from GitLab').deliver_now

```

## References for Troubleshooting

[Gitlab Forum Discussion](https://forum.gitlab.com/t/using-gmail-to-send-email/710/5)


