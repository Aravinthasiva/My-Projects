//: Playground - noun: a place where people can play

import UIKit

//handling Set

var departments = Set<String>()
departments.insert("Mechanical")
departments.insert("Computer Science")
departments.insert("Information Technology")
departments.insert("Electronics")
departments.insert("Civil")
//It will not duplicate any values, but arrays do. lets try,
departments.insert("Mechanical")
for dept in departments {
    print(dept)
}
