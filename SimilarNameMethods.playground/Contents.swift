import UIKit
import Foundation

var str = "Similar/task name methods"

//--------------------
//sort - sorted
//sort works as mutating and sorded return the new instance
var arr = [400, 100, 300, 500]
arr.sort()//[100, 300, 400, 500] ascending order
arr.sort(by: >) //[500, 400, 300, 100] descending order
print(arr)

arr = [400, 100, 300, 500]
let arrSorted = arr.sorted()//[100, 300, 400, 500] ascending order
print(arrSorted)

//--------------------
//append - appending
//append works as mutating and appending return the new instance
var name = "Abhinay"
name.append(" Kumar")
print(name)//Abhinay Kumar

let fullName = name.appending(" Maurya")
print(fullName)//Abhinay Kumar Maurya

//--------------------
//shuffle - shhuffled
//shuffle works as mutating and shhuffled return the new instance. It works with Comparable and non comparable protocol
struct User{
    var name:String
}

var users = [User(name: "Abhinay"), User(name: "Arun"), User(name: "Kumar"), User(name: "Sashi")]
users.shuffle()//This will shuffle in random order
print(users)

let randomUsers = users.shuffled()
print(randomUsers)

//--------------------
//IsEmpty and count
//We should use isEmpty instead of count to check the empty string. isEmpty complexity is O(1), count complexity is O(n). isEmpty match first index with last index. count make loop.
print(name.isEmpty)
print(name.count)

//----------------
//is and isMemberOf, iskindOf
//is works on type, isMemberOf works on class, iskindOf works on class and subclass.

class Animal:NSObject{
    
}
class Animal2:Animal{
    
}
class Human{
    
}
let monkey = Animal()
let monkey2 = Animal2()
let c = Human()
if monkey is Human{//False
    print("No")
}
if monkey.isMember(of: Human.self){//False
    print("No")
}
if monkey.isMember(of: Animal.self){//True
    print("Yes")
}
if monkey2.isKind(of: Animal.self){//True
    print("Yes")
}
if monkey2.isKind(of: Animal2.self){//True
    print("Yes")
}
