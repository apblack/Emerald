Cover:  Add ack of Norm's IBM support.

Authors:  How about reverse alphabetical order?  This implies that there
shouldbe less Jul words and more Levy wordds in the final paper.

(OK< OK, all of this can be worried about IFF the paper is accepted)

P2 Line 10 "can actively move .. network" => "can move ... network actively"
   Line 12 delete "Furthermore"
   L 13    "which in Emerald is the object" => objects instead of processes"
   L -6    "A single ... benefits" => "Object mobility provides the
            following benefits"
   L -2    "hightly interacting objects" => "objects that interact
            intensively"
   L -1    "conversation" => "interaction".

P3 item 5   What unique software capabilities exists on a particular node
            in an integrated system like Emerald?
   items 6-8 bogus or dubious: see overview comments

   last line After "other objects" add "and primitive data".  This is a
             systems conference.

P4  L3/4    "data-only objects that execute" => "and execute only"
    L7      "in the context" => "using"
    L8      "can therefore distinguish" => distinguishes between"
    L9      "First, some" => \i[Global]
    L11     "Second, some" => \i[Local]
    L12     "may be" => "are",  "different" => "various"
    L13     "can be directly allocated within" "are allocated directly in"
    L17     "number of operations, their names" => "operations that it
             exports"
    L18     "type" => "class" ?
    L18/19  "as does" => "(in contrast to"
    L19     before "Conceptually" insert ")  Objects are not members of a
             class; "
            delete "is unique and"
    L20     "probibitive" => "unreasonable"
    L-6     "implementation" => "runtime system"
            "provide sharing of" => "share"
    L-3     "has a process" => "contains a process"
    L-2     "a process stack" => "the process' stack"

P5  L1      "its' => "The appropriate"
            "at that node" => "locally;"
            "and if not it" => "if it does not, the kernel"
    L3      "moved" => "sent"
    Bullet "Refix"  Explain why an atomic primitive is necessary.
    L12     after "stronger semantics" replace "and" by 
                                    "; if the primitive succeeds, "
    L15/16  "When specifying ... to" => "Location may be specified by naming"
    L16     "can be given" => "."
            delete "reference to"
    L17     "implied location" => "location implied"
    L18     Add reference to [Black SOSP 1985], which advocates this idea.
    L-6     delete "- particularly objects"
            delete "-"
    L-4     "levels of objects" => "levels of object"
    L-4/-3  "Simplest ... However," => "The simplest approach - moving the
            specified object alone - may be inapprpriate:"
    L-3     "an" => "the",  "a" => "the"
    L-2     "could" => "would"
    
P6  L6      delete "for the ... declarations."
    L8      after "For example," 
            add "consider an object \i[queue] that contains"

    L11     "declare" => "This code declares"
            "are references to" => "name"
    L12     "the object in which this declaration occurs" => "\i[queue]"
    L12/13  "referenced" => "named \i[at that time]"
    L13     delete "along with objects attached to Tree"
            "Functionally" => "Sematically" ??
    L14/15  "There is no guarantee .... is invoked" => 
            "Attachment is transitive: any object attached to \i[aTree]
	     will also be moved.  Attachment is not symmetric; the object
	     named by \i[aTree] can itself be moved, perhaps before it is
	     invoked, and no attempt will be made to move \i[queue] with
	     it."

    L-7     "are conceptually references" => "refer to"
            OR "the values of all variables are"
    L-2     "parameter objects" => "arguments"

P7  L4      "the invocation begins by cinstructing" =>
            "the first step in performing the invocation is to construct"
    L5      "parameter objects" => "arguments"
    L9      "parameter" => "argument"
    L10     "a parameter" => "the argument", "parameter" => "argument"
    L11     delete "object"
    L12     "and invocation." => ", remote and local invocation."
    L13     "We expect .... moved" => "In Emerald, arguments are moved"
    L16     "string" => "small string"
    L20     "parameter" => "argument"
    L-4     "these" => whatever he means - we need a noun.
    L-1     before "packet" add "network".

