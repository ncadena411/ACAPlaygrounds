import Foundation

let array1 = [Int]()
let array2: [Int] = []
let array3: Array<Int> = []
let array4 = Array<Int>()

final class FIFO<Element> {
    var stack: [Element] = []
    
    init(_ stack: [Element] = []) {
        self.stack = stack
    }
    
    func push(_ value: Element) {
        stack.insert(value, at: 0)
    }
    
    func pop() -> Element {
        stack.removeLast()
    }
}

let fifo1 = FIFO<Int>()
let fifo2 = FIFO<String>(["hola", "adios"])

fifo1.push(4)
fifo1.push(5)
fifo1.push(8)
fifo1.push(10)
fifo1.pop()
fifo1.pop()

//I cannot use Generics in protocols of that type

protocol FIFOType {
    associatedtype Element
    var stack: [Element] { get set }
    mutating func push(_ value: Element)
    mutating func pop() -> Element
}

extension FIFOType {
    mutating func push(_ value: Element) {
        stack.insert(value, at: 0)
    }
    
    mutating func pop() -> Element {
        stack.removeLast()
    }
}

struct ColaEnteros: FIFOType {
    typealias Element = Int
    
    var stack: [Int]
}

final class ColaCadenas: FIFOType {
    typealias Element = String
    
    var stack: [String]
    
    init(stack: [String] = []) {
        self.stack = stack
    }
}

struct ColaDelCine<T>: FIFOType {
    var stack: [T]
}

var cine1 = ColaDelCine(stack: [1,4,3,5])
var cine2 = ColaDelCine(stack: [1.3, 1.5, 3.0, 6.7])
cine1.pop()
