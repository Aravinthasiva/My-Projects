//: Playground - noun: a place where people can play

import UIKit

var numbers = [01,10,20,30,40,50]
for num in numbers {
    print(num)
}
numbers[1] = 100
for index in 0...5 {
    print(numbers[index])
}

numbers.append(60)

//declare array with daya type

var locations=[String]()
locations.append("Chennai")
locations.append("Mumbai")
locations.append("Kolkata")
locations.append("Bangalore")
locations.append("Hyderabad")
//print array
for loc in locations {
    print(loc)
}
//remove object from array
locations.remove(at: 3)

//Array with mixed objects
var arr:Any=[1,2.1,true,"obj"]
















