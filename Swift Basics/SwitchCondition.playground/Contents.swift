//: Playground - noun: a place where people can play

import UIKit

let mark = 41

switch mark {
case 35..<37: //use it while using operators
    print("You got 35")
case 40, 41: //use it for two cases has same values
    print("You got 40")
case 50:
    print("You got 50")
default:
    print("Nothing got")
}
