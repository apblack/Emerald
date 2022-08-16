.nr LL 6.5i
.nr PO 1.0i
.nr PI 0.2i
.LP
.LG
\fBA Language for Distributed Programming\fR
.LP
\fBAndrew P. Black and Henry M. Levy\fR
.sp 0.5
.nh
.PP
We are designing a new programming language and run-time system 
to simplify the programming of distributed subsystems.
The language provides an abstract type system that permits
system extensibility while allowing for very efficient
implementation.
.PP
Our interest in language design and language support for distribution
comes from our experience with the Eden Programming Language [Black
1985].  In Eden [Almes et al. 1985]
we found that linguistic support for
distributed objects greatly enhanced the ease with which distributed
programs could be written.   However, because the Eden Programming Language
is implemented as a preprocessor to Concurrent Euclid, there is a limit to
the support that it can provide.  For example, while EPL programmers can
define Eden objects, they must use different abstraction
mechanisms (those of Concurrent Euclid) when building small, local objects.
Other distributed programming systems, such as Argus [Liskov & Scheifler
1982], suffer
from the same distinction between network-wide objects (Argus Guardians)
and local objects (CLU Clusters).
.PP
We have designed and are prototyping a object-oriented language called
\fIEmerald\fR [Black et al. 1985] that provides a uniform semantics for all
objects, small and large, local and remote.  Based on compile-time
information, the compiler chooses an implementation for each object
appropriate to its use.  For example, the code for a particular 
operation may be compiled as a remote procedure call or as inline
instructions, depending on the circumstance in which it is used.  A single
parameter-passing mechanism \- call by object-reference \- is used for all
invocations.  
.PP
The Emerald type system provides the compiler with the knowledge needed
to make this optimization.  When
declaring an identifier, the Emerald programmer
specifies the \fIabstract type\fR of the objects that the identifier may
reference.  At run-time those objects will be implemented by
a particular \fIconcrete type\fR.  In many circumstances, the concrete
type can be determined at compile time, allowing the compiler to generate
the most efficient code.  In other cases, more general code must be
generated and a run-time check performed to ensure that the concrete
type conforms to the specified abstract type.
.PP
Another important aspect of Emerald is its support for object mobility.
Objects have a location and can be moved easily from one location to
another.  The language includes a parameter passing mode, called
\fIcall-by-move\fR, which specifies
that an argument to an invocation should be moved to the location of the
target of the invocation.  This allows the programmer or compiler
to reduce the number of remote invocations to a parameter object
in cases where it is more efficient to relocate that object.  It is
the existence of call-by-move that makes it feasible to use call-by-reference
for passing small arguments to remote invocations.
.PP
This research is being conducted by Professors Black and Levy and by
graduate students Norman Hutchinson and Eric Jul.   A prototype 
implementation is being constructed on a small network of DEC
MicroVAX IIs purchased with a grant from Digital Equipment Corporation.
.SH
References
.LP
.ps -1
.vs -1
.nr PS -1
.nr VS -1
[Almes et al. 1985]
.RS
Guy T. Almes, Andrew P. Black, Edward D. Lazowska, and Jerre D. Noe.
The Eden System:  A Technical Review.  \fIIEEE Transactions
on Software Engineering SE-11\fR (January 1985).
.RE
.LP
[Black 1985]
.RS
Andrew P. Black.  The Eden Programming Language.
Technical Report 85-09-01, Department of
Computer Science, University of Washington
(September 1985).
.RE
.LP
[Black et al. 1985]
.RS
A. Black, N. Hutchinson, E. Jul, and H. Levy.
Distribution and Abstract Types in Emerald.  Technical Report
85-08-05, Department of Computer Science,
University of Washington. 
.RE
.LP
[Liskov & Scheifler 1982]
.RS
B. Liskov and R. Scheifler.  Guardians and Actions:  Linguistic Support for
Robust, Distributed Programs.  \fIProc. 9th ACM Symposium on
Principles of Programming Languages\fR (1982).
.RE
.ps +1
.vs +1
.nr PS +1
.nr VS +1
.bp
