
import UIKit

/*
 Closure is a self contained block that you can pass around functions save it in a var and can use as completion handler.
 All functions are closure only diff is that function has a name.
 */


//Function
func arithmeticOperation(num:Int, values:[Int]) -> [Int]
{
    var arrNewValues = [Int]()
    for val in values{
        if val < num{
            arrNewValues.append(val)
        }
    }
    return arrNewValues
}

let lessThanFive = arithmeticOperation(num: 5, values: [3,4,6,9,10])


//Closure
typealias ArithmeticClosure = (Int, Int) -> Bool

let lessThanClosure:ArithmeticClosure = { $0 < $1 }
let greaterThanClosure:ArithmeticClosure = { $0 > $1 }

let values = [3,4,6,9,10]

func closureArithmeticOperaion(closure:ArithmeticClosure, compare:Int) -> [Int]
{
    var arrValues = [Int]()
    for num in values{
        if closure(num, compare) == true{
            arrValues.append(num)
        }
    }
    return arrValues
}

let result1 = closureArithmeticOperaion(closure: lessThanClosure, compare: 5)





