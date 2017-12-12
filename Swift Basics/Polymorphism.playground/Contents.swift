//: Playground - noun: a place where people can play

import UIKit

//Polymorphism- number of parameters are same but data types are dfferent

func sum(num1:Double, num2:Double) {
    let ans1 = num1 + num2
    print(ans1)
}

func sum(num1:Int, num2:Int) {
    let ans2 = num1 + num2
    print(ans2)
}

func sum(num1:Int, num2:Double) {
    let ans3 = Double(num1) + num2
    print(ans3)
}

sum(num1: 10.5, num2: 11.5)

sum(num1: 10, num2: 11)

sum(num1: 9, num2: 11.5)
