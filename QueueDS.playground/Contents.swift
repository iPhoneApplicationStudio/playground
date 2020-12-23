import UIKit

var str = "Queue DS: FIFO"

struct Queue<T>{
    private var list = [T]()
    
    mutating func enqueue(element:T?){
        guard let element = element else{return}
        list.append(element)
    }
    
    mutating func deQueue() -> T?{
        if list.isEmpty{
            return nil
        }
        let element = list.first
        list.removeFirst()
        return element
    }
    
    func peek() -> T?{
        if list.isEmpty{
            return nil
        }
        return list.first
    }
    func isEmpty() -> Bool{
        return list.isEmpty
    }
}

var queueInt = Queue<Int>()
queueInt.enqueue(element: 2)
queueInt.enqueue(element: 3)
queueInt.enqueue(element: 4)
queueInt.deQueue()
queueInt.enqueue(element: 5)
queueInt.enqueue(element: 6)

print(queueInt.peek() ?? "")

print(queueInt)

