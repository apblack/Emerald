Date: Wed, 19 Mar 86 23:03:20 PST
From: eric@uw-wally.arpa (Eric Jul)
To: black@uw-wally.arpa, levy@ward, norm@uw-wally.arpa
Subject: 1,000,000 Emerald invocations in a minute? ...
Cc: eric@uw-wally.arpa, lazowska@june

        (... actually 50 will would do!)

Initial timing of invocations of Emerald objects.

This note describes the results of timing Emerald invocations between object
on the same machine, that is, co-resident global objects.  Co-resident means
that the called object is located on the same machine and in the same address
space as the caller.  Global means that the caller does not assume anything
about the location of the callee and that the general migration independent
referencing mechanism is used to find the object.  The Emerald invocations
have been hand-translated to VAX assembly code and thus is about as efficient
as it will ever be.  The times are compared to those for procedure calls in
"C".  Note that the results probably are optimistic rather than pessimitic
since the invocation call code sequence has already been optimized and future
considerations (such as garbage collection) may add instructions to the
sequence.

The types of invocations timed:

Monitored null operation:
        A parameterless monitored operation of a co-resident Emerald
	global object. (Includes monitor entry and exit.)

Null operation:
        A parameterless non-monitored operation of a co-resident Emerald
	global object. (Monitor entry and exit not necessary.)

Null non-exported operation:
        A parameterless operation which has not been exported
        (that is, a local procedure within an object).

"C"-procedure call:
        For comparison, this is the time for a call of a C-procedure,
	that is, a calls/ret sequence.  Allocation of local variables (a
	single "addl2 #xx,sp" instruction taking 1 microsecond) has been
	included to make the comparison fairer.  C does not do a stack
        check since UNIX automatically expands the stack if necessary.
        Emerald uses multiple stacks and cannot exploit this feature of UNIX,
        and so a stack check is performed.

"C"-procedure w/stackcheck:
        Same but with a stack check added to make the time comparable with
        Emerald invocations.

Main results:
        Null Emerald operation                  33 microseconds
        Comparable "C"-procedure call           32 microseconds

Result summary (ordered by execution time):
	Monitored null operation	        50 microseconds
	Null operation			        33 microseconds
        "C"-procedure call (w/stack check)      32 microseconds
        Null direct op. not exported            28 microseconds
        "C"-procedure call (calls/ret)          25 microseconds

Discussion:
        Originally, I set a goal for invocation timing to be no slower
	than 10 "C" procedure calls and hopefully as fast as 2 "C"
	procedure calls.  The results therefore are very encouraging:
	When including the time to do a stack check, we can do an Emerald
	invocation as fast as a procedure call in C. The comparative
	slowness of C-procedure calls seem to be caused by the register
	saving/retoring that calls/ret perform.  Apparently, it is
	expensive to scan the mask telling which registers to save.  In
	the case of a null procedure no extra registers need be saved and
	so the mask is 0, but scanning it twice (both calls and ret must
	scan it) apparently takes a lot of time anyway.

        Eden invocations take about 54 milliseconds or 3 orders of
        magnitude more -- the main reason probably is the crossing of
        heavy-weight process boundaries with the resulting communication
        overhead.

Detailed information about the timings:
The timings were performed under UNIX 4.2bsd on uw-wally (a VAX 11/750)
using "time" to do the actual timing.  Each operation was performed one
million times.  The times do not include the loop overhead.

The following is an instruction count for each code sequence executed:

    Purpose:            Monitored  Non-monitored  Direct   "C"     "C"
                         invoke       invoke      invoke  calls  w/check
    Call		    8            8           5      1       1
    StackCheck		    2            2           2              2
    Alloc. of locals	    1            1           1      1       1
    MonitorEntry            1
    MonitorExit		    6
    Return		    5            5           5      1       1

    Total instructions     23           16          13      3       5

    Time microseconds      50           33          29     25      32

-- Eric
March 19th, 1986.

Date: Fri, 25 Apr 86 16:31:25 PST
From: eric@uw-roskilde.arpa (Eric Jul)
To: norm@wally
Subject: Preliminary uVAX timing of Emerald
Cc: black@tasman, eric@wally, lazowska@krakatoa, levy@ward

Norm,
	I timed local invocations (i.e., where the address of the
destination is know) on uw-roskilde:   15.5 microseconds.
	I also timed "calls"       :   15.3 microseconds.

The corresponding times on Wally where:
	local invoke:		       25 microseconds.
	calls:			       32 microseconds.

(As usual, calls times include the time for a stack check).

Global invokes to come since I'll have to fake some AbCon vector's.

-- eric

