For the Emerald language definition:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    The code fragment 

    [immutable] typeobject t
        op1 ....
        op2 ...
            ...
        opn ...
    end t 

    is exactly equivalent to 

    immutable object 
        function getSignature [] -> [t : signature]
            t <-             
                [immutable] typeobject t
                    op1 ...
                    op2 ...
                        ...
                    opn ...
                end t 
        end getSignature
    end

This isn't a definition so much as an unfolding rule.  It says that the
typeobject constructor creates an immutable object with a single
[effect-free] operation called getSignature which takes no arguments and
which returns a Signature as its result.  This value of this result is ...
exactly that of the typeobjecxt constructor with which we started.

If we also give the conformity rules in terms of typeobject constructors,
then I think that we are done.  

If we add "ops [] -> ImmutableVector.of[OpName]" and "op [OpName] -> [Opsig]"
operations to signature -- and I don't see any reason not to -- then we
have to define the result of ops and op on an arbitrary typeobject
constructor too.
