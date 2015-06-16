//
//  Base.swift
//  Izzy Glow
//
//  Created by Murillo Nicacio de Maraes on 1/26/15.
//  Copyright (c) 2015 TIL. All rights reserved.
//

import Foundation

//MARK: Operator Declaration
//Concat Operator
infix operator ++ { associativity left precedence 140 }

//Remove at Index Operator
infix operator -!! { associativity left precedence 140 }

// Diff Operator
infix operator ~- { associativity left precedence 120 }

//Composition Operator
infix operator • { associativity left precedence 140 }

//Application Operators
infix operator <| { associativity right precedence 70 }
//infix operator |> { associativity left precedence 70 }

infix operator <? { associativity right precedence 70 }
infix operator <?? { associativity right precedence 70 }

infix operator -< { associativity left precedence 1 }
infix operator -<? { associativity left precedence 1 }
infix operator -<?? { associativity left precedence 1 }

//Extraction Operators
infix operator <! { associativity left precedence 120 }

//Function Turn Operator
prefix operator ~~ {}

//Function Call Operator
postfix operator <! {}

postfix operator <!! {}

//MARK: Curry Functions
public func curry<A,B,C>(f:(A, B) -> C) -> A -> B -> C {
    return { a in { b in f(a, b) } }
}

public func curry<A,B,C,D>(f:(A, B, C) -> D) -> A -> B -> C -> D{
    return { a in { b in { c in f(a, b, c) } } }
}

public func curry<A,B,C,D,E>(f:(A, B, C, D) -> E) -> A -> B -> C -> D -> E{
    return { a in { b in { c in { d in f(a, b, c, d) } } } }
}

public func curry<A,B,C,D,E,F>(f:(A, B, C, D, E) -> F) -> A -> B -> C -> D -> E -> F {
    return { a in { b in { c in { d in { e in f(a, b, c, d, e) } } } } }
}

public func curry<A,B,C,D,E,F,G>(function:(A, B, C, D, E, F) -> G) -> A -> B -> C -> D -> E -> F -> G {
    return { a in
        { b in
            { c in
                { d in
                    { e in
                        { f in
                            function(a, b, c, d, e, f)
                        }
                    }
                }
            }
        }
    }
}

public func curry<A,B,C,D,E,F,G,H>(function:(A, B, C, D, E, F, G) -> H) -> A -> B -> C -> D -> E -> F -> G -> H {
    return { a in
        { b in
            { c in
                { d in
                    { e in
                        { f in
                            { g in
                                function(a, b, c, d, e, f, g)
                            }
                        }
                    }
                }
            }
        }
    }
}

