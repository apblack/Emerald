.nh
.(b C
.b "Engineering Distributed Applications"
DRAFT
.sp
Andrew P. Black
.sp
16th March 1987
.sp 3
.)b
.he ''\- % \-''
.lp
.b "Research Abstract" :
.hy 14
The goal of this project is to explore new techniques for building
distributed applications.  Such applications will become increasingly
common over the next five years, and the technology for building them needs
to be improved.  We believe that the Emerald system significantly
simplifies the programming of distributed applications, but that belief has
yet to be tested by building a realistic distributed application in
Emerald. We therefore propose to bring up the Emerald implementation within
the Distributed Systems AD group.  Subsequently, we will simultaneously
refine the implementation to 
.q "industrial strength"
and begin to write distributed applications using Emerald.
.lp
.b Deliverables :
There are three benifits of this work:
.np 
Improved knowledge and understanding of techniques for constructing
distributed applications.  Some important paradignms are supported by
Emerald directly (for example, independence of implementation and
location).  Others, such as hints and atomic transactions, while not
directly supported, are much easier for the programmer to construct because
of the features that are directly supported.  This work will give us
experience in the utility and application of all of these techniques,as
well as helping us to identity new techniques.  This experience is
essential if we are to be able to make informed design decissions regarding
Digital's future distributed systems and applications.
.np
Improved knowledge and understanding of the implementation techniques that
are required for the construction of efficient distributed languages and
systems.  Emerald isn't fast by accident: it is fast by design and by
implementation.  In other words, both the design \- indeed the very
existence \- of the language, and the design of the runtime system were
motivated by performance considerations as well as programmer interface.
This information should help us both to improve the performance of existing
products and to design new protocols and applications for better
performance.
.np
Improved Visibility.  Emerald has generated a suprising (to me) amount of
interest in the distributed systems and languages communities.  Continuing
work on Emerald will help DSAD to achieve and maintain visibility in those
communities, and to put DEC-Littleton 
.q "on the map"
as a place where distributed systems work at the leading edge is being
carried out.  This is essential if we are to recruit good people in the
future.
.sh 1 Background
.lp
The Emerald project [. Black Emerald OOPSLA 1986, Black Emerald IEEETSE .] at
the University of Washington, sponsored by DEC External Research, has been
exploring an object-oriented approach to building distributed applications.
Andrew Black was deeply involved with Emerald at Washington, and before
that with the Eden project.
.pp
Both Emerald and Eden provide the programmer with a universe of objects,
distributed across a network of workstations, uniformly addressable by
unique identifier,  mobile, and able to invoke operations on each other.
Eden was implemented as a set of operating system primitives, with the
result that both local and remote invocations were three orders of
magnitude more expensive than local calls.  Eden applications were only
feasible because each Eden object was itself built using a simpler,
non-distributed abstraction primitive (the module).
.pp
In contrast, Emerald is presented as a set of 
.i "programming language"
primitives, and wherever possible these primitives are implemented by the
compiler.  As a result, Emerald is able to use a single unit of
abstraction, (the object), with a single set of semantics, at all levels of
the system.  The Emerald notion of object includes integers, simple
structures, persistent files and processes.
Those objects that are in fact simple local record structures
are compiled as such, with performance equal to records in Modula or C.
The most general form of object invocation still requires the transmission
of network messages, and is commensurate in performance with RPC mechanisms.
But such remote objects can be relocated 
.i dynamically ,
and can then be invoked at a cost that is within 20% to 50% of the cost of
a conventional local call.
.sh 1 "The Complexity of Distribution"
.lp
Distributed systems are inherently more complex to program than
non-distributed systems.  There are two aspects to this complexity: the
conceptual and the mechanistic.
.pp
In an effort to reduce the mechanistic complexity, much
recent work has focused on tools that assist in the construction and
programming of distributed systems and applications.  Examples include
message-based operating systems such as Accent [.Rashid 8th SOSP.] and V
[.Cheriton IEEE V Kernel.], remote procedure call facilities such as Xerox
RPC [.Birrell Nelson.], and languages such as Argus [.Liskov  POPL9 .] and
the Eden Programming Language (EPL) [.Black 1985 EPL.].  
.pp
These three approaches to distribution represent a succession of
abstractions.  Message-based systems require the programmer to deal with the
details of locating message targets, packaging messages, and with
asynchronous communication.  Remote procedure call hides the details of
packaging and process control and presents the programmer with a standard
procedure call paradigm;  however the programmer is responsible for
locating the target of the call.  Object-based languages such as Argus and
EPL provide location-independent invocation of distributed objects;
location is implicit.  As one moves along this spectrum from message-based
systems to distributed languages, flexibility and control are traded for
simplicity and ease of programming.
.pp
These efforts have indeed been successful, in the sense that RPC mechanisms
and their equivalent are now widely available and programmers routinely
write applications that use them.  However, the conceptual difficulties of
distribution remain, and will always remain.  Off machine communication will
always be orders of magnitude slower than on-machine communication; for the
foreseeable future, wide-area bandwidth will be far less available than
local bandwidth.  The 
.i locatics
\- decisions concerning location \- of a distributed application are
therefore absolutely central to its performance and scalability.  And the
state of the art is such that our assumptions about locatics are likely to
be wrong: as applications come fully into use and increase in scale they 
will have to be 
.q tuned
by relocating components.
.pp
The problem with conventional tools for writing distributed applications
is that the locatics of the application cannot be changed without
re-writing some of the code.  For example, although the goal of RPC
systems is to make remote calls look like local calls, they never quite
succeed: references cannot meaningfully be passed in an RPC
call, and call-by-value-result is usually used in preference to call by
reference.  More importantly, there is nothing except self-discipline to ensure
that the remote server behaves in a way that can be simulated by a local
module; it is very tempting to take advantage of the fact that a server is
remote to do special tricks.  Yes, it is sometimes possible to make the remote
server local (in a separate address space and accessed via RPC)
but a 
.q local 
call to such a server is still typically one or two orders of 
magnitude slower than an ordinary local call.
.pp
Because of Emerald's strict adherence to a single object model, it is
always possible to move an object.  This may be done dynamically, which
obtains most of the benefits of locality, or by recompiling, which yields
code as good as that from a conventional language like Modula.
Moreover, a new calling mode called 
.q "call-by-move" 
makes it feasible to use call by reference for 
.q small
arguments to remote invocations.
.sh 1 "Proposed Work"
.lp
Emerald is new, and the implementation is newer.  Indeed, some features are
not yet implemented, notably checkpointing of objects (to achieve
persistence despite crashes) and garbage collection.  Most significantly,
the innovations that we believe will lead to improved distributed
applications have not been put to the test of use.
.pp
The work that we propose is to simultaneously implement a significant
distributed application in Emerald, and to complete and improve the 
implementation so that it becomes
.q "industrial strength" .
In doing this, we hope to learn about distributed programming and about
language support at the same time.
.pp
Our pilot application will be a distributed, multi-user calendar system
that has the capability of scheduling meetings between groups of people.
A transient single-user version is easy to implement.  The extension to
multiple users requires investigation of protection and access control
issues.  Making calendars persistent requires that persistence be added to
Emerald.
.pp
Because of the exploratory nature of this work, it is hard to set firm
milestones.  Also, the rate of progress depends to some extent on obtaining
suitable personel.  The following guesses should therefore be treated with
caution.
.Bp
Obtain Emerald system from UW, and install on Ultrix system at LKG.
Predicated on getting Ultrix disk space in LKG.   Completed by 1st May 1987.
.Bp
Demonstrate multi-machine operation.  Contingent on availability of
multiple machines.
.Bp
High-level design of Object-Oriented Calendar system.  
Initially based on that of Eden Calendar System.  Includes access control,
and depends on authentication.  Can be started in parallel with the above.
Completed by 15th June 1987
.Bp
Coding of initial design in Emerald.  Completed 7th July 1987.
.Bp
Debugging and configuration.  Demonstration of Working calandar system in
volatile memory by 30th July 1987.
.Bp
Design and implementation of checkpoint facility for Emerald.  Modification
of calendar system to achieve crash resistance.  Completed by 15th
September 1987. 
.Bp
Prepare calendar system for distribution to some small collection of users.
Improve user interface as necessary.  Collect information on location
behaviour of calendar objects.   No target date as yet.
.Bp
Further details would at this point be pure speculation.
.)b
.ig
.sh 1 "Long-term Implications"
.lp
The development of Emerald has been predicated on the assumption that only
with language and compiler support can location-independent distributed
objects be made efficient.  If this assumption is indeed correct, it is
unfortunate, because bringing a new and unconventional programming
language into wide use is one of the most difficult tasks known to
informatics.
.pp
An important part of this project will therefore be to examine how well
this assumption holds.  Having evaluated the innovations of Emerald, and
determined which are indeed of significant benefit and which are of little
value, we will be in a better position to see if it is possible to 
.q "reverse engineer"
these innovations into a conventional programming language.  Perhaps it will
be possible to get 80% of Emerald's benefits by using 20% of Emerald's
compiler technology in a conventional language; perhaps it will require
that 80% of the conventional language will have to be replaced in order to
achieve 20% of Emerald's performance. 
..
.sh 1 References
.so /usr/users/black/roff/arizonabibmacs
.[]


