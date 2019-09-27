<!-- #include file="config.asp" -->
<%
Response.CodePage = 65001
Response.CharSet = "utf-8"

job = Request("job")

yname = Request.Form("yname")
yemail = Request.Form("yemail")
fname = Request.Form("fname")
femail = Request.Form("femail")
emailSelf = Request.Form("emailSelf")
emailFriend = Request.Form("emailFriend")
message = Request.Form("message")
url = Request.Form("url")
bookmarks = Request.Form("bookmarks")
notes = Request.Form("notes")

If job="sendtofriend" Then	
	msg=yname&" ("&yemail&") sent you this article!<br><br><br><a href='"&url&"'>Click here to view article</a><br><br>URL: <a href='"&url&"'>"&url&"</a><br><br>Your friend's message: "&message
	subject=yname&" sent you an article from UC Davis CA&ES Outlook!"
ElseIf job="sendcomment" Then
	msg=yname&" ("&yemail&") left a comment on your digital magazine page located at the following URL!<br><br><a href='"&url&"'> Click here to view article page</a><br><br>Your reader's comment:<br><br>"&message
	subject=yname&" left you a comment!"
ElseIf job="sendbookmarks" Then
	msg=yname&" ("&yemail&") emailed you these bookmarks for the digital magazine located at the following URL!<br><br><a href='"&url&"'>"&url&"</a><br>"&bookmarks&"<br>"&message
	subject=yname&" sent you bookmarks from UC Davis CA&ES Outlook!"
ElseIf job="sendnotes" Then
	msg=yname&" ("&yemail&") emailed you these notes for the digital magazine located at the following URL!<br><br><br><a href='"&url&"'>"&url&"</a><br>"&notes&"<br>"&message
	subject=yname&" sent you notes from UC Davis CA&ES Outlook!"
End If

If job="sendcomment" Then
Call SendEmail(yname & "<" & yemail & ">",fname & "<" & femail & ">",subject,msg)
Else
If(emailSelf) Then
Call SendEmail(yname & "<" & yemail & ">",yname & "<" & yemail & ">",subject,msg)
End If

If(emailFriend) Then
Call SendEmail(yname & "<" & yemail & ">",fname & "<" & femail & ">",subject,msg)
End If
End If
%>
