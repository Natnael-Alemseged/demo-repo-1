import { createTransport } from 'nodemailer';

var transporter = createTransport({
  service: 'Outlook',
  auth: {
    user: 'mets-hafeLogger@outlook.com',
    pass: '7-PhxYZt=!Ds$ed'
  }
});

var mailOptions = {
  from: 'mets-hafeLogger@outlook.com',
  to: 'Natiaabaydam@gmail.com',
  subject: 'test',
  text: `test`
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});