import UIKit

var str = "Stack DS: LIFO"

struct Stack<T>{
    private var list = [T]()
    
    mutating func push(element:T?){
        guard let element = element else{
            return
        }
        list.append(element)
    }
    mutating func pop() -> T?{
        if list.isEmpty{
            return nil
        }else{
            let element = list.last
            list.removeLast()
            return element
        }
    }
    func peek() -> T?{
        if list.isEmpty{
            return nil
        }else{
            return list.last
        }
    }
    func isEmpty() -> Bool{
        return list.isEmpty
    }
}
var stackInt = Stack<Int>()
stackInt.push(element: 1)
stackInt.push(element: 2)
stackInt.push(element: 3)
stackInt.pop()
stackInt.push(element: 4)

print(stackInt)
