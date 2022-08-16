Date: 8 Jun 1987 15:48 EDT
From: Andrew P. Black  <black@hobart>
Subject: Appendix to Emerald Report
To: Norm@Arizona.edu, rkr@wally.cs.Washington.Edu
Cc: Levy@whistler.cs.Washington.Edu
Bcc: Black
Message-Id: <550180089/black@hobart>

I've just taken a close look at the Appendix to the Emerald Report, the
part that describes the BuiltIn objects.  Here are some questions; some
are about the report, but many are really about the language.

BTW, the version of the report that I'm talking baout is dated 3 May
1987; the appendix begins on page 26

First, are all there objects equally "Built in?  In other words, am I
restrained from re-implementing array just like I'm restrained from
reimplementing boolean?   Where is this restriction in the report?  Is
it a real restriction, or simply am implementation hint, i.e. I CAN
reimplement boolean, and use it with if - then - else - fi, but it will
run like a crippled poodle.  Also, what is the difference between
"Builtin" and "predefined".

Section A.1:

    I have trouble understanding "AbstractType".  What is the
difference between AbstractType and PAT?  Also, in the decl of
"getSignature", the result is declared to be of type signature (as
defined also in S 8.2), but the actual result is PAT.  So PAT *>
Signature?  But, in A.10 Signatures are defined to have a create
operation, as well as a getSignature operation.  PAT doesn't have one,
so isn't the code in A.1 type-incorrect?  Oh, you mean the type of PAT not
it's value?

    More importantly:  All this is too subtle to go without some
explanatory text.  And shouldn't Signature be defined in syntactic
proximity to AbstractType?  I have a feeling that there is an important
property of types that we havn't written down: that they denote their own
signatures, as well as themselves.

A.2.
    array.catenate:  Shouldn't catenate be a function
        a.catenate[b] returns a new array a || b without changing a or b
and don't we need append and prepend as operations that change the
invoked object?

    In general, and this goes for all the types in the report:  we need
formal definitions.  Judicious copying from the Pascal Report should do
it for most types.

    Report: object aNat should export literal.  The 10 (initial allocated
size?) needs explanation.  If arrays have an allocated size that differs
from their upperbound-lowerbound+1, how do I change it or interrogate it?

Section A.3:
    
    Any seems to have achieved some now operations: getElement, getSlice,
|| etc.  Is this a bug or a feature?

Section A.4:

    What symbol are we using for negation?  ~ or !  The Precedence table in
Section 3 lists both!  If we use ~ (which I prefer), then not equal should
be ~=.  

    More significantly, it looks to me thaty every call of boolean.create
makes a new "True" or "False" object.  Yes, I know that create is a
function and Boolean is immutable, but we are execting an object
constructor every time we cal create.  Shouldn't the constructors for True
and False be elaborated once, when Boolean is created.

    const True == immutable object T
        export &, |, ~
    function | -> [result: Boolean]
        result <- T
    end |
    function & [arg: Boolean] -> [result: Boolean]
        result <- arg
    end &
    function ~ -> [result: Boolean]
        result <- False
    end &

This does away with the need for create with an integer argument:  There
are only ever two booleans.  The above code does raise another question,
though:  What is the scope of an identifier?  How can const True refer to
const False and vice versa?  Also, what is the status od the opertaots
"and" and "or"?  Section 4.4 implies that "and" and "or" have the same
status as & and |, but I don't see how that can be the case.  (Actually,
all of 4.2-4.4 seems to be subsumed by the appendix, except for "and" and
"or", which are control strucures, not operators.  [ a and b == if a then b
else false ].  I don't see how and can be defined in Emerald.  If it can't,
we need to add conditional expressions to the language ( a -> x, y ) with
some syntax.

A.6.

    Conditions: well, we knew it was a kludge.  A comment is needed in the
report, explaining that the only ops are the built in wait and signal of
monitors.  Is THIS the difference between built-in and predefined?
