Date: Thu, 13 Mar 86 22:56:44 PST
From: eric@uw-wally.arpa (Eric Jul)
To: black@uw-wally.arpa, levy@ward
Subject: Timings of the kernel.
Cc: eric@uw-wally.arpa, norm@uw-wally.arpa

On March 13th, 1986, the second timing of Oz invocations took place.
The purpose was to obtain timing data on a new version of the kernel.
The major change was to discard the P-code interpreter and instead
handtranslate from Emerald directly to VAX assembly code.
The kernel is still written in C and thus the reduction in execution
time was mainly due to executing "compiled" code instead of interpreting
P-codes.

The timings were done on uw-wally, a VAX 11/750 running Unix 4.2bsd.

The example chosen for timing is a pair of processes alternating turns
printing (one prints Hi, the other Ho) by synchronizing through a monitor
object.  
Each iteration includes:
    2   signal/wait exchanges (including 2 process switches)
    2   global object invocations
    2   interations of a simple (infinite) loop
    2   monitor entries
    2   monitor exits
    1   loop with a counter
    1   loop
    2   variable assignments
    2   if statements
    0   printfs (Printing was omitted when doing the timing.)

Since everything comes in pairs, the bottom line figure given is for one
each, i.e., a signal/wait/invocation/loop sequence.

The results:

P-code interpreter 10000 iterations, in 51.6 sec  or about
                    2.5 ms/sequence.

Hand compiled Emerald program, kernel still in C:
    10000 interations in 21 sec or about
                    1 ms/sequence.

A detailed look at the instructions executed.

Instead of using profiling, I used dbx to get a trace of every
instruction executed
For each iteration 645 instructions are executed including:
     2      acbl            for stack checks
     3      addl2
     2      addl3
    29      beql
    35      bneq
    76      brb             wasted since the -O option to cc removes them
    40      calls
    21      clrl
    12      cmpl
    11      jmp
     8      jsb
    24      moval
   149      mov
    88      movq
    34      pushl
    40      ret
     6      rsb
     1      sobgeq
    20      subl2
    40      tstl


There are many ways to improve:
    Coding of the critical kernel calls in assembly (there is a total
        of 40 "calls" instructions each taking about 22 us).
    Optimizing queueing (using the VAX queue instructions) instead
        of calling C-routines.
    Removing too frequent checks of the kernel's task queue.
    Compiling the kernel with the -O (optimizer) flag.
The later two should give about 15% right off the bat.
------------------------------------------------------------------------
The following is the Emerald program used.

const initialObject == object initialObject
  process
    const newobj == 
      object innerObject
	export Hi, Ho
	monitor
	  var flip : Integer
	  var c : Condition
	  
	  operation Hi
	    if flip != 0 then
	      wait c
	    end if
	    % print "hi"
	    flip <- 1
	    signal c
	  end hi
	  operation Ho
	    if flip != 0 then
	      wait c
	    end if
	    % print "ho"
	    flip <- 1
	    signal c
	  end ho
	end monitor
	process
	  loop
	    self.ho
	  end loop
	end process
      end innerObject

    loop
      newobj.hi
    end loop
  end process
end initialObject
------------------------------------------------------------------------
The following is the program with the handtranslated code on the
left and the Emerald code on the right.  The program was actually written
using a number of macros.  Both the original program and the macro expanded
version follows.  The calls to the C-part of the kernel go via a stub
which saves registers and sets up a "calls" call of the desired kernel routine.


 #       HIHO hand-translated into assembler.
 #       The original code is given as comments followed by the assembler code
 #       for the line.
 #       Written by Eric Jul 1986 March 2
 #
 # Copyright 1986 Eric Jul.

        include(regdefs.4s)
        include(bdefs.4s)

        .data
_progBase:
        .globl  _progBase
        .space  4000
        .align  2
 # 3000 should be plenty for the header which is filled in by kOps.c  
 # bx is the offset of the first byte of data
 # in global data areas.
        .set    bx,112
                                # const initialObject == object initialObject
                                # process
                                #     const newobj == 
        .set    newobj,bx+8
                                #       object innerObject
                                # 	export Hi, Ho
        .set    Hi,2
        .set    Ho,3
                                # 	monitor
        .set    lock1,bx+8
                                # 	  var flip : Integer
        .set    flip,bx+24
                                # 	  var c : Condition
        .set    c,bx+32
                                # 	  
                                # 	  operation Hi
