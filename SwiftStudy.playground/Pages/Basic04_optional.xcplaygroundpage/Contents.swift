import Foundation

// -------------------------------------------------//
//# Optional

//- swift 에서는 value 가 있거나 없을수 있음을 표현하는 타입인 `optional` 을 제공
//- `?` 를 이용해서 `optional` 을 표현
//- 값 없음은 `nil` 로 표현함
var age: Int? = nil
print(age) // nil

age = 12
print(age) // Optional(12)



// -------------------------------------------------//
//# Unwrapping Optionals
//
//- `optional` 타입에 값이 있는 경우, 그 값만 가져오고 싶을때가 있음
//- 이 때, `optional` 타입의 값만 가져오는 방법을 unwrapping 한다고 함
//- 대표적으로 `if let`  을 이용해서 unwrapping 함
if let unwrapped = age {
    print("age: \(unwrapped)")
} else {
    print("age is missing")
}



// -------------------------------------------------//
//# Unwrapping with guard
//
//- 메소드 또는 함수에서 `guard` 를 이용해서 초기에 조건을 검사할수 있음
//- `guard let` 을 이용하면, 메소드 초기에 옵셔널 타입에서 값이 있는 경우를 검사할수 있음
func printAge(age: Int?) {
    guard let unwrapped = age else {
        print("age is missing")
        return
    }
    print("age: \(unwrapped)")
}

printAge(age: age) // age: 12



// -------------------------------------------------//
//# Force Unwrapping

//- 옵셔널 타입에 값이 있다고 확신하는 경우, 강제 unwrapping 할수 있음
//- `!` 키워드를 이용해서 강제 unwrapping 구현
let forcedUnwrapped = age!
// Optional(12) 아니고, 12



// -------------------------------------------------//
//# Nil Coalescing
//
//- `optional` 타입에 값이 있을때는 해당 값을 넘겨 주면됨
//- `optional` 타입에 값이 없는 경우, default 값을 설정하고 싶을때, `nil coalescing` 을 이용할수 있음
//    - `??` 를 이용해서 default 값 설정 해줌
age = nil
let currentAge = age ?? 20 // 20



// -------------------------------------------------//
//# Optional chaining
//
//- 옵셔널 타입의 프로퍼티 접근시 `optional chaining` (`?` 마크)사용됨
struct Developer {
    var name: String
}

var jason: Developer? = Developer(name: "Jason")
print(jason?.name) // Optional("Jason")

jason = nil
print(jason?.name) // nil



// -------------------------------------------------//
//# Typecasting

//- swift 에서는 부모 타입에서 자식 타입으로 변형가능한지 확인해볼때 `as?` 키워드를 사용함
class Animal {
    
}

class Cat: Animal {
    
}

class Dog: Animal {
    func bark() {
        print("wal wal")
    }
}

let pets: [Animal] = [Cat(), Dog(), Cat(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.bark()
    }
}
