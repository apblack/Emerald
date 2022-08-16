Hank:

    I read the paper yesterday, and now plan to give you some comments.
I have detailed line-by-line comments, and overview comments.  I also have
a meeting in 35 minutes, so will not finish this message in time -- I expect
that I'll send what I have and then pick up later.

    First for the overview: I don't like it very much.  The details are
technically interesting, but there is almost a complete lack of structure.
What is new?  Why is it interesting?  Why are you telling me this?  I have
no answers to any of these questions, and you can count on the fact that I
have put more time into this than an SOSP reviewer would.  (I also clim to
have a better perspective on this right now than you or Norm, since I
havn't been working on Emerald for two months.)

    There are a couple of things that the paper could be about:  uses of
fine grained mobility, or design and implementation.  I claim that it
should be about the latter.  The introduction can say a bit about why it is
useful, but that should NOT be emphasised.  Why?  
    (1) We havn't used Emerald enough yet to know.
    (2) Even if we had, we wouldn't convince anyone who had already decided
        that mobility was a dead duck.


    So:  Start the intro with the second para.  (I'm refering to pages and
paras in TR 87-02-03 dated Feb 1987): start by talking about what is in the
paper, not what is out.  (Large sections of the paper read as if Jul wrote
them.)  Having be told that object mobility is better than and different
from process mobility, I don't want to be told that Powell's quote applies
to both.

    One paragraph on the utility of mobility. Start with a disclaimer:
Emerald is an experiment to evaluate this, and we havn't done it yet.
Somewhere inhere there should be a refernce to Eden, and it's incompletely
implemented form of mobility -- because it motivated the Emerald stuff, not
because it competes.  Of your list of advantages, 6 is bogus: why should I
want to move data, since I can only get to it via a location-independent
invocation whereever it is.  7 looks like 2: if it is different, make it
clear what the difference is.  8 looks dubious too -- but I havn't read
vestal's thesis.  In fact, all the motivations for **fine grained**
mobility look weak or non-existant.

    Then make it clear that the paper is realy about how to implement
mobility, and why we made the tradeoffs that we did.  The "overview of
Emerald" should maybe come out -- it's been in a lot of other papers.  Of
course, the reader has to know what we are talking about.  There should be
a page on emerald in general at most.  Then introduce the locatic
primitieves, with a forward reference to call by move.

    The rest of the paper is all about implementaion techniques, including
performance measures. 

    (1) Implementing processes: we use a linked stack.  We say why (I like
        this).  We also say that this means that on-stack references have
	to be translated.

    (2) Implementing Object addressing.  Use local addresses locally and
	bight the bullet when it comes to motion.  Again, I like the
	discussion.
	
    (3) Implementing translation of addresses.
    
    (4) Implementing the motion of objects themsleves.
    
    (5) Problems with registers.  This may not be a separate section, as it
        has been hinted at in the templates section, but it is certainly
	interesting (i.e., I hadn't thought of it before).

    (6) performance.  A little trumpet blowing, and time to crap on Unix.

Now it's time for my meeting.  I'll give you line by line stuff around
noon, so it may arrive before you are out of bed.

    Andrew