_HiEP:  .globl _HiEP
        b_enterOperation(12,200)
        b_monEntry(lock1)
                                # 	    if flip != 0 then
        tstl    flip(regs_g)
        jeql    LX1
                                # 	      wait c
        b_condWait(lock1,c)
                                # 	    end if
LX1:            
                                # 	    % print "Hi"
 #        b_printHi
                                # 	    flip <- 1
        movl    $1,flip(regs_g)
                                # 	    signal c
        b_condSignal(lock1,c)
                                # 	  end Hi
        b_monExit(lock1)
        b_return(0)
                                # 	  operation Ho
_HoEP:  .globl  _HoEP
        b_enterOperation(12,200)
        b_monEntry(lock1)
                                # 	    if flip != 0 then
        tstl    flip(regs_g)
        jneq    LX2
                                # 	      wait c
        b_condWait(lock1,c)
                                # 	    end if
LX2:
                                # 	    % print "Ho"
 #        b_printHo
                                # 	    flip <- 0
        clrl    flip(regs_g)
                                # 	    signal c
        b_condSignal(lock1,c)
                                # 	  end Ho
        b_monExit(lock1)
        b_return(0)
                                # 	end monitor
                                #
                                #       initially
_initEP:.globl  _initEP
        b_enterOperation(12,200)
        b_monInit(lock1)
        b_condInit(c)
                                #           flip <- 0
        clrl    flip(regs_g)
                                #       end initially
        b_initiallyDone(lock1)
        b_return(0)
                                # 	process
        .globl  _processEP
_processEP:
        b_beginProcess(8,208)
 # 0 locals, 8 for InvkQ, 200 safety
                                # 	  loop
LX3:
                                # 	    self.Ho
        movl    regs_g,-(sp)
        b_localInvoke(-16,regs_l,Ho)
        addl2   $4,sp
                                # 	  end loop
        jmp     LX3
                                # 	end process
        b_endProcess
                                #       end innerObject
                                # 
        .globl  _vHHCount
_vHHCount: .long 10000

_progEP:.globl  _progEP
        b_beginProcess(12,212)   #  -- initialize newobj
 # needs 8 for InvkQ, 1 temp, 200 safety.
        movl    _initialCodePtr,arg1
        moval   newobj(regs_g),arg2
        b_globalCreate
        movl    _vHHCount,r1
                                #     loop
LX4:
                                #       newobj.Hi
        b_globalInvoke(newobj,regs_g,Hi)
                                #     end loop
        sobgeq  r1,LX4
        pushl   $0
        calls   $1,_exit
                                #   end process
        b_endProcess
                                # end initialObject

And now the macro expanded version:

 #       HIHO hand-translated into assembler.
 #       The original code is given as comments followed by the assembler code
 #       for the line.
 #       Written by Eric Jul 1986 March 2
 #
 # Copyright 1986 Eric Jul.
        
        .data
_progBase:
        .globl  _progBase
        .space  4000
        .align  2
 # 3000 should be plenty for the header which is filled in by kOps.c  

 # bx is the offset of the first byte of data
 # in global data areas.
        .set    bx,112
                                # const initialObject == object initialObject
                                # process
                                #     const newobj == 
        .set    newobj,bx+8
                                #       object innerObject
                                # 	export Hi, Ho
        .set    Hi,2
        .set    Ho,3
                                # 	monitor
        .set    lock1,bx+8
                                # 	  var flip : Integer
        .set    flip,bx+24
                                # 	  var c : Condition
        .set    c,bx+32
                                # 	  
                                # 	  operation Hi
_HiEP:  .globl _HiEP
        movl        sp,r10
        acbl        _splimit,$ -200,r10,1f
        movl        $ 200,r9
        jsb         oz_stackCheck
1:
        subl2       $ 12,sp      
        
        bbcs        $ 0,lock1 (r12),1f 
        moval       lock1(r12),r9   
        jsb         oz_monEntry         
1:                                      
                                # 	    if flip != 0 then
        tstl    flip(r12)
        jeql    LX1
                                # 	      wait c
        moval       lock1 (r12),r9
        moval       c (r12),r8
        jsb         oz_condWait
                                # 	    end if
