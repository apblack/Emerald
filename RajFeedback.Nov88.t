From: Andrew P. Black  <black@hobart>
Subject: Thesis and Paper
To: raj
Cc: Levy@whistler.cs.Washington.Edu 
Bcc: Black
Message-Id: <595011599/black@hobart>

Cc: Hank Levy

Dear Raj:

    The purpose of this note is to try to record the gist of our
discussions last week before I forget it all.

    First, the paper on the Emerald approach to programming.   I think
that this is interesting and can be published in a respectable journal.
It would be nice to have that and the types paper come out together,
but we should cross that bridge when both papers are ready.

    Right now I believe that the paper has two problems.  First is the
lack of a convincing example.  I suggested using windows as an example,
but anything else that allows one to talk about conforming supertypes,
and about multiple implementations, and about one-of-a-kind objects
would do.  It is unlikely that any example would cover every aspect of
Emerald ideally, but the less we have to stretch it, the better.
Using windows, the discussion forms a lattice:


                                Single Window

                                    /\
                                   /  \
                                  /    \
                                 /      \
                                /        \
                               /          \ 
                    Many instances      conformant types - text window
                        of window       graphic window, etc.
                             |          could be a complex hierarchy
			     |		with orthogonal properties (aka
			     |		flavors) like editability,
			     | 	        resizability, etc.
                              \            /
                               \          /
                                \        /
                                 \      /
                                  \    / 
                              Multiple instances
                             of all of the above

Things like the Window manager and the mouse controller would be
one-of-a-kind objects.

The other problem is that the current discussion is repetitive, and
sometimes inaccurate.  This is becuase it tends to start before the reader
has all of the necessasry information.  For example, in the section on
object constructors there is a lot of discussion on not having classes, and
what we do about it.   However, that discussion can't be complete until we
know about types, becaue the classification role of classes is performed by
types.  So, a lot of the discussion has to be repeated and "undone" in the
types section.

I believe that the way to reolve this is to describe most if not all of the
language first, and then to have the discussion and comparison.  The
description should be in line with the title -- what I need to know to
"approach programming" rather than "the whole scoop" in the style of a
language manual.  Rather than a seprate section on types and objects, I
would suggest just using (in the example) and describing (in the text)
declarations and object constructors, and then describing the types via
the matching rules necessary to let me assign an object to an identifier.
In Pascal, the rule is "the types must match".  In Emerald it is "they must
conform".

On the whole, the paper covers almost all of the interesting aspects of
Emerald.  One exception is that I think (this week) that it should deal in
more detail with the question of choosing argument types (and result types)
in operation signatures.  We have to make the point that + does not operate
on integers, although it may return them.  Choosing the exact argument type
of + is a compromise.

Get the latest definition of "type" from Norm.  Signatures and getSignature
have gone away.  Instead a type exports operations something like:

  CONST t ==
    TYPE t
        OPERATION ops : -> Set.of[OpId]
        OPERATION getop : [OpId] -> Pair[Sequence.of[t], Sequence.of[t]]
    END t
  CONST OpId ==
    TYPE o
        OPERATION getName : -> String
        OPERATION getArity : -> Pair[Natural, Natural]
    END o

but more complicated because of contrained types.  I don't have the current
formulation (but Norm is sending it to me *real soon now*).

Second, about the thesis topic.  I like the idea of examining the program
composition progress in Emerald, and distinguishing where it is different
from other languages.  I like the idea of framing it as a programming
environments project -- find the right environment to support 
composition of variables and operations into objects.  I am *much* happier
with this than framing it as a language design project, because by leaving
the language untouched, you avoid the risk of breaking it, e.g., by making
dynamic something that the compiler relies on to be static.  So,
*descriptions* (e.g., parse trees) of operations should be objects, but the
operations themselves should not be.

So, what you need to do is to design this environment, and then implement
at least some interesting subset.  Smalltalk is probably the language of
choice for implementation, becasue of your own experience and the experience
available in resource people at UW.  Trellis/Owl would seem to have no
advantages.

I am also happy because there is local expertise in the environments area
in the form of David Notkin.

My major concern is that this is a lot of work, and you have only eleven
months more funding, unless Hank has something up his sleeve that I don't
know about.  To get it done in time, you will probably have to work harder
than you have ever worked before.  You will also have to be incredably
organised and resistant to distractions.  Draw yourself a timeline.  Write
a thesis outline.  Work closely with Hank and David to get some assurance
that if you can fill in the blanks, you will have a thesis.  I'm concerned
that you will have to take another TA-ship at the end of next summer to get
funding while you finish: as you know, teaching and writing up at the same
time just don't mix.

*PLEASE* keep in touch.  Call me or send mail if you want to talk.  Send me
drafts and plans.  Good luck!

Thanks for your hospitality last Saturday.  Good Luck!

    Andrew
