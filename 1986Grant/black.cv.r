.nr pp 10
.nr sp 12
.sh 2 "Andrew P. Black"
.de uh
.ne 0.8i
.sp 2
.sz +2
.b "\\$1"
.sz -2
.sp
..
.TS
expand, tab(@);
le le . 
\fB\s+2Andrew Philip Black\s-2\fP@Date of Birth: 13\*[th\*] January 1956
Department of Computer Science, FR-35,@Married, three children
University of Washington,@British citizen; permanent resident of USA
Seattle, Washington 98l95
(206) 543-9281 (Office),   (206) 524-6636 (Home)
.TE
.uh Education
.TS
expand, tab(@);
lw(1.5i) lw(4.29i) .
T{
.na
.fi
Oct 1977 \- Nov 1978 and Jan 1980 \- Oct 1981 \(dg
T}@T{
.\" .na
.fi
University of Oxford (Balliol College), England.  D.Phil. from Programming
Research Group under Professor C.A.R. Hoare.  Awarded three-year
Studentship from Science Research Council.  Thesis (\^\fIException
Handling: The Case Against\fP\^) submitted January 1982.
T}
.sp 0.5
T{
.na
.fi
Oct 1974 \- June 1977
T}@T{
.\" .na
.fi
University of East Anglia, Norwich, England.
B.Sc. with First Class Honours in Computing Studies.
Awarded prizes on result of both preliminary and final examinations.
T}
.TE
.uh "Employment"
.TS
expand, tab(@);
lw(1.5i) lw(4.29i) .
T{
.na
.fi
Nov 1981 \- present
T}@T{
.\" .na
.fi
Research Assistant Professor, University of Washington, Department of
Computer Science.  Involved in some teaching, but principally with student
supervision and research.  My research is related to various aspects of the
Eden distributed system and its applications, with distributed programming
and programming languages, and to the accommodation of heterogeneous
hardware and software in an existing environment.
T}
.sp 0.5
T{
.na
.fi
.nh
\(dg Nov 1978 \- Dec 1979 (while registered at Oxford)
T}@T{
.\" .na
.fi
Special Assistant at IBM T.J. Watson Research Center, Yorktown Heights, New
York, attached to the Software Technology Project.  The aim of the project
was to improve the reliability of an operating system fragment by applying
modern programming methods.  I was primarily involved in the use of
abstract data types, including the writing of an interpreter for axiom
systems and the design of a programming language which supported them.
T}
.sp 0.5
T{
.na
.nh
Summer 1975 and Jan\ \-\ Aug 1974
T}@T{
.\" .na
.fi
Programmer, Thames Polytechnic Computer Centre, London.  I wrote the command
language interpreter for an experimental operating system, installed and
maintained the Algol 68 compiler, and advised users of the centre on
programming problems.
T}
.TE
.uh "Research Interests"
.lp
.nh
My long-term research interests include all aspects of the process of
producing correct and efficient programs.  This interest has been
maintained through a variety of research and development projects in
programming languages and systems.
.pp
At Oxford I collaborated with a software house in the design and
formalisation of a programming notation for the production of 
.q "publishable programs" .  
My thesis work was a detailed consideration of one aspect of programming
language design (exception handling) and the effect that it 
had on the semantics and efficiency of programming languages and on the
correctness and readability of programs written in them.
.pp
In my first four years at Washington, I was principally involved with the
Eden project.  Eden attempts to combine the benefits of integrated computing
(time-sharing) and distributed computing (workstations) by providing an
object-oriented architecture in which the objects are mobile and operations
on objects are location independent.  This is a radical departure from
conventional systems, and involved basic research and design rather than
development.  My principal contributions have been
to the Eden user interface in the most general sense:  the Eden Programming
Language and its translator, the Eden Command Language and its interpreter,
the input/output system, and the terminal handler.   I was also involved in
the design of the Eden kernel primitives and in the assessment of the
suitability of the system for application programming.
.pp
My work on the Eden Programming Language has led me to collaborate with
Prof. Henry Levy in the design and implementation of a new distributed
programming language called Emerald.  Emerald advances beyond Eden and the
Eden programming language in the areas of abstract typing and support for
distribution.  Rather than relying on a conventional distributed operating
system, Emerald will be supported by its own run-time system.  Emerald
provides a single semantic concept of object, but implements objects in
different ways depending on their intended use.  Because we can design the
language and system together, we believe that we can make object invocation
efficient enough in the local case for this single semantic model to be
realistic.  The key ideas in Emerald are the abstract type system, which
combines the flexibility of Eden's typelessness with the speed and security
of compile time typing and a new parameter-passing mechanism called 
.q "call-by-move" .
.pp
Another outgrowth of the Eden project has been the recognition that
computing research is increasingly taking place in a heterogeneous
environment.  Whereas the goal of Eden was integration of similar
workstations, most active research environments now contain many dissimilar
systems.  Typically, each system was purchased or developed because of its
own particular properties.  The users of these machines do not want to
sacrifice these properties in order to obtain integration through
homogeneity, but neither do they wish to suffer the inconvenience, cost and
decreased research effectiveness that are the consequences of isolation.
Physical interconnection, remote login, and file transfer do not solve
these problems.  What is needed is access to a set of common high level
services: mail, filing, remote computation and so on.  Moreover, these
services must be provided and accessed in such a way that the cost of
connecting a new type of system is small.  We have just begun a program of
research and advanced development that aims to accommodate heterogeneity by
providing high level interconnection and the basic services listed above.
As an example of the work involved, I am in the process of designing a file
system for a distributed heterogeneous environment;  the demands of that
environment impose special requirements that existing 
.q "single system"
file systems do not meet.
.uh "Student Supervision"
.sp
.b "Ph.D. Theses"
.ip
Leif S. Nielsen,
.i "Separation of Data Manipulation and Control: A Structuring tool for Concurrent Program Development"
(August 1986).
.ip 
Norman C. Hutchinson,
.i "Language Design for Distributed Applications" 
(expected Autumn 1986).
.lp
.b "M.Sc. Theses"
.ip
F. S. Hsu,
.i "Reimplementing Remote Procedure Call" 
(1985)
.ip
T. Yap, 
.i "Concurrent Euclid Message Module"
(1986)
.ip
C. Burris,
.i "A Unified treatment of File Version Compaction"
(expected Summer 1986).
.lp
.b "M.Sc. Projects"
.ip
I. Domenech,
.i "The Eden Command Language Interpreter" 
(1984).
.ip
P. Jensen,
.i "The Eden Command Language Virtual Machine" 
(1984).
.ip
B. C. McCord,
.i "Implementation of the Eden Programming Language"
(1984).
.lp
.b "Eden Research Assistants"
not otherwise included above.
.ip
J. Brower (Eden input/Output Module and Eden debugger).
.ip
C. Binding (Window-oriented Terminal Handler)
.ip
P. Ma (Evaluation of Eden Checkpoint mechanism and construction of CE
run-time kernel.)
.br
.ne 4
.lp
.b "Senior Projects"
.ip
H. Matsuoka (Translator for the 3R programming language)
.ip
S. Evans (Debugging, extension and major performance enhancement of the Zed
editor.)
.sp .1i
.in 0
.ne 7
.uh Publications
.nh
.lp
.b "Submitted for Publication"
.lp
.i "File Sessions: A Technique for Analyzing Dynamic File Usage Patterns"
(with John Maloney, University of Washington).  Submitted to Third
International Conference on Data Engineering (February 1987).
.lp
.ne 3
.b "Fully Refereed"
.lp
.i "Distribution and Abstract Types in Emerald"
(with Norman Hutchinson, Eric Jul, and Henry Levy, University of
Washington, and Larry Carter, IBM T.J. Watson Research Center).  TR
86-02-04, February 1986.  To Appear, IEEE Transactions on Software
Engineering.
.lp
.i "Object Structure in the Emerald System"
(with Norman Hutchinson, Eric Jul, and Henry Levy, University of
Washington).  TR 86-04-03, April 1986.  To Appear, Procs. ACM Conference on
Object-Oriented Programming Systems, Languages and Applications (October
1986).
.lp
.i "Supporting Distributed Applications: Experience with Eden" .
Proc. 10th ACM Symposium on Operating Systems Principles
(December 1985), pp\ 181-193.
.lp
.i "The Eden Project: A Technical Review"
(with Guy Almes, Edward Lazowska and Jerre Noe, University of Washington).
IEEE Trans. Softw. Eng. Vol SE-11 Nr 1 (January 1985) 
pp\ 43\-59.
.lp
.i "Edmas:  The Eden Demonstration Mail System"  
(with Guy Almes, Carl Bunje and Doug Wiebe, University of Washington).
Proc. 7th\ International Conference on Software
Engineering (March 1984), pp\ 56\-66.
.lp
.i "Asymmetric Stream Communication" .  
Proc. 9th\ ACM Symposium on Operating Systems Principles
(October 1983), pp\ 4\-10.
.lp
.ne 4 
.b "Loosely refereed Papers" 
.lp 
.i "The Eden Project: Overview and Experiences" 
Invited paper, to be presented at the 1986 European Unix Users Group
Conference on Distributed Systems, Manchester, England, September 1986.
.lp
.i "Interconnecting Heterogeneous Computer Systems"
Invited paper, to be presented at the 1986 European Unix Users Group
Conference on Distributed Systems, Manchester, England, September 1986.
.lp
.i "Proposals for Algol H \- a Superlanguage of Algol 68" 
(with V.J. Rayward-Smith, University of East Anglia).  Algol Bulletin Nr
42, (May 1978), pp\ 36\-49.
.lp
.ne 4
.b "Technical Reports and unrefereed Papers"
.lp
.i "An Approach to Accommodating Heterogeneity"
(with E.D. Lazowska, H.M. Levy, D. Notkin, J. Sanislo and J. Zahorjan.)
Technical Report 85-10-04, 
.ds UW University of Washington, Department of Computer Science
\*(UW, October 1985.
.lp
.i "Distribution and Abstract Types in Emerald"
(with N. Hutchinson, E. Jul and H. Levy).  Technical Report 85-08-05, 
\*(UW, August 1985.
.lp
.i "Proving Monitor Proof Rules"
(with L.S. Nielsen).  Technical Report 85-08-01, \*(UW, August 1986.
.lp
.i "Exception Handling: The Case Against" .
Technical Report 82-01-02, \*(UW, January 1982.
.lp
.i "On Proof Rules for Monitors" 
(with J.M. Adams, New Mexico State University).
Operating Systems Review, Vol 16 Nr 2 (April 1982) pp\ 18\-27.
.lp
.i "Report on the Programming Notation 3R" .  
Technical Monograph PRG-17, Oxford University Computing Laboratory, August 1980.
.lp
.i "Exception Handling and Data Abstraction" .  
Research Report RC 8059, IBM T.J. Watson Research Center, Yorktown Heights,
NY, January 1980.
.br
.ne 8
.uh "Research Grants"
.lp
Co-principal Investigator, NSF Grant Nr MCS-8004111, 
.i "A Functionally Integrated Environment for Distributed Computing" 
(Coordinated Experimental Research Program). $4\|202\|271.
September 1980 \- February 1986.
.lp
Co-principal Investigator, NSF Grant Nr DCR-8420945, 
.i "Integration in Homogeneous and Heterogeneous Distributed Computer Systems" 
(Coordinated Experimental Research Program). $1\|151\|085 (includes
$230\|217 University contribution).  September 1985 \- February 1988.
.lp
Co-principal Investigator, Xerox Corporation University Grants Program,
$761\|200 (equipment only).  September 1985 \- September 1987.
.lp
Co-principal Investigator, Digital Equipment Corporation External Research Program,
.i "Programming for Distribution",
$193\|590 (equipment only).
.lp
Co-principal Investigator, Digital Equipment Corporation External Research Program,
.i "Interconnecting Heterogeneous Computer Systems",
$300\|000 (equipment only).

.in 0
.uh "Professional Organisations"
.lp
Member, British Computer Society.
.lp
Member, Association for Computing Machinery (ACM), and member of ACM
special interest groups on Programming Languages, Operating Systems and
Software Engineering.
.lp
Affiliate, IEEE Computer Society.
.lp
Member, Union of Concerned Scientists.
.lp
Member, Computer Professionals for Social Responsibility.
.uh "Professional Activities"
.lp
Organiser and session chairman at ACM SIGOPS Workshop on Accommodating
Heterogeneity, December 1985.
.lp
Attended Principles of Programming Languages Conference, January 1983,
1984, 1985 and 1986.
.lp
Attended Symposium on Operating Systems Principles, October 1983 (Author)
and December 1985 (Author).
.lp
Attended 7th International Conference on Software Engineering, March 1984
(Author).
.lp
Referee for Acta Informatica, ACM Trans. Prog. Lang. Systems, IEEE Trans
Softw. Eng., Computer Journal, Computer Languages, Addison-Wesley
Publishers, Benjamin/Cummings Publishers, Conference on Functional
Languages and Computer Architecture, Information Processing Letters,
Software \- Practice and Experience, Computer Bulletin, National Science
Foundation.
.lp
Invited technical presentations on programming languages and distributed
systems at Cornell University, University of British Columbia, University
of Victoria, IBM Yorktown Heights (1981, 1984 and 1986), Xerox PARC (1984
and 1986), IBM San Jose, Yale, New Mexico State University, Boeing AI
Center, NSF CER Meeting (1984), DEC SRC, DEC Littleton, Tektronix Research
Laboratory, AT&T Bell Laboratories (Murray Hill).  
