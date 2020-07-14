# Readme

Keeper keeps things for you, primarily receipts. 

## The Idea

A Keeper instance is deployed for a single family. Each member gets their own tray (think in/out trays) and receipts are stored in these. Additional shared trays can be created to share with the rest of the family on a read only or read/write basis.

## Configuration

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
AWS_BUCKET
PERMITTED_USERS A comma seperated list of email addresses permitted to use Google auth to access this instance.
PERMITTED_SENDERS A comma seperated list of email addresses permitted to send receipts via email - this is used in addition to PERMITTED_USERS who can by default email the Keeper instance.

### MailGun for receipts via email

A MailGun free account can be used (without the need to configure MX record). Provision the addon and configure a receiving catch all route to `https://<YOUR KEEPER INSTANCE>/rails/action_mailbox/mailgun/inbound_emails/mime`. From Sending > Domains copy the default sandbox domain - emails sent to anything@sandboxdomain will then be routed to your Keeper instance. If you have mailbox forwarding at your DNS/mail provider you could configure it to forward `keeper@yourdomain.com` to anything@sandboxdomain.

You may also find that your printer/scanner can scan directly to an email address, this is how I use Keeper myself.