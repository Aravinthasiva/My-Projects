//: Playground - noun: a place where people can play

import UIKit

//Handle dictionary

var peoples = [1:"Aravind",2:"Siva",3:"Vishnu",4:"Krishna",5:"Rama"]
//we could declare the above with datatype like below
//var peoples2:[Int:String] = [1:"Aravind",2:"Siva",3:"Vishnu",4:"Krishna",5:"Rama"]

//assigned with key and values
//lets print the value of key 2
print(peoples[2]!)
peoples[2] = "Sam"
print(peoples[2]!)

//define without initial value
var deptList = [Int:String]()
deptList[1] = "Mech"
deptList[3] = "ECE"
deptList[5] = "EEE"

for (k,v) in deptList {
    print("key: \(k)")
    print("value: \(v)")
}
