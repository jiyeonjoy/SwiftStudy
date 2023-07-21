import Foundation

// -------------------------------------------------//
//# Protocol

//- `protocol` 은 어떤 약속(역할)을 정해 놓은 것 어떤 약속(역할)을 정해 놓은 것이지 아직 구현된것은 아님
protocol ClassPresident {
    var name: String { get }
    var className: String { get }
    
    func sayHello()
    func checkClassMember()
}

class UnivPresidentStudent: ClassPresident {
    init(name: String, className: String) {
        self.name = name
        self.className = className
    }
    
    var name: String
    var className: String
    
    func sayHello() {
        print("대학생: 교수님 안뇽하세용!")
    }
    
    func checkClassMember() {
        print("대학생: 애들아 다 왔니?, 이제 니네도 어른이다. 알아서 하자!")
    }
}


struct HighSchoolPresidentStudent: ClassPresident {
    var name: String
    var className: String
    
    func sayHello() {
        print("고등학생: 담임 선생님 안뇽하세용!")
    }
    
    func checkClassMember() {
        print("고등학생: 애들아 다 왔니?")
    }
}

let jason = UnivPresidentStudent(name: "Jason", className: "공대")
let jake = HighSchoolPresidentStudent(name: "Jake", className: "이과")


jason.sayHello()
jason.checkClassMember()
// 대학생: 교수님 안뇽하세용!
// 대학생: 애들아 다 왔니?, 이제 니네도 어른이다. 알아서 하자!

jake.sayHello()
jake.checkClassMember()
// 고등학생: 담임 선생님 안뇽하세용!
// 고등학생: 애들아 다 왔니?



// -------------------------------------------------//
// protocol 쓰는 이유
protocol Purchaseable {
    var name: String { get set }
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}


struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

let harryPotter = Book(name: "HarryPotter", author: "J.K. Rowling")

let topgun = Movie(name: "Top Gun", actors: ["Tom cruise"])

let modelX = Car(name: "modelX", manufacturer: "Tesla")

let americano = Coffee(name: "ahah", strength: 5)

buy(harryPotter)
buy(topgun)
buy(modelX)
buy(americano)



// -------------------------------------------------//
// protocol 상속
protocol Payable {
    func calculateWages() -> Int
}

protocol Trainable {
    func train()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, Trainable, HasVacation { }

struct DeveloperEmployee: Employee {
    var name: String
    
    func calculateWages() -> Int {
        return 10_000_000
    }
    
    func train() {
        print("study hard")
    }
    
    func takeVacation(days: Int) {
        print("take \(days) days off")
    }
}

let choi = DeveloperEmployee(name: "Choi")

choi.calculateWages()
choi.takeVacation(days: 3)
choi.train()



// -------------------------------------------------//
// Protocol Extension - protocol은 역할 정의만 설명해주고 실제 구현은 제공하지 않지만
// protocol을 Extension 해주면 해당 프로토콜을 채택하는 여러 타입에 해당 기능을 제공해 줄 수 있다.
extension Collection {
    func summarize() {
        print("There are \(count) members")
    }
}

let stringArray = ["aa", "bb", "cc"]
let numSet = Set([1, 2, 3, 4, 5])

stringArray.summarize()
// There are 3 members

numSet.summarize()
// There are 5 members



// -------------------------------------------------//
// Protocol Oriented Programming
//- `protocol` 은 어떤 역할에 대한 정의를 제공
//- `extension` 은 어떤 타입에 구현을 제공함
//- `protocol extension` 은 어떤 역할에 대한 기본 구현 제공
//- 위 3가지 덕분에 POP(protocol oriented programming)이 가능함
extension Payable {
    func calculateWages() -> Int {
        return 10_000_000
    }
}

extension Trainable {
    func train() {
        print("study hard")
    }
}

extension HasVacation {
    func takeVacation(days: Int) {
        print("take \(days) days off")
    }
}

struct DeveloperEmployee2: Employee {
    var name: String
}

let developer = DeveloperEmployee2(name: "Jason")

developer.calculateWages()
developer.takeVacation(days: 3)
developer.train()


struct DesignerEmployee: Employee {
    var name: String
}

let jane = DesignerEmployee(name: "jane")
jane.calculateWages()
jane.takeVacation(days: 5)
jane.train()
