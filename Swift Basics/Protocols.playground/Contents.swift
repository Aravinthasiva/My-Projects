//: Playground - noun: a place where people can play

//Protocol/Interface

import UIKit

protocol operations {
    func add(n1:Int, n2:Int)->Int
    func sub(n1:Int, n2:Int)->Int
}


class Maths:operations {
    
    func add(n1:Int, n2:Int)->Int {
        return n1 + n2
    }
    func sub(n1:Int, n2:Int)->Int {
        return n1 - n2
    }
}

class Logics:operations {
    
    func add(n1:Int, n2:Int)->Int {
        return n1 + n2 + 10
    }
    func sub(n1:Int, n2:Int)->Int {
        return n1 - n2 - 4
    }
}

let maths = Maths()
print(maths.add(n1: 10, n2: 20))

let logic = Logics()
print(logic.add(n1: 10, n2: 20))















