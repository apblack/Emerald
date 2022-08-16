Date: Wed, 19 Mar 86 23:05:39 PST
From: eric@uw-wally.arpa (Eric Jul)
To: black@uw-wally.arpa, levy@ward, norm@uw-wally.arpa
Subject: Timing of Oz kernel version 3.4; process switching.
Cc: eric@uw-wally.arpa

March 18th, 1986 timing of Oz kernel version 3.2 and 3.4.

Changes introduced by version 3.2:
    Optimized version of the C-code:
    reduced the number of "calls"
    put local variables into registers.
    Reduced the number of calls to the Eden mainloop by testing to see
    if it is empty before calling it.

(Version  3.3 was buggy.)

Changes introduced in version 3.4:
    Avoided calls to the C-part of the kernel when monitor and condition
    queues are empty.

Timing results:

    1100 microseconds for one iteration of 319 VAX-instructions including
           18  "calls" instructions
    
    Essentially, these 1100 microseconds are spent doing:

            2   Blocking Monitor Entry calls (2 process-switches).
            2   Unblocking Signal-and-Continue calls (2 process-switches).
            2   Invocations
            2   loop iterations
            2   variable updates
            2   if statements

    For one of each:  microseconds   
    Version 3.0         2500        Byte code interpreter
    Version 3.1         1000        Assembler program code
    Version 3.2          650        Optimized C-code
    Version 3.4          550        Minor optimizations


Code executed for an interation:
                        VAX         calls
                     instructions   count
    Version 3.0         ????        ????    Byte code interpreter
    Version 3.1          645          40    Assembler program code
    Version 3.2          335          24    Optimized C-code
    Version 3.4          319          18    Minor optimizations

Future versions:
    Now the C version of the kernel has been squeezed and the 80-20 rule
    will apply to further optimizations.
    The next quantum leap will be when the critical parts of the
    kernel are programmed in assembler -- but this should be put off
    until later.

-- Eric
March 18th, 1986.

