import UIKit

//Use reduce to get result according to your's

struct Option{
    let title:String
    let address:String
}

let records = [Option(title: "Abhi", address: "Varanasi"), Option(title: "BN", address: "Delhi"),Option(title: "Chetan", address: "Mumbai"),Option(title: "Diya", address: "Varanasi")]

//Add record which has address "Delhi"
func filterAndGetDelhiRecordThroughReduce() -> [Option]?{
    //records.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Option) throws -> Result##(Result, Option) throws -> Result#>)
    //Here Option = Each index's record from records array like first time records[0], second time records[1] etc...
    let delhiRecords = records.reduce([Option]()) { (arr, record) -> [Option] in
        var newArray = arr
        if record.address == "Delhi"{ newArray.append(record) }
        return newArray
    }
    return delhiRecords
}

//Add only title which has address "Varanasi"
func filterAndGetVaranasiPeopleThroughReduce() -> [String]?{
    //records.reduce(into: <#T##Result#>, <#T##updateAccumulatingResult: (inout Result, Option) throws -> ()##(inout Result, Option) throws -> ()#>)
    //Here Option = Each index's record from records array like first time records[0], second time records[1] etc...
   let names = records.reduce(into: [String]()) { (names, record) in
        if record.address == "Varanasi"{ names.append(record.title) }
    }
    return names
}

let delhiRecords = filterAndGetDelhiRecordThroughReduce()
print(delhiRecords ?? "")

let varanasiGuys = filterAndGetVaranasiPeopleThroughReduce()
print(varanasiGuys ?? "")
