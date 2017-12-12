//: Playground - noun: a place where people can play

import UIKit

enum Directions {
    case east
    case west
    case north
    case south
}

let myDirection = Directions.south

switch myDirection {
case Directions.east:
    print("move to east")
case Directions.west:
    print("move to west")
case Directions.north:
    print("move to north")
case Directions.south:
    print("move to south")
default:
    print("not defined")
}

