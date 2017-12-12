//: Playground - noun: a place where people can play

import UIKit

//define function or method

func doSum(number1:Double, number2:Double)->Double {
    let ans = number1 + number2
    return ans
}

//We can call the above function wherever we want.
//lets call that as shown below

let val = doSum(number1: 5, number2: 10)
print(val)


//func without parameter and return types

func showName() {
    print("Aravind")
}

showName()
showName()

//print name with parameters

func printName(name:String) {
    print("name \(name)")
}

printName(name: "Shiva")
printName(name: "Vishnu")
printName(name: "Ram")
printName(name: "Krish")


















