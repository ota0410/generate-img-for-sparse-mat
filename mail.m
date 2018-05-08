setpref( 'Internet', 'SMTP_Server', 'smtp.mail.me.com');
setpref( 'Internet', 'SMTP_Username', 'xyz_combination@icloud.com');
setpref('Internet', 'E_mail', 'xyz_combination@icloud.com');
setpref('Internet','SMTP_Password','Abcdefb4');

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','587');

setpref('Internet','E_mail_Charset','UTF-8'); 
sendmail('s1821611@s.tsukuba.ac.jp','åèñº','ñ{ï∂'); 