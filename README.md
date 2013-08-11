Elance WR E-mail Spoofing & Impersonation (explanation and PoC)
==========

From Wikipedia:

> "Elance is a global online staffing platform where companies, organizations and individuals can hire independent freelance professionals and use online collaboration tools to manage teams and projects. Independent contractors create online profiles and portfolios, submit proposals for jobs, and collaborate and receive payment through the Elance website."

## The Work Room

The WR provides private messaging for both freelancers and contractors. Bid ID is used as database reference (this is important, the bid IDs are publicly available).
For each WR, Elance provides an unique email address with the following format, where XXXXXX refers to bid ID:

**    EXXXXXX-WR@workroom.elance.com**

## The bug


One of the first things I tried was to send a message from my personal e-mail address to a friend's WR address. An error about a message being filtered showed up at his WR and he was not able to see it.
Then I started playing with my SMTP server and fake headers worked surprisingly.
