.sh 1 "Results from Prior NSF Support"
.lp
Andrew Black has been a co-principal investigator of the grant MCS-8004111
.q "A Functionally Integrated Environment for Distributed Computation" ,
informally known as the
.b "Eden Project" ,
since September 1983.  The Eden grant commenced in September
1980, and terminated in September 1985.  The total amount of support over
that five year period was $4\|202\|271.  Drs Almes, Fischer, Golde
and Lazowska have also been co-principal investigators of the Eden
project at various times.  Dr Jerre Noe was the project director.
.pp
Both Andrew Black and Henry Levy are currently co-principal investigators
of grant DCR-8420945
.q "Integration in Homogeneous and Heterogeneous Distributed Computer Systems" , 
which commenced on 15th September 1985.  (See Section 6, Current and
Pending Support.)  At the time of writing, this project is still in the
organizational phase.  
.sh 2 "An Overview of the Eden Project"
.lp
The Eden project is an experimental investigation of a specific approach to
providing logical integration in a locally distributed system.
.pp
The original objectives of Eden were ambitious, and not all of these
objectives have been fully achieved.  This fact, coupled with an
unfortunate choice of hardware made in the first year of the project (and
subsequently changed), has led to a negative perception of the
project by those not familiar with it.  In actuality, the accomplishments of
Eden are significant, both when viewed absolutely and when viewed relative
to other research projects of comparable scope.  At a site visit conducted
by the NFS in January 1985, one reviewer noted that 
.(q
One of the most striking impressions gotten during the visit is that a
large discrepancy  exists  between  the external perception of the Eden
project that seems to be widely held (that it  failed), and that gained at
first-hand from presentations, demos, and written reports.  Viewed as a
research project  rather  than as  product  development,  I would rate Eden
as a great success; something to be very proud of.  
.)q
Another reviewer commented
.(q
My  impression  before  the  site  visit  was  that  the  Eden  project had
not accomplished very much.  The visit changed my mind.  They have done
some very good  systems  research,  although  most  of it has not been
published yet.	
.)q
Since that visit, the publication record of the Eden project has improved
significantly.  For example, a comprehensive Technical Review has appeared in 
.i "IEEE Trans. Software Engineering" , 
and Andrew Black will present a paper on some of the systems aspects of
Eden at the 
.i "10th ACM Symposium on Operating Systems Principles" .
.nr x \n($2+1
A complete list of Eden publications appears in Section \n($1.\nx.
.pp
The fundamental ideas of Eden have been shaped through experiences with a
series of prototype implementations.  The first implementation, a
single-node prototype called Newark, was built on top of a VAX system
running VMS and became operational in 1981.  The present implementation,
built on Sun/U\s-2NIX\s+2 systems interconnected by Ethernet, has been in
use since 1984.  Over the life of the project, roughly thirty graduate
students and six faculty members have participated in a serious way.
.pp
The Eden system represents a merging of three distinct threads in operating
system design:
.Bp
First, Eden is a state-of-the-art object-oriented system.  In this sense,
Eden is a descendant of Hydra[.Hydra Book.].
.Bp
Second, Eden is a complete distributed operating system.  In this sense it
is rather like the Apollo D\s-2OMAIN\s+2 system [.Apollo domain IEEE.] 
or the L\s-2OCUS\s+2 system [.Locus.].
.Bp
Third, Eden includes a full scale implementation of remote procedure call,
including stub generation for both client and server, and an external data
representation.  In this sense it is rather like the RPC system pioneered at
Xerox PARC [.Birrell Remote Procedure Implement .].
.lp
Eden thus has something in common with a number of the advanced operating
systems projects of the last few years.  However, in combining the advances
of these systems, Eden provides a unique set of facilities.  It is
distinguished from systems such as L\s-2OCUS\s+2 in being based on a
contemporary object-oriented model.  It is distinguished from the Apollo
D\s-2OMAIN\s+2 system by having a notion of object that is definable and
extensible by the user.  It is distinguished from the Xerox system by the
fact that objects are mobile and that the binding of a client to a server
is performed upon every invocation rather than just once.  And of course it
is a significant advance over the Hydra system in that distribution is an
integral part.
.pp
It is important to observe that Eden is not a collection of facilities
provided on top of an existing operating system in an attempt to graft
distribution onto a conventional style of computation.  This is true despite
the fact that the current prototype implementation of Eden is built using
the facilities of U\s-2NIX\s+2.  U\s-2NIX\s+2 is merely an implementation
vehicle; Eden itself provides the user with a complete, advanced
environment for the development and execution of distributed applications.
.pp
The direct technical accomplishments of Eden can be divided into four
categories: the design and implementation of an advanced object-oriented
distributed system, the provision of substantial programming language
support for the fundamental abstractions of the system, the design and
implementation of a significant number of distributed applications, and the
provision of a research tool.  Each of these is discussed briefly below.
.sh 3 "The Design and Implementation of an Object-Oriented Distributed System"
.lp
Eden objects, the basic building blocks of distributed applications in
Eden, exhibit the following characteristics:
.Bp
\fIInvocation\fR is the means whereby one object obtains service from
another.  It may be thought of as a request message followed some time later
by a response message.
.Bp
Invocation is \fIlocation independent\fR; one object does not need to know
the location of another object in order to invoke it.  
.Bp
Objects are named by \fIcapabilities\fR.  Capabilities are not
addresses.  Rather, each object has an unique identifier.  A capability
consists of that unique identifier and a set of rights.  The problem of
locating an object given only its capability is handled by the system
itself.  Capabilities are protected from forgery by the system.
.Bp
Objects are \fImobile\fR.
.Bp
Objects are \fIactive\fR.  Each object has one or more processes within it.
This stands in contrast to Smalltalk objects, where a thread of control
enters an object when a request is made, but leaves again it when the response is
completed.  Eden objects can thus perform activities on their own behalf,
as well as in response to invocations.  While one process of an object is blocked
awaiting the reply to an invocation, other processes in the same object are
free to continue.
.Bp
Each object has a \fIconcrete Edentype\fR, which may be regarded as a
description of the state machine that defines the behavior of the object,
i.e., it defines those invocations that the object will accept and what
their effect will be.  In implementation terms the concrete Edentype is a
piece of code in the Eden Programming Language.
.Bp
Each object has a \fIdata part\fR, which includes long-term state
representing the data encapsulated by the object and short-term state
consisting of the local data of invocations currently in progress, hints,
caches, and so on.
.Bp
An object may \fIcheckpoint\fR.  This is an atomic way of writing its state
to stable storage.  The data is written under the control of the concrete
Edentype of the object.  Typically all of the long-term state will be
written, and as much of the short-term state as is necessary to achieve the
reliability specification of the object.  
.Bp
Finally, objects are \fIactivated automatically\fR when they are invoked,
if that proves to be necessary.  Conceptually we wish to regard objects as
active at all times.
.sp 0.5
.lp
These characteristics of Eden objects lend the following
unique characteristics to the Eden system as a whole:
.Bp
First, it is an integrated system with a single uniform system-wide
namespace.  Its space of objects is managed by the system, in the sense that
the system takes care of obtaining resources for the creation of a new
object and for garbage collecting objects when they are no longer
accessible. 
.Bp
Eden objects can be typed abstractly.  By this we mean that several
different pieces of code can implement services that at some level
of abstraction may be considered as identical.  For example, there may be
two concrete directory types which support the same set of operations but
which exhibit different reliability and performance characteristics.
Because both implementations export the same abstract interface, when
invoking a directory the invoker need not be concerned with which concrete
type is actually used.  This simple idea permits us to support, among other things, 
multiple
inheritance hierarchies in the sense of Smalltalk [.smalltalk multiple inherit.] and the asymmetric stream
concept [.Black Asymmetric SOSP.].
.Bp
The third consequence is that data encapsulation (information hiding) is
supported and enforced by the system.  The only code that accesses the
representation of an object is the code that makes up that object's
concrete Edentype.  If an object's data structure is found to violate its
invariants then the code of only that object need be examined to find out
why.  If a change in use requires that a data structure be modified,
modifications are restricted to the code of the object that encapsulates
the data structure.
.Bp
Fourthly, objects are secure.  The system ensures that only through
possession of a capability can an object be accessed.  The system also
ensures that capabilities cannot be forged.  The access rights in a
capability enable us to provide fine-grained restrictions on access.
.Bp
Another consequence of our design is that Eden does not offer automatic
insulation from crashes.  A general-purpose atomic action system is not one
of the primitives that Eden provides.  An atomic checkpoint primitive 
.i is 
provided, whereby programmers who so desire can build robust and secure
applications.  This approach differs from that taken by, for example, the
Argus system [.Guardians Liskov.] and the Clouds [.Clouds.] system, where atomic
actions are among the basic building blocks provided at the system level.
In Eden, it is possible to experiment with different approaches to
providing transactions.
.sh 3 "The Provision of Substantial Programming Language Support"
.lp
The Eden Programming Language (EPL) is based on Concurrent Euclid, a
Pascal-like language that includes processes, modules and monitors.  EPL
provides direct support for two of the fundamental abstractions of Eden:
capabilities and invocation.  Capabilities are first-class citizens, even
to the extent of having source-language denotations.  Syntax exists both
for sending and for receiving invocations, thus making invocations as easy
to use as conventional procedure calls.  Invocations are type-checked in
such a way that data can never be misinterpreted.  Most type errors are
detected at compile time, but it still is possible to change the
implementation of the invokee dynamically.
.pp
We feel that EPL has made a key contribution to the ease of use of Eden.
The experience gained from EPL concerning the facilities that
programmers need when writing distributed applications has provided
guidance and motivation in the design of Emerald.
.sh 3 "The Design and Implementation of Distributed Applications"
.lp
The development of applications has been valuable in at least four
different ways:  helping to evaluate the suitability of the system, helping
to make Eden a 
.q complete
system, conducting research into the application
areas themselves, and providing insights into the programming of
distributed systems.  To consider a few examples:
.Bp
The Eden Mail System (Edmas), Eden's first application, was written largely
with the first objective in mind \- testing the support that the system
provides for programming distributed applications.  It was not the intention
to interconnect Edmas with other mail systems to provide a general mail
utility, nor was it the intention to study mail systems (although
considerably more has been learned about them than was anticipated).  Edmas
also taught us much about the uses to which the internal processes of Eden
objects can be put, and about the Eden object type structure.
.Bp
The Eden Shared Calendar System was written largely with the first and
fourth objectives in mind:  to evaluate further the Eden system's
hospitability, and to explore the construction of application-specific
transaction systems.
.Bp
The Eden Terminal Handler and the Eden Command Language Interpreter were
built primarily because they were necessary for the use of the system \-
the second objective.
.Bp
The Eden Translator has contributed to all four objectives.  For a long
time the Eden system was not 
.q self-hosting :  
Eden programmers worked in
the U\s-2NIX\s+2 environment on a single timeshared VAX.  As the programming effort
expanded, additional VAX/U\s-2NIX\s+2 machines were employed.  This presented both a
problem and an opportunity.  The problem:  consistent versions of a large
number of modules had to be maintained on multiple machines.  The
opportunity:  compilation could be accelerated by distributing the work of
a single compilation among multiple machines.  Making Eden self-hosting by
moving the EPL translator into Eden solves the problem (modules become Eden
objects, referenced in a location-independent manner) and capitalizes on
the opportunity (the pre-processor and compiler can be structured as a
collection of Eden objects running on multiple machines).
.lp
Almost without exception, we have learned more lessons, and more diverse
lessons, from building applications than we imagined when we began them.
There is no substitute for experimentation.  We now have four years of
experience concerning the facilities that programmers need when writing
distributed applications \- experience on which we intend to capitalize in
the proposed work.
.sh 3 "The Provision of a Research Tool"
.lp
The Eden project proposal, written in 1979, anticipated that the Eden
system would become a general facility for the department.  This belief was
naive, because building Eden involved research rather than development.
With the concurrence of a self-imposed External Review Committee, a
conscious decision was made to concentrate on the core research ideas
rather than on providing a stable base for research by 
.q "outside" 
users.  As a result, the current implementation of Eden is more a prototype
than a facility.  Nevertheless, the Eden system is used as a research tool
by three major groups. 
.Bp
First, the system is used in its own development.  The Eden Translator,
discussed above, is a key example.
.Bp
Second, the applications built by members of the project were motivated at
least in part by the desire to conduct research in the specific application
areas.
.Bp
Third, researchers in the department have found that the Eden system,
because of characteristics such as location independence and remote
procedure call, provides an excellent laboratory for certain experimental
studies.  
.lp
One example of use that falls into the last category is work on policies
for adaptive load sharing.  Experiments using Eden are providing an
important complement to modelling studies, confirming the basic analytic
results while exposing specific areas in which the models must be refined.
Other examples include development of interactive displays of measurement
data gathered to assess network performance, experimentation with a graphic
command language, and several explorations of transaction and replication
schemes.  Finally, it is appropriate to mention that the Eden kernel is
being used as a prototyping 
.q "breadboard" 
for the run-time system for the Emerald language that forms the subject of
this proposal.
.sh 2 "Eden Publications"
.lp
Publication from experimental research is slow because of the substantial
startup investment required by work of this sort.  Viewed in this light,
our publication record is significant:
.Bp
Papers describing various systems aspects of Eden have appeared in each of
the last three ACM Symposia on Operating Systems Principles \- each of the
last four if one counts a 1979 paper that grew out of the proposal writing
process.  The SOSP is by far the most prestigious conference in the field,
and is the forum at which a very high proportion of the key papers in
operating systems have been presented.  The most recent Eden SOSP paper,
.q "Supporting Distributed Applications:  Experience with Eden" 
(which will appear in 
.i "Proceedings of the 10th SOSP" ), 
along with 
.q "The Eden System: A Technical Review" , 
(which appears in \fIIEEE Transactions on Software Engineering\fR), 
are of special importance.
.Bp
Papers describing Eden applications have appeared
in or have been submitted to a range of journals and
conferences.
.Bp
Papers describing work that uses the Eden system
as a research tool are now beginning to appear.
.Bp
An adaptation of Henry Levy's Eden-supported M.S. thesis has become a
highly regarded monograph, \fICapability-Based Computer Systems\fR (Digital
Press, 1984).
.lp
In all, roughly twenty Eden-specific or closely Eden-related publications have
appeared or have been submitted, with several more nearing completion.  (By
Eden-specific, we mean a paper that describes some aspect of the Eden
system or its key applications.  By Eden-related, we mean a paper that
describes research that used the Eden system, or that was inspired by
issues raised by the Eden system.)  In addition, there have been roughly ten
technical reports that have not yet been published or submitted externally;
we are in the process of preparing some of these for publication.  (A
recent mailing describing Eden technical reports has already attracted
several hundred requests for copies.)
.tr *\(**  
.pp
In addition to the publications listed below, the theses from ten graduate
degrees acknowledge Eden support; another thirteen Eden-supported theses
are in preparation.  In the list, Eden-specific papers are denoted by * and
Eden-related papers by +.
.br
.ne 4
.lp
.i Published
.ip +
The Behavior of Ethernet-Like Computer Communications Networks.
Guy T. Almes and Edward D. Lazowska.
\fIProc. 7th ACM Symposium on Operating Systems Principles\fR
(December 1979).
.ip *
Eden:  Research in Integrated Distributed Computing.
Guy T. Almes and Edward D. Lazowska.
\fIProc. Workshop on Fundamental Issues in Distributed Computing\fR
(December 1980).
.ip *
The Architecture of the Eden System.
Edward D. Lazowska, Henry M. Levy, Guy T. Almes,
Michael J. Fischer, Robert Fowler, and Stephen C. Vestal.
\fIProc. 8th ACM Symposium on Operating Systems Principles\fR
(December 1981).
.ip *
Objects in the Eden System.
Guy Almes.
\fIElectro/82, No. 32:  Object Oriented Systems
and Languages\fR (May 1982).
.ip +
A History of Capability-Based Computer Systems.
Henry M. Levy.
\fIElectro/82, No. 32:  Object Oriented Systems
and Languages\fR (May 1982).
.ip *
The Eden Transaction-Based File System.
W.H. Jessop, J.D. Noe, D.M. Jacobson, J.-L. Baer, and
C. Pu.
\fIProceedings 2nd Symposium on Reliability in Distributed Software
and Database System\fR (July 1982).
.ip *
Integration and Distribution in the Eden System.
Guy Almes.
\fIProc. IEEE Workshop on Computer Systems Organization\fR
(March 1983).
.ip *
An Asymmetric Stream Communication System.
Andrew P. Black.
\fIProc. 9th ACM Symposium on Operating Systems Principles\fR
(October 1983).
.ip *
Edmas:  A Locally Distributed Mail System.
Guy Almes, Andrew Black, Carl Bunje, and Douglas Wiebe.
\fIProc. 7th International Conference on Software Engineering\fR
(March 1984).
.ip *
The Eden System:  A Technical Review.
Guy T. Almes, Andrew P. Black, Edward D. Lazowska, and
Jerre D. Noe.
\fIIEEE Trans. on Software Eng. SE-11,\fR1 (January 1985).
.ip *
On-the-Fly, Incremental, Consistent Reading of Entire Databases.
Calton Pu.  \fIProc. 11th International Conference on Very
Large Data Bases\fR (August 1985).
.ip * 
Supporting Distributed Applications:  Experience with Eden.
Andrew P. Black.
To appear, \fIProc. 10th ACM Symposium on Operating Systems Principles\fR
(December 1985).
.ip +
Adaptive Load Sharing in Homogeneous Distributed Systems.
Derek L. Eager, Edward D. Lazowska, and John Zahorjan.
To appear, \fIIEEE Transactions on Software Engineering\fR
(December 1985).
.ip +
File Access Performance of Diskless Workstations.
Edward D. Lazowska, John Zahorjan, David R. Cheriton,
and Willy Zwaenepoel.
To appear, \fIACM Transactions on Computer Systems\fR.
.ip +
A Comparison of Receiver-Initiated and Sender-Initiated
Adaptive Load Sharing.
Derek L. Eager, Edward D. Lazowska, and John Zahorjan.
To appear, \fIPerformance Evaluation 6,\fR2 (Spring 1986).
.ip *
Regeneration of Replicated Objects:  A Technique and its Eden
Implementation.
Calton Pu, Jerre D. Noe, and Andrew B. Proudfoot.
To appear, \fIProc. 2nd IEEE International Conference on Data
Engineering\fR (February 1986).
.lp
.i Submitted
.ip *
Edmas:  An Object-Oriented, Locally Distributed Mail System.
Guy Almes and Cara Holman.  Submitted
to \fIIEEE Transactions on Software Engineering\fR. 
.ip *
The Eden Shared Calendar System.  Guy Almes and Cara Holman.  Submitted to 
.i "5th IEEE Symp. on Reliability in Distributed Software and Database Systems" .
.ip +
Proving Monitor Proof Rules.  Leif S. Nielsen and Andrew P. Black.
Submitted to 
.i "Acta Informatica" .
.ip *
A Classification of Distributed Operating Systems.  Eric Jul.  Submitted to
.i "6th IEEE Conf on Distributed Computing Systems" .
.ip *
Replication in Distributed Systems: The Eden Experience.  Jerre D. Noe, 
Andrew B. Proudfoot and Calton Pu.  Submitted to
.i "6th IEEE Conf on Distributed Computing Systems" .
.lp
\fIIn Preparation\fR
.ip *
The Eden Programming Language.  Andrew P. Black.
.ip *
Nested Transactions for General Objects:  The Eden Implementation.
Calton Pu and Jerre Noe.
.ip *
The Eden Translator: A Locally Distributed Compilation System for the Eden
Programming Language.  Andrew P. Black, Richard Korry and Rajendra K. Raj.
.ds o> \v'-0.3n'\z\s-7\(ci\s+7\v'0.3n'\s+2\fR>\fP\s-2
.\" the conforms symbol is generated by \*(o>
.sh 1 "Project Description"
.sh 2 "Emerald Project Overview"
.lp
The Emerald project began two years ago as a result of our experience with
the Eden distributed system [. Eden  Almes Noe Technical Review .].  There
were two aspects of Eden on which we wished to capitalize:  language
support for distributed programming and the use of the object model for
building distributed applications.  On the other hand, Eden suffered from
serious performance problems, mainly due to its implementation but partly
inherent in its architecture; these we wished to remedy.
.pp
Our principal goal was to build a system that
simplified the programming of distributed applications.  
In addition, we wished to build a compiler that could
produce efficient objects, and a run-time kernel
that allowed both data and process objects to freely
move around the network.  Most
important was to provide an efficient implementation to
demonstrate that we can achieve
performance competitive with (1) standard procedural
languages in the local case, and (2) standard
remote procedure call systems in the remote case.
To do this, we needed to rely on a new language that
provided semantic support for objects and distribution,
and a highly integrated compiler and operating system.
.pp
The results of this effort are the Emerald Language, its
compiler, and the underlying run-time kernel.  Progress
during the past year has been substantial.  In August,
Digital Equipment Corporation donated five MicroVAX II
workstations for our use.   A prototype Emerald
system has been constructed and is now
operating on a small network of these machines.
We believe that this system, which has been
implemented by graduate students
Norman Hutchinson and Eric Jul,  has a number of novel
features.  Two papers on the Emerald system have been
written and accepted for publication:  one will appear
in \fIIEEE Transactions 
on Software Engineering\fR [. Emerald Carter IEEETSE .], and one in
\fIProceedings of the ACM Conference on Object-Oriented Systems, Languages
and Applications\fR [. Emerald Object Structure .].   We 
expect Hutchinson and Jul to
complete their PhDs in the next six months.  Norm Hutchinson's
thesis involves the design of the language and type system;
he has accepted a faculty position at the University of
Arizona.  Eric Jul's thesis involves mobility and 
distribution;  he is expecting to receive a faculty position
at the University of Copenhagen in Denmark.
.pp
While substantial progress has been made without direct funding from
NSF, we are asking for foundation support to
continue with this work:  to complete and iterate the design of
the language, compiler, and run-time system, to properly measure
and evaluate the system, to implement and test applications,
and to extend the system to meet new requirements (such as
multi-processors).  
.pp
The Emerald system can be described at many different levels.
The bulk of this proposal concentrates on some of the interesting
features of Emerald: its type system, its unqiue object/type
creation mechanism, its support for multiple
implementation mechanisms, and its distribution and mobility support. 
The objective is to give the reader a feeling for the language and
its implementation.  The
final section discusses current status and presents a small sample of
newly-collected performance data.
.sh 2 "Introduction"
.lp
Distributed systems are inherently more complex to program than
non-distributed systems.
In an effort to reduce this complexity,
much recent work has focused on tools that assist in
the construction and programming of
distributed systems and applications.  Examples include 
message-based operating
systems such as Accent [.Rashid 8th SOSP.] 
and V [.Cheriton IEEE V Kernel.], remote procedure
call facilities such as Xerox RPC [.Birrell Nelson.], and 
languages such as Argus [.Liskov  POPL9 .] and
the Eden Programming Language (EPL) [.Black 1985 EPL.].  
.pp
These three approaches to distribution represent a succession of abstractions.
Message-based
systems require the programmer to deal with the details of locating message
targets,
packaging messages, and with asynchronous
communication.
Remote procedure call hides the details of packaging
and process control and
presents the programmer with a standard procedure call paradigm;  however
the programmer is responsible for locating the target of the call.
Object-based languages such as Argus and EPL provide location-independent 
invocation of distributed objects;  location is implicit. 
As one moves along this spectrum from message-based systems to distributed
languages, flexibility and control are traded for simplicity and ease
of programming.
.pp
We have designed and are prototyping an object-based language called
\fIEmerald\fR whose goal is to simplify distributed programming through
language support while also providing acceptable performance and
flexibility, both locally and in the distributed environment.  
The notion of object is fundamental
to Emerald.  We believe that objects are an
excellent way to structure a distributed system because they encapsulate
the concepts of process, procedure, data, and location.  
In Emerald, objects are the
units of programming and  distribution, and the entities between
which communication takes place.   However, we do not
believe that all aspects of distribution should be hidden from the
programmer, and therefore
the Emerald language has explicit notions of location and
mobility.
.pp
In the following sections we describe Emerald objects and the Emerald type
system.  Emerald is strongly typed and has been carefully designed so that
types may be resolved statically (i.e., at compile time).  
Static
typing permits the most efficient code to be generated, at some loss in
flexibility.  If this cost is significant, the programmer can explicitly
delay type checking until run time.  This facility might be used,
for example, when invoking an unknown object obtained from a file service.
.sh 2 "Emerald Objects"
.lp
All entities in the Emerald system are objects.  This includes
small entities, such as Booleans and integers, and large entities, such
as directories and compilers.  While different objects may be implemented
with different techniques, all objects exhibit uniform semantics.
An object can be manipulated only
through invocation; no external access to an object's
data is permitted.   Objects can be invoked remotely and can move
from node to node.
.pp
Each Emerald object has four components:
.ip "1."
A  \fIname\fR, which uniquely
identifies the object within the network. 
.ip "2."
A \fIrepresentation\fR, which consists of the data stored in the
object.  The representation of a programmer-defined object
is composed of a collection of
references to other objects.
.ip "3."
A set of \fIoperations\fR, which define the functions and procedures
that the object can execute.  Some operations are exported and may be invoked by other
objects, while others may be private to the object.
.ip "4."
An optional \fIprocess\fR, which operates in parallel with invocations of
the object's operations.  An object with a process has an active existence
and executes independently of other objects.  An object without a process
is a passive data object and executes only as a result of invocations.
.lp
An Emerald object also has several
attributes.  An object has a \fIlocation\fR that specifies the node
on which that object is currently resident.
Emerald objects can 
be defined to be \fIimmutable\fR;  this simplifies sharing
in a distributed system, since immutable objects can be freely copied.
Immutability is an assertion on the part of the programmer
that the abstract state of an object does not change;
it is not a
concrete property and the system does not attempt to check it.
.pp
Emerald supports concurrency both between objects and within an object.
Within the network many objects can execute concurrently.  Within a single
object, several operation invocations can be in progress simultaneously,
and these can execute in parallel with the object's internal process.  To
control access to variables shared by different operations, the shared
variables and the operations manipulating them can be defined within a
monitor [. Hoare Monitors, Brinch Hansen Concurrent Pascal Definition .].
Processes synchronize through builtin condition objects.  An object's
process executes outside of the monitor, but can invoke monitored
operations should it need access to shared state.
.pp
Each object has an optional \fIinitially\fR section \- a 
parameterless operation that executes 
exactly once when the object is created and is used
to initialize the object state.
When the initially operation is
complete, the object's process is started and invocations can be
accepted.
.sh 2 "Abstract Types"
.lp
Central to Emerald is the concept of \fIabstract type\fR.
An
abstract type defines a collection of 
.i "operation signatures" , 
that is, operation names and the types of
their arguments and results.
All identifiers
in Emerald are typed: the programmer must declare
the abstract type of the objects that an identifier may name.
An abstract type is represented by
an Emerald object that specifies such a list of signatures.
For example, if the variable MyMailbox is declared as:
.(p
.sz -1
\*(srvar\*(er MyMailbox : AbstractMailbox
.sz +1
.)p
then any object that is assigned to MyMailbox must implement 
(at least) the 
operations defined by AbstractMailbox.
.pp
We say that
the abstract type of the object being assigned must \fIconform\fR to
the abstract type of the identifier.  Conformity is the basis of type
checking in Emerald.
Informally, a type 
.i S 
conforms to a type 
.i T
(written 
.i S
\*(o> 
.i T ) 
if:
.ip "1."
.i S 
provides at least the operations of 
.i T 
(\c
.i S 
may have more operations).
.ip "2."
For each operation in 
.i T ,
the corresponding operation in 
.i S
has the same number of arguments and results.
.ip "3."
The abstract types of the results of 
.i S 's 
operations conform to the abstract types of the results of 
.i T 's 
operations.
.ip "4."    
The abstract types of the arguments of 
.i T 's 
operations conform to the abstract types of the arguments of 
.i S 's 
operations (i.e., arguments must conform in the opposite direction).
.lp
Conformity is defined formally in  [. Emerald 86-02-04 .];  it is
similar to type compatibility in Owl [.Owl Reference.].  
.pp
The relationship between abstract types and object implementations is 
many-to-one in both directions.  A single object may 
conform to many abstract types, and an 
abstract type may be implemented by many different objects.
Although Emerald requires that the abstract type of
each identifier be manifest, the type of the object that is to be
assigned to an identifier may not be known until run time.  In such a case,
the conformity check will be performed at run time.  However, very often
enough information will be available at compile time for conformity to
be checked statically.
.pp
It is important to note the difference between type conformity
in Emerald and subclasses in Smalltalk [.Goldberg Smalltalk Language .].  
In Emerald, the relationship between
an object and the abstract type(s) that it implements is one of
shared \fIinterface\fR.
An object supports a superset
of the operations defined by its abstract types and
each of the supported operations must conform to the corresponding operations
in the abstract types.
In Smalltalk, the relationship between a subclass and its superclass is one
of shared \fIimplementation\fR.  A subclass is free to redefine the
signatures of the messages
that it receives, but it necessarily shares the superclass's representation
(instance variables) and typically shares many 
methods as well.
.pp
We expect that Emerald's strong typing will have several benefits.
First is
early detection and notification of programming errors.  In Smalltalk,
errors of the 
.q "message not understood" 
variety can be generated only at
run time.  We would like to detect many such errors through compile
time type checking.  In cases where we cannot
completely type check an assignment at compile time, our run-time
messages can be more explicit, e.g., 
.q "object Q does not conform to abstract type P\^" .  
The second benefit is increased performance.  In most cases, compile time
conformity checks permit us to do assignment and invocation without run
time type checking.  In some cases a run time check is required;  however,
the check is made on assignment, and once it succeeds subsequent
invocations can execute without further checking.  Finally, in many cases
compile time type information allows us to generate very efficient
invocation code.  This is described in more detail in Section 7.
.sh 2 "Object Creation"
.lp
As described above, an identifier in Emerald programs has an abstract
type, \c
.(p Z
.sz -1
\*(srconst\*(er myDirectory == \*(srobject\*(er oneEntryDirectory
    \*(srexport\*(er Store, Lookup
    \*(srmonitor\*(er 
        \*(srvar\*(er name : String
        \*(srvar\*(er AnObject : Any

        \*(sroperation\*(er Store [ n : String, o : Any\|]
            name \(<- n
            AnObject \(<- o
        \*(srend\*(er Store

        \*(srfunction\*(er Lookup\|[ n : String ] \(-> [ o : Any\|]
            \*(srif\*(er n = name 
                \*(srthen\*(er o \(<- AnObject
                \*(srelse\*(er o \(<- \*(srnil\*(er
            \*(srend\*(er \*(srif\*(er
        \*(srend\*(er Lookup

        \*(srinitially\*(er
            name \(<- \*(srnil\*(er
            AnObject \(<- \*(srnil\*(er
        \*(srend\*(er \*(srinitially\*(er

    \*(srend\*(er \*(srmonitor\*(er
\*(srend\*(er oneEntryDirectory
.in -8
.sz +1
.sp 1
.ce 1
Figure 5.1: A oneEntryDirectory Object
.)p
and an object must conform to that abstract type to be named by the
identifier.  However, Emerald objects
do not require a Class object for their creation.
In most object-based systems, the programmer first specifies a class
object that defines the structure and behavior of all its 
.i instances .
The class object also responds to \fInew\fR invocations to make new
instances.
.(p Z
.sz -1
.nm 1 4 1 0
\*(srconst\*(er myDirectoryCreator ==
\*(srimmutable\*(er \*(srobject\*(er oneEntryDirectoryCreator
    \*(srexport\*(er Empty

    \*(srconst\*(er OED == \*(srtype\*(er OED
        \*(sroperation\*(er Store [ String, Any ]
        \*(srfunction\*(er Lookup [ String ] \(-> [ Any ]
    \*(srend\*(er OED

    \*(sroperation\*(er Empty \(-> [ result : OED ]
     result \(<- \*(srobject\*(er oneEntryDirectory
        \*(srexport\*(er Store, Lookup

        \*(srmonitor\*(er 
            \*(srvar\*(er name : String
            \*(srvar\*(er AnObject : Any

            \*(sroperation\*(er Store [ n : String, o : Any ]
                name \(<- n
                AnObject \(<- o
            \*(srend\*(er Store

            \*(srfunction\*(er Lookup [ n : String ] \(-> [ o : Any ]
                \*(srif\*(er n = name 
                    \*(srthen\*(er o \(<- AnObject
                    \*(srelse\*(er o \(<- \*(srnil\*(er
                \*(srend\*(er \*(srif\*(er
            \*(srend\*(er Lookup

            \*(srinitially\*(er
                name \(<- \*(srnil\*(er
                AnObject \(<- \*(srnil\*(er
            \*(srend\*(er \*(srinitially\*(er

        \*(srend\*(er \*(srmonitor\*(er
      \*(srend\*(er oneEntryDirectory
    \*(srend\*(er Empty
\*(srend\*(er oneEntryDirectoryCreator
.sz +1
.nm
.sp
.ce 2
Figure 5.2: A oneEntryDirectory Creator
.)p
.pp
In contrast, an Emerald object is created by executing an 
.i "object constructor" .  
An object constructor is an Emerald expression that defines the
representation, the operations, and the 
process of an object.  For example, suppose
the Emerald program in Figure 5.1 is executed.
This results in the creation of a single object.  If we wished to create
more 
.pf oneEntryDirectories
we would embed the object constructor of Figure 5.1
in a context in which it might
be repeatedly executed, such as the body of a loop or operation.  This is
illustrated in Figure 5.2.  In this example, we construct the single
object specified by the outermost object constructor.  That object exports
an operation called 
.pf Empty ; 
invoking the
.pf Empty
operation executes the object constructor on lines 9 to 29, creating a new
object that conforms to abstract type OED\(dg.
.(f
\(dg In order to declare 
.pf Empty ,
it is also necessary to declare a new abstract type 
.pf OED . 
This is avoided in a language like Russell [. Russell 1980 .] by making
the compiler infer the types of operation results.
.)f
Conceptually, each object so
created possesses its own copy of the code for
.pf Store
and
.pf Lookup ,
as in SW2 [. SIGPLAN Laff .].
.\" CHECK THIS
In practice, there will be at most a single copy of the code on each node,
and that copy will be shared.
.pp
The notion of object creator can be extended to as many levels as the
programmer requires.  For example, consider the builtin object 
.pf Array .
Array exports an
.pf of
operation that expects an 
.ne 4
abstract type argument, as in
.(p
.sz -1
Array.of\^[Integer]     .
.sz +1
.)p
The result of this invocation is an object that exports an operation
.pf Create
of zero arguments.  When
.ne 4
.pf Create
is invoked, as in
.(p
.sz -1
Array.of\^[Integer].Create
.sz +1
.)p
the result is an array object, i.e., an object that exports operations like
.pf setElement ,
.pf getElement ,
and
.pf upperbound .
.pp
In a similar way, one could define a 
typed OneEntryDirectory creator creator 
that is parameterized by the type of the directory entry as
shown in Figure 5.3.
.(p Z
.sz -1
.nm 1 4 1 0
\*(srconst\*(er myTypedDirectoryCreatorCreator ==
\*(srimmutable\*(er \*(srobject\*(er typedDirectoryCreatorCreator
  \*(srexport\*(er of

  \*(srfunction\*(er of [ ElementType : AbstractType ] \(-> 
    [ result : DirectoryCreatorType]
      \*(srwhere\*(er
        OED == \*(srtype\*(er OED
          \*(sroperation\*(er Store [ String, ElementType ]
          \*(srfunction\*(er Lookup [ String ] \(-> [ ElementType ]
        \*(srend\*(er OED
        DirectoryCreatorType == \*(srtype\*(er T
          \*(sroperation\*(er Empty \(-> [ result : OED ] 
        \*(srend\*(er T
      \*(srend\*(er \*(srwhere\*(er

    result \(<- \*(srobject\*(er typedDirectoryCreator
      \*(srexport\*(er empty

      \*(sroperation\*(er Empty \(-> [ result : OED ]
        result \(<- \*(srobject\*(er oneEntryDirectory
          \*(srexport\*(er Store, Lookup
                .
                .
                .
        \*(srend\*(er oneEntryDirectory
      \*(srend\*(er Empty
    \*(srend\*(er typedDirectoryCreator
  \*(srend\*(er of
\*(srend\*(er typedDirectoryCreatorCreator
.nm
.sz +1
.sp
.ce 1
Figure 5.3: A typed Directory Creator Creator
.)p
.br
.ne 5
.sh 2 "Abstract Types as Objects"
.lp
Abstract types are objects that obey a particular invocation protocol: they
export an operation (without arguments) called
.pf getSignature
that returns a 
.pf Signature.
In other words, an abstract type is an object that conforms to the
following abstract type:
.(p
.sz -1
\*(srimmutable\*(er \*(srtype\*(er abstractType
    \*(srfunction\*(er getSignature \(-> [ Signature ]
\*(srend\*(er abstractType
.sz +1
.)p
Conversely, any object that conforms to the above type may be treated as an
abstract type.  For example, if we add the following function definition to
Figure 5.2, 
.(p
.sz -1
\*(srfunction\*(er getSignature \(-> [ result : Signature ]
    result \(<- OED
\*(srend\*(er getSignature
.sz +1
.)p
we may use 
.pf oneEntryDirectoryCreator 
as an abstract type.
.ne 5
We may now write
.(p
.sz -1
\*(srvar\*(er aDir: myDirectoryCreator
aDir \(<- myDirectoryCreator.Empty
.sz +1
.)p
rather than
.(p
.sz -1
\*(srvar\*(er aDir : AbstractDirectory
aDir \(<- myDirectoryCreator.Empty
.sz +1
.)p
Given the dual role of 
.pf myDirectoryCreator ,
we see that it may have been appropriate to give it a less descriptive name.
Similarly, we may define the primitive object
.pf Array
such that the object returned by the
.pf of
operation may be used as an abstract type\(dd.
.(f
\(dd We previously
stated that the abstract type of every identifier in Emerald
must be manifest.
The expression
.pf "Array.of[Integer]"
is manifest since the target (\c
.pf "Array" )
is immutable, the operation (\c
.pf "of\^" )
is a function, and the argument (\c
.pf Integer )
is immutable.
The expression can therefore be evaluated by the compiler.
.)f
This allows us to write
.(p
.sz -1
\*(srvar\*(er a: Array.of\^[Integer]
a \(<- Array.of\^[Integer].Create
.sz +1
.)p
.sh 2 "Supporting Multiple Implementations"
.lp
The most important goal of the Emerald design is the support of
a uniform object model.  The semantics of all objects, whether large
or small, local or distributed, should be independent
of the implementation technique.   This uniformity
should hold both for the programmer who builds objects and types, and for
the application that invokes them.
.pp
The best example of a system with a uniform object model is Smalltalk.  One
characteristic that makes this possible is that Smalltalk is not
distributed.  In a distributed environment, the different implementation
techniques that must be used for local and remote invocation often lead to
the use of different abstractions for local and remote objects.  For
example, in the MIT Argus system [.Liskov Memo 40.], there are two
different entities:  Argus Guardians [. Liskov guardians actions .], which
represent the abstraction of a node, and CLU Clusters [. Liskov 1977
Schaffert CLU Abstraction .], which represent local objects contained
inside Guardians.  In the Eden Programming Language [.Black 1985 EPL.], used
to build applications on the Eden system [. Almes Black Eden 1985 .],
large network-wide
entities are written as Eden objects, while local entities are defined
using Concurrent Euclid data structures [.Holt 1983.].
.pp
The problem with the two model approach is that the programmer must decide
which model to use.  Because the two models are semantically distinct, once
an object is implemented in one style it must be rewritten for use as
the other.  Or, one model may be more appropriate for a particular
object, but differences in semantics may force the use of
another model.  
For example, if we build an Eden tree object in EPL
and later need a tree for internal use within 
another object, 
we must either design and code a different tree, or suffer the
inefficiencies of the more general implementation.   
A similar issue has been noted by users
of Argus;  while 
programming a Collaborative Editing System in Argus,
Greif, Seliger, and Weihl [.Greif Collaborative.]
observed that a designer can be forced to use a Guardian 
where a cluster may be more appropriate.  This was due to the fact
that Argus Guardians have processes while local CLU objects do not.
.pp
In Emerald, all objects are coded using the single object definition
mechanism.  At compile time, the Emerald compiler chooses
among several implementation styles for the object, picking one that is 
appropriate to the object's use. Different implementations tradeoff
representation efficiency and 
invocation overhead for generality.  Three different
implementation styles are used.
.ip "1."
\fIGlobal objects\fR are those that can be moved within the
network and can be invoked by other objects not known at compile time
(in other words, references to them can
be exported).  These objects are heap
allocated by the Emerald kernel and are referenced indirectly.  An
invocation may require a remote procedure call.
.ip "2."
\fILocal objects\fR are local to another object (i.e., a reference to them
is never exported from that object).  They are heap allocated by compiled
code.  These objects never move independently of their enclosing object. 
An invocation may be implemented by a local procedure call or by
inline code.
.ip "3."
\fIDirect objects\fR are local objects except that their data area is
allocated directly in the representation of the enclosing 
object.  These are used
mainly for builtin types, structures of builtin types, records,
and other simple
objects whose organization can be deduced at compile time.
.pp
Thus, Emerald is similar to
EPL and Argus, in that there are several different implementation styles
with
varying performance characteristics.  However, unlike these languages, the
implementation differences are hidden from 
the programmer.  The compiler chooses the best implementation
based on compile time information.  In many cases, the compiler can
determine the implementation of local objects and can use this information
for further optimizations.  If the compiler knows only
the abstract type then it must assume the more general object invocation
mechanism.
.sh 2 "Distribution Support"
.lp
Emerald is designed for the construction of distributed applications.  As
previously stated, we believe that objects are an excellent way of
structuring such programs because they provide the units of processing and
distribution.  This belief has been confirmed by our experience with
distributed applications in Eden [. mail holman 1984, holman calendar,
edmas wiebe 1984, black 1985 Experience Eden .].
.pp
The tendency of many distributed systems is to hide distribution from the
programmer.  For example, in Xerox RPC [. birrell & nelson .], remote procedure
calls were added to Cedar Mesa.  In so far as it was possible, 
remote procedure calls were designed to be
semantically identical to local procedure calls. This
is obviously a desirable property and is what makes RPC so attractive;
programs can be written and debugged on a single node using local procedures
and then easily distributed.
.pp
Emerald supports the same notion with object invocation.  All objects are
manipulated through invocation, and all invocations are location
independent;  it is the responsibility of the run-time system to locate and
transfer control to the target object.  Remote invocation achieves the same
benefits as remote procedure call.
.pp
While it is crucial that invocation be location independent, it is not
necessary that an object's location be invisible.  Many applications may
choose to ignore distribution, but others may wish to benefit
from location dependence.  For
example, a replication manager may wish to distribute object replicas on
different nodes, or two applications may wish to be co-located during
periods of high activity.  Applications that are concerned with distribution
may wish to discover and modify objects' locations, but they still benefit
from location-independent invocation.
.pp
For these reasons, the Emerald language includes a small
number of location primitives.  Basic to these primitives are node
objects, which are the logical location entities in the system.  A node is
an abstraction of
the concept of a physical machine, but it is possible for
several node objects to exist on a single machine. (In fact, in our current
implementation, 
a node is really an address space in which objects are contained.)
An object can:
.ip "1."
\fILocate\fR another object, i.e., determine on what node it resides.
.ip "2."
\fIFix\fR another object at a particular node.
.ip "3."
\fIUnfix\fR an object, i.e., make it movable following a \fIfix\fR.
.ip "4."
\fIMove\fR an object to another location.  
.lp
In all cases, location is specified through a reference to a target object;
the location thus described is the node on which the target
currently exists.   The target can be an explicit node object, or
any other object.
.pp
The choice of parameter passing semantics is crucial to both remote
procedure call  and object invocation.  In an object-based system, the
obvious choice is call-by-object-reference.  Since the value of a variable
is a reference to an object, it is that reference (the object name) that is
passed in an invocation.  This presents a potentially serious performance
problem on distributed systems;  any invocation by a remotely invoked
object of its parameters is likely to cause another remote invocation.  For
this reason, systems such as Argus have required that parameters to remote
calls be passed by value, not by reference [. Herlihy Value transmission .].
.pp
Because Emerald objects are mobile, it may be possible to avoid many remote
references by moving parameter objects to the site of the callee. Whether
or not this is worthwhile depends on the size of the parameter object, the
number of active invocations, and the number of invocations to be issued by
the called object.  We expect that parameter objects will be moved in two
cases.  First, based on compile-time information, the Emerald
compiler may decide to move an object along with an invocation.  For
example, small immutable objects may be copied cheaply and are obvious candidates.
Second, the programmer may decide that an object should be moved based
on knowledge about the application.  To make this possible, Emerald supports
a parameter passing mode that we call \fIcall-by-move\fR.  A call-by-move
parameter is passed by reference, as is any other parameter, but at the
time of the call it is relocated to the destination site.  Following the
call it is returned, unless it is a copy of an immutable object, in which
case it is garbage collected.
.pp
Call-by-move is a convenience and a
performance optimization.  The move could be done
explicitly with the \fImove\fR
primitive, but that would require more explicit code 
and would not allow packaging of
parameter objects in the same message as the invocation.  While call-by-move
co-locates the parameter with the target object, it increases the cost
of the call and may cause extra remote references from the call's
initiator.   One of our goals is therefore
to experiment with various policies for using this parameter passing
mechanism.
.sh 2 "Implementation Aspects"
.lp
The Emerald system is being prototyped on a small network of
DEC MicroVAX II workstations connected by a ten Megabit/s
Ethernet.  The system
runs on top of  ULTRIX\(dg
(DEC's version of Berkeley U\s-2NIX\s+2\(dd 4.2 bsd).
.(f
.lp
.sz -1
\(dg ULTRIX is a trademark of Digital Equipment Corporation.
.sz +1
.)f
.(f
.lp
.sz -1
\(dd U\s-2NIX\s+2 is a trademark of AT&T Bell Laboratories.
.sz +1
.)f
Using U\s+2NIX\s-2 has some performance
consequences, particularly in inter-machine communication; however,
it has little impact for Emerald on performance within a node, as our later
performance measurements show.
.pp
Emerald is implemented in two 
closely related parts, the Emerald compiler and the Emerald kernel.
An Emerald node is a single U\s-2NIX\s+2 address space in which
the kernel and all objects located on that node execute.  Processes within
objects are
lightweight for fast context switching and invocation.  Processes
and monitors are implemented as in Concurrent Pascal [.Brinch Hansen Black
Book .].
Protection is provided by the compiler, as in Xerox Mesa/Pilot [. Pilot .].   
.pp
As previously described, objects can be implemented in several ways.
Direct objects are supported directly (\c
.q "inline" ) 
within other objects and are invisible to the kernel.  Other objects are
created by kernel calls and supported by kernel data structures.
.pp
To support remote referencing and mobility, object references must be
location independent.  Since direct objects are compiled inline
or allocated directly in invocation records, they can be
referenced by offset within
the object or data structure.  All other objects are referenced by the
address of a node-local \fIobject descriptor\fR.  The object descriptor
contains the object's unique ID, a location hint if the object is
remote, and a pointer to its data area, process, and
code if the object is locally resident.
An object descriptor must exist on a node as long as any references
to the corresponding object remain on that node.  Object descriptors are 
heap allocated by the kernel and garbage collected.
.pp
Each node also has an \fIobject table\fR that contains an entry for
every remotely referable
object on that node.  The object table is used to determine if an
object exists on a node, and if so to provide the address of its object
descriptor.  
.pp
Because an object reference is the address of an object descriptor,
references are machine-dependent and must be translated when an object
moves.  When the kernel moves an object, it sends along a mapping of object
descriptor addresses to object IDs.  On the receiving node, new object
descriptors are allocated as needed and the object references are modified
to point to them.  On the sending node, the object descriptor for a moved
object is modified to indicate the object's new location.
The location is treated as a hint;  we are using a location
protocol based on forwarding addresses [. Fowler 1985 dissertation .]
supplemented by a reliable broadcast that is used when forwarding
addresses are lost (due to crashes).
.pp
To help the kernel in finding references that need to be translated, the
compiler generates \fItemplates\fR that describe the structure of each
object.  Code and templates are stored in kernel structures called
.i "concrete types" .
One concrete 
type exists for each object constructor.
They are immutable, and copies of them may exist on many nodes.  When 
an object is moved to another node, the concrete type is not sent along;
it is requested by the target node only if needed. 
.pp
Locating the code for an invoked operation is simplified by the Emerald type system.
The abstract type of a variable specifies the operations that can be performed
on the object it names.
At run time, the variable references an object with
a specific concrete type.  Even though the object may have more operations
than the abstract type, the additional operations cannot be invoked.
.pp
The data structure used to locate operations is called an Abstract-Concrete
vector.  We associate with each variable a vector with one 
entry for each operation defined by its abstract type.  The contents of 
the entry is the address of the corresponding procedure 
entry point in the concrete type.  On invocation, a simple indexing 
operation produces the address of the procedure to call.  
.pp
When an assignment is made, the vector may have to be changed if the new
object is implemented by a different concrete type.  The compiler 
generates code to perform this change if it cannot
tell the concrete type of the object to be assigned.  Note that an
Abstract-Concrete vector must exist for every pair <abstract type,
concrete type>, but these vectors can be shared by all variables
(on the same node)
that have the same abstract/concrete binding.
.(p Z
.nm 1 4 1 0
.sz -1
\*(srconst\*(er inCoreFile == \*(srobject\*(er inCoreFile
    \*(srexport\*(er Read, Seek, Write
    \*(srmonitor\*(er 
        \*(srconst\*(er maximumSize == 200
        \*(srconst\*(er CharacterVector == Vector.of[Character]
        \*(srvar\*(er contents : CharacterVector
        \*(srvar\*(er position : Integer

        \*(sroperation\*(er Read \(-> [ c : Character ]
            \*(srif\*(er position <= contents.upperbound \*(srthen\*(er
                c \(<- contents.getElement[ position ]
                position \(<- position + 1
            \*(srelse\*(er
                c \(<- \*(srnil\*(er
            \*(srend\*(er \*(srif\*(er
        \*(srend\*(er Read

        \*(sroperation\*(er Seek [ p : Integer ]
            position \(<- p
        \*(srend\*(er Seek
        
        \*(sroperation\*(er Write [ c : Character ]
            \*(srassert\*(er position <= contents.upperbound
            contents.setElement[ position, c ]
            position \(<- position + 1
        \*(srend\*(er Write

        \*(srinitially\*(er
            contents \(<- CharacterVector.create[maximumSize]
            position \(<- 0
        \*(srend\*(er \*(srinitially\*(er
    \*(srend\*(er \*(srmonitor\*(er
\*(srend\*(er inCoreFile
.nm
.sp 1
.ce 1
Figure \n($1.1: An inCoreFile Object
.)p
.pp
As an example,
Figure 9.1 shows the Emerald code for a simplified file object that
supports three operations: \fIRead\fR, \fISeek\fR, and \fIWrite\fR.
The representation of this object will contain two variables, one
an Integer and one a Vector (an array that can grow at either end).
Figure 9.2 shows the storage layout for an instance of this
simplified file object. 
On the left of the figure are a reference to the inCoreFile object
and the Object Table.
The inCoreFile reference contains
pointers to the object descriptor and an operation vector.
The inCoreFile's object
descriptor points to its data area.  Inside of the data area are its
two variables:
.i "contents",
a reference to a vector object, 
and 
.i "position",
a reference to an integer object (lines 6 and 7).
The vector object has been heap allocated and is referenced by its
heap address.  The integer object has been allocated directly in
the inCoreFile's data area.  In this case, because both objects are local
and both implementations are known at compile
time, the compiler does not generate an operation vector or procedure
calls;
instead, it generates in-line machine instructions to execute
these objects' operations.
For example, 
the addition and assignment in line 11 of
Figure 9.1 reduces to a single VAX increment instruction, while
the
.i getElement
invocation on line 10 produces in-line instructions to
perform the bounds check and move.
Objects that may be referenced remotely are also heap allocated
but would be referenced indirectly through an object descriptor,
as noted above.
.(z
.GS C
width 6.0
height 4.0
3 9
2 7
file inCore.gr.vax
.GE
.sp 0.5
.ce
Figure \n($1.2.  Storage layout for inCoreFile
.sp 0.5
.)z
.sh 2 "Current Status and Performance"
.lp
As noted in the previous section, our prototype
runs on a small
local area network of DEC MicroVAX II computers.
The Emerald compiler and run-time system are currently able to support the
creation and invocation of Emerald objects on a single processor or across
the network.  We are currently working on the implementation of object
mobility and distributed garbage collection.  To illustrate
the performance of the existing implementation, timings of some
local operations from the object defined in Figure 9.1
are listed in Table \n($1.1.  ******* Timings of the Pascal array
subscripting operation and local procedure call on the same machine are
also given.**********
The implementation of remote
invocations is not yet at a stage where performance figures are meaningful.
.(b
.sp
.TS
center,box,tab(:);
l | l | c.
Example:Implementation:time (\s-1\(*m\s+1s)
_
.T&
lp-1fI | lp-1 | np-1.
position \(<- position \fR+ 1\fP : inline call : 1.5
c \(<- contents.getElement\^\fR[\fPposition\^\fR]\fP : inline call : 6.3
inCoreFile.Seek\^\fR[0]\fP : potentially remote call : 20.8
.TE
.sp 0.8
.ce
Table \n($1.1.  Performance of local operations
.)b
.sh 2 "Proposed Research"
.lp
The objective of our research is to demonstrate the feasibility
and benefits of using a single object model for the construction
of both sequential and distributed programs.  We also wish to
show that an efficient distributed object based system can be
constructed.  This project is ambitious in that it requires
the design of a new language, as well as the construction of
a compiler and a distributed 
run-time kernel system.  However, we believe that
our operational prototype demonstrates our ability to carry out 
this work, and our published papers demonstrate our ability
to publicize our results.  For a small, unfunded project, we believe
our accomplishments to date have been substantial.
.pp
We are requesting NSF funds to continue with this research.  There
is still much to be done to verify our approach.  First, we
must complete the current prototype.  Following prototype completion,
we intend to implement several distributed applications, including
a distributed mail system.  Using these applications, we will
spend substantial time instrumenting and measuring our system to
learn as much as possible about the dynamic behavior of Emerald
objects.  An important aspect with which we expect to experiment
is the use of object mobility.  After the measurement phase is
complete, we expect to reevaluate the system design and implementation
in light of those measurements.  
.pp
Another area of interest is the modification of the language and 
run-time system to support parallel programming.  We believe that
in addition to the programming of distributed applications, the
structure of Emerald lends itself naturally to the programming
of parallel programs for shared-memory multiprocessors.  Our
intention is to re-examine Emerald in the light of multiprocessor
systems, and to experiment with programs written for a distributed
network of shared-memory multiprocesors.  
.sh 2 "The Research Environment"
.lp
The Computer Science Department at the University of Washington is a
particularly appropriate place in which to undertake this research.  Because
of the existence of the Eden Project, students and faculty in the
Department have an unusual level of experience in distributed computation.
The new NSF CER grant in Heterogeneous Computer Systems is also closely
related to this research.  As part of that grant, a number of distributed
services will be implemented for a heterogeneous network, using more
traditional languages and remote procedure call. 
.pp
In addition to this, there are two other research projects with which we
expect to interact.   First, John K. Bennett, under
the direction of Professors Edward Lazowska and Alan H. Borning, is
completing doctoral research involving the distribution of the Smalltalk
language on a network of Sun Workstations.  Although the style of Emerald
will differ markedly from that of Smalltalk, we expect to benefit from the
lessons of a previous implementation of a distributed language.
Second, Professors John Zahorjan and Edward Lazowska are doing research in
load sharing in distributed systems, which involves both
analytic studies and experimentation.   While it is possible to experiment
with load sharing on the Eden system by passivating objects and then
reactivating them on another node, load sharing is better supported by
Emerald where there is true object mobility.
.pp
In summary, the level of research activity at Washington in distributed
systems is such that we can expect some fruitful collaborations to occur
should this proposal be funded.
.sh 1 Bibliography
.so /u1/black/roff/arizonabibmacs
.[]

