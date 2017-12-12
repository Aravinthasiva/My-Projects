//: Playground - noun: a place where people can play

import UIKit

class Operations {
    
    func add(n1:Int, n2:Int) -> Int {
        return n1 + n2
    }
    func sub(n1:Int, n2:Int) -> Int {
        return n1 - n2
    }
}

extension Operations {
    
    func mul(n1:Int, n2:Int) -> Int {
        return n1 * n2
    }
}


let operation = Operations()
let addAns = operation.add(n1: 5, n2: 10)
let subAns = operation.sub(n1: 10, n2: 5)
let mulAns = operation.mul(n1: 5, n2: 5)



//-------------------------------
//make round of

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()
    }
}

let number:Double = 15.45845

print(number.roundTo(places: 3))