P8  (Line numbers start at the heading 2.3 as line 1)
    L3      "its own object ("self") or onother objects" => "any object"
    L4      after "reference" add "including the object to which it belongs."
(Incidentally, does self mean "the object to which the process belongs" or
"the object of which this code is a part?")
    L6      "associated with" => "owned by"
            before "B and C" add "A, "
    L9      "who may" => ", which"
            "continue" => "continues"
    L-4     After "Or" add ","
(But maybe the wjole paragraph is waffle)
    
P9  L7      "in tact" => "intact"
    L10     "residual dependencies" : an I supposed to know what this term
            means?  
    L-5     "and spearate" => "the boundaries of"
    L-1     Before "Mobility" add "Although"
            "however," => "local"

P10 L1      "given" => "because of"
    L4      "conceptually all Emerald objects are" => "all Emerald language 
            objects are conceptually"  
            "entities," => ", and are"
    L5      "in fact .. run-time" => "the same is not true of the run-time
            structures that implement them."
    L8      after "Moreover," add "although"
            delete ", which"
            "typically" => "they do tend to"
    L9      Delete "Therefore"
    L10     Delete "substantial"

    L-9     Ultrix and Unix are both Registered Trademarks.  The system is
            called Unix 4.2BSD, and Unix should be caps small caps.
    L-10    VaxStation II ? 
    L-5     "lightweight processes" => "lightweight threads"
    L-4     citations, like  [3], are not nouns: say "Reference [3]" if you
            need a noun.
    L-1     "thus"  What follows is not a consequence of what preceeds, but
            of the way we do local addressing.

P11 L2      after "ditinguish" add "between"
    L3-8    We've said this once already (and I made changes above to add
            the names "local" and global before I got to this part)
    L8      after "independently" add "of the enclosing object".
    L12     "references" => "names"
            "and X contains the memory" => "; the value stored in X is the"
(I don't like memory address" for "address in main store"; I'ld prefer just
to say "address", except when some specific differentiation from network
address is needed.)
    L-5     "references" => "names".  I'll stop saying this soon, but
            anything that talks about variables should use "names";
            "references" should be used wrt machine locations.
    L-5     "The reference consists of the memory" => "The value stored in
             Y is the"
    L-3     "area" => "data structure"

P12 L2      "not location independent" => "location dependent"
    L-6     "Mobility must ... since" => Consequently,"
            delete "now"
    L-5     ".  Still, mobility" => ", increasing the cost of mobility.  We
            feel that this is reasonable, since motion"
    L-4     before "places" add "design"

P13 L5      say that templates are also used by the debugger and garbage
            collector; the collector could use tag bits just as well.
    L7-9    The figures (3 and 4) should be on the same page.
    
P14 L1      "two pointers"  Ambiguous.  Is each variable two pointers, or is
            it one pointer each?
P15 L-5     first mention of "forwarding address"  What is this?  Nothing
            in the paper discusses object finding, which is hard to
            implement IFF you have mobility.  Put something in!

P16         There is no discssion of atomicity in moving objects.  What do
            we do so that a crash atthe wrong time doen't cause an object to 
            be lost?

    L-12    "moves" => "is moved"
    L-11    "move also" => "also move"
    L-7     "queue" => "link", at least, I think that's what he means.  And
            so on consistently throughout the next paras.
    L-2/-1  "Object invocation ... therefore" => "Even though we believe that"
    L-1/1   "to remove .. Hovever"  => "that mobility not increase the cost
            of invocation,"
P17 L1      "unacceptably high" => "unacceptable"
    L6      "an inexpensive operation"  What percentage of invocation time?
    L13     "queue" => "link" x2
    L15     "along" => "with it"
    
P18         Add balloons to thefigure showing the node boundaries.

P21 L9      "specify" => "declare"
            "objects that" => "variables with the property thatthe objects 
            that they name" 
            "they're" => "they are" 
    L14     "knit" => "coupled"
    L15     italicize "all"

