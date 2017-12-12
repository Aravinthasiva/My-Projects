//: Inheritance and Overriding

import UIKit

//defining class
class Student {
    
    //properties
    var firstName:String?
    var lastName:String?
    var age:Int?
    var dept:String?
    var idNum:Int?
    
    //methods
    func getFullName() -> String {
        let fullName = firstName! + " " + lastName!
        return fullName
    }
}

//Lets take School class is child of Student class. We will use getFullName() in School also but way to find full name is different.  leta declare the method start with Overiding

class School: Student {
    
    //properties
    var schoolname:String?
    
    //methods
    func getFirstNameAndSchoolName() -> String {
        let combinedName = firstName! + " " + schoolname! //Here firstName is a property of Student class. but we are using it. This inheritance.
        return combinedName
    }
    
    override func getFullName() -> String {
        let fullName = firstName! + lastName!
        return fullName
    }
}

//Create object of student class
let objStudent = Student()
objStudent.firstName = "Aravind"
objStudent.lastName = "Siva"
print(objStudent.getFullName())

//Create object of school class
let objSchool = School()
objSchool.firstName = "Aravind"
objSchool.lastName = "Siva"
print(objSchool.getFullName())





