import Foundation

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
