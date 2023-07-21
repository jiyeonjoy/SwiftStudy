import Foundation

// -------------------------------------------------//
// initializer(생성자)
struct iPhone {
    var model: String

    init() {
        model = "iPhone 13"
    }
}

let iPhone13 = iPhone()
//let iPhone14 = iPhone(model: "iPhone 14") // init() 정의 안해줬으면 에러 안났을 텐데 생성자를 정의해줘서 해당 값 에러남.


// -------------------------------------------------//
//struct vs. class 차이점과 공통점
//
//✅ 공통점
//- 프로퍼티(속성)를 정의해서 값을 저장할수 있음
//- 메소드(행동)를 정의해서 기능을 제공할수 있음
//- 생성자를 정의해서 초기상태를 세팅할수 있음
//- 확장을 이용해서, 기본 구현외 추가 기능을 더할수 있음
//- 프로토콜을 구현해서 특정 기능을 제공할수 있음
//
//✅ 차이점
//- 클래스는 상속을 시킬수 있음
//- 클래스는 레퍼런스 카운팅을 통해 클래스 인스턴스에 대한 하나 이상의 참조를 허용
//- 클래스는 deinitializer 호출시, 이미 할당된 리소스에서 해제 할수 있음


// -------------------------------------------------//
// property
struct Movie {
    // stored property
    var name: String
    var director: String

    // computed property
    var description: String {
        return "\(name) is \(director)'s best movie ever"
    }
}

var movie = Movie(name: "인셉션", director: "놀란")
print(movie.description)


// -------------------------------------------------//
// didSet
struct Task {
    var name: String
    var progress: Int {
        didSet {
            print("Current Progress : \(progress) %")
        }
    }
    
    var isDone: Bool {
        return progress == 100
    }
}

var task = Task(name: "Very Important Task", progress: 0)

task.progress = 30 // Current Progress : 30 %
task.progress = 50 // Current Progress : 50 %
task.progress = 90 // Current Progress : 90 %


// -------------------------------------------------//
//# method
//
//- 객체는 행동(기능)을 가지고 있고, 그것을 우리는 `method` 라고 부름
//    - 객체가 가지고 있는 함수라고 생각하면 됨
//
//- `struct` 에서 `method` 가 `stored property` 값을 변경하는 경우, `mutating` 키워드를 메소드 앞에 붙여주어야함


// -------------------------------------------------//
// mutating
struct Student {
    let name: String
    var major: String
    var knowledge: Double
    
    func didFinalTest() -> Int {
        let howMuchIdontKnow = (1 - knowledge) * 100
        let score = 100 - Int(howMuchIdontKnow)
        return score
    }
    
    mutating func didStudy() {
        if knowledge >= 1 {
            knowledge = 1
        } else {
            knowledge += 0.1
        }
    }
}


// -------------------------------------------------//
// 03
// inout
func makeTriple(num: inout Int) {
    num *= 3
}

var num = 8
makeTriple(num: &num)

print(num) // 24


// -------------------------------------------------//
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


// -------------------------------------------------//
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
