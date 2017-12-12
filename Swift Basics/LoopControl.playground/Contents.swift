//: Playground - noun: a place where people can play

import UIKit

for count in 1...10 {
    
    print("count: \(count)")
    //if we want to find 5 in loop, why do we run it after getting 5, do breake it
    if count == 5 {
        print("i found 5");
        break
    }
}

for number in 1...10 {
    //what if i dont want to print particular number, use continue
    
    if number == 5 {
        continue
    }
    print("number: \(number)")
}
