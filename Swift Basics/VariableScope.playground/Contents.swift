//: Playground - noun: a place where people can play

import UIKit

//variable scope is handle or access the variable from a place is based on whether it is declared as public or inside any function.

func showName() {
    let name = "Aravind"
    print(name)
    //we can not access this name variable from out side of this function. because it was private. If we want to access we should declare that publically outside the function.
}
// print(name) // it will throw error

let dept = "Mechanical" //public variable, we can access it form anywhere

func showDepartment() {
    print(dept)
}
showDepartment()

print(dept)
//as said, we could able to access it even outside the function.