public func curry<A,B,C,D,E,F,G,H,I>(function:(A, B, C, D, E, F, G, H) -> I)
    -> A -> B -> C -> D -> E -> F -> G -> H -> I {
    return { a in
        { b in
            { c in
                { d in
                    { e in
                        { f in
                            { g in
                                { h in
                                    function(a, b, c, d, e, f, g, h)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

public func curry<A,B,C,D,E,F,G,H,I,J>(function:(A, B, C, D, E, F, G, H, I) -> J)
    -> A -> B -> C -> D -> E -> F -> G -> H -> I -> J {
    return { a in
        { b in
            { c in
                { d in
                    { e in
                        { f in
                            { g in
                                { h in
                                    { i in
                                        function(a, b, c, d, e, f, g, h, i)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

public func curry<A,B,C,D,E,F,G,H,I,J,K,L,M>(
    function:(A, B, C, D, E, F, G, H, I, J, K, L) -> M)
    -> A -> B -> C -> D -> E -> F -> G -> H -> I -> J -> K -> L -> M{
    return { a in
        { b in
            { c in
                { d in
                    { e in
                        { f in
                            { g in
                                { h in
                                    { i in
                                        { j in
                                            { k in
                                                { l in
                                                    function(a, b, c, d, e, f,
                                                        g, h, i, j, k, l)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

//MARK: Uncurry Functions
public func uncurry<A,B,C>(f:A -> B -> C) ->  (A, B) -> C{
    return { f($0)($1) }
}

public func uncurry<A,B,C,D>(f:A -> B -> C -> D) -> (A, B, C) -> D{
    return { f($0)($1)($2) }
}

public func uncurry<A,B,C,D,E>(f:A -> B -> C -> D -> E) -> (A, B, C, D) -> E{
    return { f($0)($1)($2)($3) }
}

public func uncurry<A,B,C,D,E,F>(f:A -> B -> C -> D -> E -> F) -> (A, B, C, D, E) -> F{
    return { f($0)($1)($2)($3)($4) }
}

//MARK: Flip Functions
public func flip<A,B,C>(f:(A, B) -> C) -> (B, A) -> C {
    return { f($1, $0) }
}

public func flip<A,B,C,D>(f:(A, B, C) -> D) -> (C, B, A) -> D{
    return { f($2, $1, $0) }
}

public func flip<A,B,C,D,E>(f:(A, B, C, D) -> E) -> (D, C, B, A) -> E{
    return { f($3, $2, $1, $0) }
}

public func flip<A,B,C,D,E,F>(f:(A, B, C, D, E) -> F) -> (E, D, C, B, A) -> F {
    return { f($4, $3, $2, $1, $0) }
}

//MARK: Apply Functions
public func apply<A, B> (f: A -> B, x: A) -> B {
    return f(x)
}

public func apply<A, B> (fs: [A -> B], x: A) -> [B] {
    return fs.map { f in
        apply(f, x)
    }
}

public func optionalApply<A, B> (f: (A -> B)?, x: A?) -> B? {
    if let f1 = f, x1 = x {
        return f1(x1)
    }

    return nil
}

public func applyOptional<A, B> (f: (A -> B)?, x: A) -> B? {
    if let f1 = f {
        return f1(x)
    }

    return nil
}

//MARK: Turn Functions
public func turn<P, R: AnyObject>(f: (P!) -> R!) -> (AnyObject!) -> AnyObject! {
    return { (param: AnyObject!) -> AnyObject! in
        if let unwrappedParam = param as? P {
            return f(unwrappedParam)
        }
        
        return nil
    }
}

public func turn <P> (f: (P!) -> ()) -> (AnyObject!) -> () {
    return { (param: AnyObject!) in
        if let unwrappedParam = param as? P {
            f(unwrappedParam)
        }
    }
}

//MARK: Call Functions
func call(f: () -> ()) {
    f()
}

func call(fs: [() -> ()]) {
    for f in fs {
        call(f)
    }
}

func callOnMainThread (f: () -> ()) {
    dispatch_async(dispatch_get_main_queue(), f)
}

//MARK: Operator Definitions
public func ++<T> (left: [T], right: T) -> [T] {
    return left + [right]
}

public func -!!<T> (left: [T], right: Int) -> [T]{
    var result = left
    result.removeAtIndex(right)
    
    return result
}


public func •<A, B, C> (f: B -> C, g: A -> B)  -> A -> C {
    return { apply(f, apply(g, $0)) }
}


public func <|<A, B> (f: A -> B, x: A) -> B {
    return apply(f, x)
}

public func <|<A, B> (f: [A -> B], x: A) -> [B] {
    return apply(f, x)
}

//func |><A, B> (x: A, f: A -> B) -> B {
//    return apply(f, x)
//}
//
//func |><A, B> (x: A, f: [A -> B]) -> [B] {
//    return apply(f, x)
//}

public func -<<A, B> (f: A -> B, x: A) -> B {
    return apply(f, x)
}

public func -<<A, B> (f: [A -> B], x: A) -> [B] {
    return apply(f, x)
}

public func <? <A,B> (f: (A -> B)?, x: A?) -> B? {
    return optionalApply(f, x)
}

public func <?? <A,B> (f: (A -> B)?, x: A) -> B? {
    return applyOptional(f, x)
}

public func -<? <A,B> (f: (A -> B)?, x: A?) -> B? {
    return optionalApply(f, x)
}

public func -<?? <A,B> (f: (A -> B)?, x: A) -> B? {
    return applyOptional(f, x)
}

public func <! <T>(dictionary: [String: AnyObject]?, key: String) -> T? {
    return dictionary?[key] as? T
}

public prefix func ~~ <P, R: AnyObject> (f: (P!) -> R!) -> (AnyObject!) -> AnyObject! {
    return turn(f)
}

public prefix func ~~ <P> (f: (P!) -> ()) -> (AnyObject!) -> () {
    return turn(f)
}

public postfix func <! (f: () -> ()) {
    call(f)
}

public postfix func <! (fs: [() -> ()]) {
    call(fs)
}

public postfix func <!! (f: () -> ()) {
    callOnMainThread(f)
}