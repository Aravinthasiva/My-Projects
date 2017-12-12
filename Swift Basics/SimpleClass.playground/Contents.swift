//: Playground - noun: a place where people can play

import UIKit

//defining class
class Student {
    
    //properties
    var firstName:String?
    var lastName:String?
    var age:Int?
    var dept:String?
    var idNum:Int?
    
    //initialize (constructor) It is optional it will create it by default when we create any instance without parameter
    init() {
        print("Class is created")
    }
    
    //With parameter. By using this we can assign paramter here. This is Overloading
    init(firstName:String, lastName:String, age:Int, dept:String, idNum:Int) {
        self.firstName = firstName //self denotes the class name it refer that paramenter
        self.lastName = lastName
        self.age = age
        self.dept = dept
        self.idNum = idNum
    }
    
    //methods
    func getFullName() -> String {
        let fullName = firstName! + " " + lastName!
        return fullName
    }
}


//create instance of Student class
let student1 = Student() // this is how to create object

//assign/initialize parameters for student1 object
student1.firstName = "Aravind"
student1.lastName = "Siva"
student1.age = 24
student1.dept = "Mechanical"
student1.idNum = 2

//call method, for ex i will print it
print(student1.getFullName())


////create 2nd instance/Object
//let student2 = Student()
//
////assign parameter for 2nd object
//student2.firstName = "Mani"
//student2.lastName = "Kandan"
//student2.age = 22
//student2.dept = "Computer Science"
//student2.idNum = 3
//
////call method
//print(student2.getFullName())
//print(student2.idNum!)

//will create 2nd instance again using overloading.(init with parameters)

let student2 = Student(firstName: "Mani", lastName: "kandan", age: 21, dept: "Civil", idNum: 3)
print(student2.getFullName())
//That is it