LX1:            
                                # 	    % print "Hi"
 #        b_printHi
                                # 	    flip <- 1
        movl    $1,flip(r12)
                                # 	    signal c
        moval       lock1 (r12),r9
        moval       c (r12),r8
        jsb         oz_condSignal
                                # 	  end Hi
        moval       lock1 (r12),r9
        jsb         oz_monExit          
        movl        -4(r13),r10  
        movq        (r13),r11
        addl3       $0+12,r13,sp
        movl        8(r13),r13
        jmp         (r10)
      
                                # 	  operation Ho
_HoEP:  .globl  _HoEP
        movl        sp,r10
        acbl        _splimit,$ -200,r10,1f
        movl        $ 200,r9
        jsb         oz_stackCheck
1:
        subl2       $ 12,sp      
        
        bbcs        $ 0,lock1 (r12),1f 
        moval       lock1(r12),r9   
        jsb         oz_monEntry         
1:                                      
                                # 	    if flip != 0 then
        tstl    flip(r12)
        jneq    LX2
                                # 	      wait c
        moval       lock1 (r12),r9
        moval       c (r12),r8
        jsb         oz_condWait
                                # 	    end if
LX2:
                                # 	    % print "Ho"
 #        b_printHo
                                # 	    flip <- 0
        clrl    flip(r12)
                                # 	    signal c
        moval       lock1 (r12),r9
        moval       c (r12),r8
        jsb         oz_condSignal
                                # 	  end Ho
        moval       lock1 (r12),r9
        jsb         oz_monExit          
        movl        -4(r13),r10  
        movq        (r13),r11
        addl3       $0+12,r13,sp
        movl        8(r13),r13
        jmp         (r10)
      
                                # 	end monitor
                                #
                                #       initially
_initEP:.globl  _initEP
        movl        sp,r10
        acbl        _splimit,$ -200,r10,1f
        movl        $ 200,r9
        jsb         oz_stackCheck
1:
        subl2       $ 12,sp      
        clrq        lock1 (r12)         
        
        clrl        c (r12)
                                #           flip <- 0
        clrl    flip(r12)
                                #       end initially
        jsb         oz_initiallyDone
      
        movl        -4(r13),r10  
        movq        (r13),r11
        addl3       $0+12,r13,sp
        movl        8(r13),r13
        jmp         (r10)
      
                                # 	process
        .globl  _processEP
_processEP:
        movl        sp,r10
        acbl        _splimit,$ -208,r10,1f
        movl        $ 208,r9
        jsb         oz_stackCheck
1:
        subl2       $ 8,sp      
 # 0 locals, 8 for InvkQ, 200 safety
                                # 	  loop
LX3:
                                # 	    self.Ho
        movl    r12,-(sp)
        movq        r12,-(sp)
        movl        r11,-(sp)
        movl        -16(r13),r12
 
        .set        xx,1072+Ho*8
        moval       _progBase,r10
        addl2       _progBase+xx,r10
        movl        sp,r13
        jsb         (r10)
      
        addl2   $4,sp
                                # 	  end loop
        jmp     LX3
                                # 	end process
        
        jsb         oz_endProcess       
      
                                #       end innerObject
                                # 
        .globl  _vHHCount
_vHHCount: .long 10000

_progEP:.globl  _progEP
        movl        sp,r10
        acbl        _splimit,$ -212,r10,1f
        movl        $ 212,r9
        jsb         oz_stackCheck
1:
        subl2       $ 12,sp      
   #  -- initialize newobj
 # needs 8 for InvkQ, 1 temp, 200 safety.
        movl    _initialCodePtr,r9
        moval   newobj(r12),r8
        jsb         oz_globalCreate
      
        movl    _vHHCount,r1
                                #     loop
LX4:
                                #       newobj.Hi
        movq        r12,-(sp)
        movl        r11,-(sp)
        movl        newobj(r12),r11
        
        movl        112(r11),r12
 
        .set        xx,1072+Hi*8
        moval       _progBase,r10
        addl2       _progBase+xx,r10
        movl        sp,r13
        jsb         (r10)
      
                                #     end loop
        sobgeq  r1,LX4
        pushl   $0
        calls   $1,_exit
                                #   end process
        
        jsb         oz_endProcess       
      
                                # end initialObject

