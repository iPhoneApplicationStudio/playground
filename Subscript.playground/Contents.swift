/*
 Subscripts are used to access information from a collection, sequence, or list from classes, stuructures or enums without using a method.
 */

import UIKit

var str = "Hello, Subscript"

//Example 1
struct DaysOfWeek
{
    fileprivate let week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    subscript (index:Int) -> String{
        return week[index]
    }
}

let dayName = DaysOfWeek()[0]
print(dayName)//Sunday

//Example 2
class MyNeighbour
{
    fileprivate var names = ["John", "Abhishek", "Kayla"]
    
    subscript (index:Int) ->  String {
        get{
            return names[index]
        }
        set(newvalue){
            names.append(newvalue)
        }
    }
}

let myNeighbour = MyNeighbour()
print(myNeighbour.names)

print(myNeighbour[1])//Get Subscript

myNeighbour[3] = "Ram"//Set Subscript
print(myNeighbour.names)

