import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# AWS Config
EMAIL_HOST = ''
EMAIL_HOST_USER = ''
EMAIL_HOST_PASSWORD = ''
EMAIL_PORT = 587

msg = MIMEMultipart('alternative')
msg['Subject'] = "test foo"
msg['From'] = "from@rfer.com"
msg['To'] = "to@fesf.com"

html = open('index.html').read()

mime_text = MIMEText(html, 'html')
msg.attach(mime_text)

s = smtplib.SMTP(EMAIL_HOST, EMAIL_PORT)
s.starttls()
s.login(EMAIL_HOST_USER, EMAIL_HOST_PASSWORD)
s.sendmail("from@rffe.com", "to@esfsf.com", msg.as_string())
s.quit()
