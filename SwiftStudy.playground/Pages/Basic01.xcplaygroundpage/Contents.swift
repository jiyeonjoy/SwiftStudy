import Foundation

// 03
// inout
func makeTriple(num: inout Int) {
    num *= 3
}

var num = 8
makeTriple(num: &num)

print(num) // 24


// 02
// throws
enum DivideError: Error {
    case cannotZero
}

func divide(dividend: Int, divisor: Int) throws -> Int {
    if divisor == 0 {
        throw DivideError.cannotZero
    }
    
    return Int(dividend / divisor)
}

do {
    let result = try divide(dividend: 80, divisor: 6)
//    let result = try divide(dividend: 80, divisor: 0)
    print(result)
} catch {
    print(error.localizedDescription)
}


// 01
// print
func printNames(_ names: String...) {
    for name in names {
        print("name is \(name)")
    }
}

printNames("James", "Roy", "Jake")
// name is James
// name is Roy
// name is Jake

print("hi", 1, false)
