import Foundation

// -------------------------------------------------//
//# Struct vs Class
//
//- Use structures by default. :
//    - 기본적으로 잘 모르겠으면 struct를 쓴다.
//- Use classes when you need Objective-C interoperability.
//    - Objective-C 상호 운용성이 필요할 때 class 를 쓴다.
//- Use classes when you need to control the identity of the data you’re modeling.
//    - 모델링 중인 데이터의 identity를 제어해야 하는 경우 class 를 쓴다.
//- Use structures along with protocols to adopt behavior by sharing implementations.
//    - 프로토콜을 채택할 때 struct를 쓴다.

// -------------------------------------------------//
//# class 만들기

//- `class` 키워드를 이용해서 생성
//    - class 는 struct 와 다르게 memberwise initializer 제공되지 않음
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) { // 안해주면 에러남!!!
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("bow wow")
    }
}


let milk = Dog(name: "milk", breed: "Collie")

milk.name // milk
milk.breed // Collie



// -------------------------------------------------//
// 상속, 오버라이딩
class Collie: Dog {
    init(name: String) { // 생성자 정의 안해주면 부모클래스 생성자 따라감.
        super.init(name: name, breed: "Collie")
    }
    
    override func bark() { // 오버라이딩
        print("wal wal")
    }
}

let milky = Collie(name: "milky")
milky.name // milkiy
milky.breed // Collie



// -------------------------------------------------//
// final class - final 키워드를 이용해서 클래스 선언하면, 더 이상 상속 가능하지 않음
final class Cat {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

//class Bengal: Cat {} - Cat 클래스가 상속 가능하지 않기 때문에 에러남!!



// -------------------------------------------------//
// copying object
//- `struct` 와 `class` 의 차이중 하나가 instance 복사할때임
//    - `struct` 와 같은 `value type` 은  복사하면, 새로운 객체를 만듬
//        - → 따라서, 새로 복사된 객체의 프로퍼티 변형했다고 원래 객체가 영향 받지 않음
//    - `class` 와 같은 `reference type` 은 복사하면, 새로운 객체를 만들지 않음 (같은 객체를 포인팅하고 있음)
//        - → 따라서, 새로 복사된 객체의 프로퍼티 변형하면, 원래 객체의 프로퍼티 영향 받아서 변형 되어 있음
class StudentClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct StudentStruct {
    var name: String
}

var studentClass1 = StudentClass(name: "Jacob")
var studentClass2 = studentClass1

studentClass2.name = "Jay"
studentClass1.name // Jay
studentClass2.name // Jay

var studentStruct1 = StudentStruct(name: "Jacob")
var studentStruct2 = studentStruct1

studentStruct2.name = "Jay"
studentStruct1.name // Jacob
studentStruct2.name // Jay



// -------------------------------------------------//
//# deinitializer
//
//- `struct` 와 `class` 의 차이중 하나가 `class` 는 `deinitializer` 가 있음
//- 해당 인스턴스가 메모리에서 해제될때(없어질때) 호출됨
class Human {
    var name: String
    
    init(name: String) {
        self.name = name
        print("initialize instance")
    }
    
    deinit {
        print("deintilize instance: \(name)")
    }
    
    func printName() {
        print("my name: \(self.name)")
    }
}


func createJohn() {
    let john = Human(name: "John")
    john.printName()
}

let john = Human(name: "John")
john.printName()
// initialize instance
// my name: John

createJohn() // 함수가 끝나면 함수내에 변수가 메모리 해제되어 deintilize 호출됨.
// initialize instance
// my name: John
// deintilize instance: John



// -------------------------------------------------//
//# mutability
//
//- `class` 는 `struct` 와 다르게 `reference type` 이여서 상수로 선언하더라도, 프로퍼티가 `var` 로 선언해 놓았으면 변경 가능함
//    - 이 때문에,  class 는 method 앞에 `mutating` 키워드를 쓸 필요 없음
//    - 프로퍼티를 변경가능하지 않게 하려면, `let` 으로 선언해 놓으면 됨
class Human2 {
    var name: String
    
    init(name: String) {
        self.name = name
        print("initialize instance")
    }
    
    deinit {
        print("deintilize instance: \(name)")
    }
    
    func printName() {
        print("my name: \(self.name)")
    }
    
    func updateName(to name: String) {
        self.name = name
    }

}

let sean = Human2(name: "Sean")
sean.name // Sean
sean.name = "Joy" // sean이 let 이지만 name 이 var 이기 때문에 변경 가능.
sean.name // Joy
sean.updateName(to: "Son")
sean.name // Son
