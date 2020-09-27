import Foundation

var str = "GCD Thread Safe: Using barrier"

class Person{
    private var firstName:String
    private var lastName:String
    
    init?(firstName:String?, lastName:String?){
        guard let fn = firstName, let ln = lastName else{ return nil }
        self.firstName = fn
        self.lastName = ln
    }
    
    func changeName(firstName:String?, lastName:String?){
        guard let fn = firstName, let ln = lastName else{ return }
        usleep(UInt32(10_000 * 20))
        self.firstName = fn
        usleep(UInt32(10_000 * 90))
        self.lastName = ln
    }
    
    open var name:String!{
        return "\(self.firstName) \(self.lastName)"
    }
}

class ThreadSafePerson:Person{
    private let dispatchQ = DispatchQueue(label: "com.ons.innerQueue", attributes: .concurrent)
    
    override func changeName(firstName: String?, lastName: String?) {
        dispatchQ.async(flags:.barrier) {
            super.changeName(firstName: firstName, lastName: lastName)
        }
    }
    override var name: String!{
        return dispatchQ.sync {
            return super.name
        }
    }
}

///let person = Person(firstName: "Abhinay", lastName: "Kumar")
let person = ThreadSafePerson(firstName: "Abhinay", lastName: "Kumar")
let names = [("Arvind", "Viswkarma"), ("Jitu", "Sparx" ), ("Santosh", "Maurya"), ("Sujeet", "Singh"), ("Yono", "XXXX")]

let dispatchGroup = DispatchGroup()
let dispatchQueue = DispatchQueue(label: "com.ons.outsideQueue", attributes: .concurrent)
for index in 0..<names.count{
    dispatchQueue.async(group: dispatchGroup){
        usleep(UInt32(10_000 * (index + 1)))
        person?.changeName(firstName: names[index].0, lastName: names[index].1)
        print(person?.name ?? "")
    }
}
dispatchGroup.notify(queue: DispatchQueue.global()){
    print("\nFinal Name", person?.name ?? "")
}

