# Readme

Keeper keeps things for you, primarily receipts. 

## The Idea

A Keeper instance is deployed for a single family. Each member gets their own tray (think in/out trays) and receipts are stored in these. Additional shared trays can be created to share with the rest of the family on a read only or read/write basis.

## Configuration

AWS_ACCESS_KEY_ID (production only)
AWS_SECRET_ACCESS_KEY (production only)
AWS_REGION (production only)
AWS_BUCKET (production only)
GOOGLE_CLIENT_ID
GOOGLE_CLIENT_SECRET
PERMITTED_USERS A comma seperated list of email addresses permitted to use Google auth to access this instance.
PERMITTED_SENDERS A comma seperated list of email addresses permitted to send receipts via email - this is used in addition to PERMITTED_USERS who can by default email the Keeper instance.

### MailGun for creating receipts via email

A MailGun free account can be used (without the need to configure MX record). Provision the addon and configure a receiving catch all route to `https://<YOUR KEEPER INSTANCE>/rails/action_mailbox/mailgun/inbound_emails/mime`. From Sending > Domains copy the default sandbox domain - emails sent to anything@sandboxdomain will then be routed to your Keeper instance. If you have mailbox forwarding at your DNS/mail provider you could configure it to forward `keeper@yourdomain.com` to anything@sandboxdomain.

You may also find that your printer/scanner can scan directly to an email address, this is how I use Keeper myself.

# Development

Dependencies:

* Postgresl
* Redis
* ImageMagick (brew install imagemagic)
* Poppler (brew install poppler)

## Google Oauth
You'll need to configure a Google project and an Oauth client via https://console.developers.google.com/. Oauth is configured from the Credentials option on the left menu. From the 'Create credentials' button choose 'Oauth client ID' and choose web application. Use `http://localhost:5000/auth/google_oauth2/callback` as the authorised redirect URI. NOTE: Enter the callback URL and make sure you click the save button (that caught me out). Create a second set of credentials for production. Set the client ID and client secret in `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` in your `.env` file.

## Running

1. `rails db:setup`
2. `yarn install`
3. `heroku local`

