/// A list is either empty or it is composed of a first element (head)
/// and a tail, which is a list itself.
///
/// See http://www.enekoalonso.com/projects/99-swift-problems/#linked-lists
public class List<T>: CustomStringConvertible {
    public var description: String {
        return description()
    }
    
    private func description(index: Int = 0) -> String {
        let nextDescription = nextItem.flatMap({ (n: List) in
            return ", \(n.description(index: index + 1))"
        }) ?? " }"
        return "\(index == 0 ? "{ " : "")\(value)\(nextDescription)"
    }
    
    public let value: T
    public var nextItem: List<T>? {
        didSet {
            if oldValue != nil {
                // This is to force us to actually make the list immutable. We don't want do be changing an existing list
                fatalError("Attempting to modify an immutable list. Once set, nextItem cannot be changed")
            }
        }
    }
    
    public convenience init(_ value: T, _ values: T...) {
        self.init([value] + Array(values))!
    }
    
    public init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
    
    public func copy() -> List {
        let copy = List(value)
        copy.nextItem = nextItem?.copy()
        return copy
    }
    
    public var last: T {
        return nextItem?.last ?? value
    }
    
    public var lastItem: List<T> {
        return nextItem?.lastItem ?? self
    }
    
    public var pennultimate: T? {
        guard let nextItem = nextItem else { return nil }
        return nextItem.pennultimate ?? value
    }
    
    public var count: Int {
        return 1 + (nextItem?.count ?? 0)
    }
    
    public subscript(index: Int) -> T? {
        guard index > -1 else { return nil }
        guard index > 0 else { return value }
        return nextItem?[index - 1]
    }
    
    func item(at index: Int) -> List? {
        guard index > -1 else { return nil }
        guard index > 0 else { return self }
        return nextItem?.item(at: index - 1)
    }
    
    public func prepend(value: T) -> List {
        let list = List(value)
        list.nextItem = self
        return list
    }
    
    public var reversed: List<T> {
        var item = self.nextItem
        var reversed = List(value)
        
        while let currentItem = item {
            let next = List(currentItem.value)
            next.nextItem = reversed
            reversed = next
            item = currentItem.nextItem
        }
        
        return reversed
    }
    
    public func skip(_ count: Int) -> List? {
        guard count > 0 else { return self }
        return nextItem?.skip(count - 1)
    }
    
    public var flattened: List {
        let list: List = value as? List ?? List(value)
        list.lastItem.nextItem = nextItem?.flattened
        return list
    }
    
    public func decode<Y>() -> List<Y>? {
        guard let decoded = value as? (Int, Y) else { return nextItem?.decode() }
        let list = List<Y>(decoded.1)
        var last = list
        for _ in 0 ..< (decoded.0 - 1) {
            let newLast = List<Y>(decoded.1)
            last.nextItem = newLast
            last = newLast
        }
        last.nextItem = nextItem?.decode()
        return list
    }
    
    public func drop(every offset: Int) -> List? {
        return drop(every: offset, index: 1)
    }
    
    public func duplicate(_ count: Int = 2) -> List {
        // Solves P14 and P15
        let list = List(value)
        var dupe = list
        for _ in 0 ..< count - 1 {
            let nextDupe = List(value)
            dupe.nextItem = nextDupe
            dupe = nextDupe
        }
        dupe.nextItem = nextItem?.duplicate(count)
        return list
    }
    
    private func drop(every offset: Int, index: Int) -> List? {
        guard index % offset != 0 else { return nextItem?.drop(every: offset, index: index + 1) }
        let list = List(value)
        list.nextItem = nextItem?.drop(every: offset, index: index + 1)
        return list
    }
    
    public func split(at index: Int) -> (left: List?, right: List?) {
        let split = nextItem?.split(at: index - 1)
        
        var right = split?.right
        var left = split?.left
        if index <= 0 {
            let newRight = List(value)
            newRight.nextItem = right
            right = newRight
        } else {
            let newLeft = List(value)
            newLeft.nextItem = left
            left = newLeft
        }
        return (left: left, right: right)
    }
    
    public func slice(from: Int, to: Int) -> List? {
        guard from >= 0 else { return nil }
        guard to >= 1 else { return nil }
        
        let nextSlice = nextItem?.slice(from: max(from - 1, 0), to: to - 1)
        guard from == 0 else { return nextSlice }
        
        let slice = List(value)
        slice.nextItem = nextSlice
        
        return slice
    }
    
    public func rotate(_ amount: Int) -> List {
        let count = self.count
        var amount = amount % count
        guard amount != 0 else { return self }
        amount = amount < 0 ? count + amount : amount
        
        let right = self.slice(from: 0, to: amount)
        let left = self.slice(from: amount, to: count)!
        
        left.lastItem.nextItem = right
        return left
    }
    
    public func removeAt(_ position: Int) -> (rest: List?, removed: T?) {
        let next = nextItem?.removeAt(position - 1)
        guard position != 0 else { return (rest: next?.rest, removed: value)  }
        let list = List(value)
        list.nextItem = next?.rest
        return (rest: list, removed: next?.removed)
    }
    
    public func append(_ newValue: T) -> List {
        let copy = self.copy()
        copy.lastItem.nextItem = List(newValue)
        return copy
    }
    
    public func insert(_ newValue: T, at index: Int) -> List {
        let next = nextItem?.insert(newValue, at: index - 1)
        var list = List(value)
        if index == 1, next == nil {
            list.nextItem = List(newValue)
        } else {
            list.nextItem = next
        }
        if index == 0 {
            let inserted = List(newValue)
            inserted.nextItem = list
            list = inserted
        }
        return list
    }
    
    public func randomSelect(amount: Int) -> List? {
        guard amount > 0 else { return nil }
        let removed = self.removeAt(Int.random(in: 0 ..< self.count))
        guard let randomValue = removed.removed else { return nil }
        let list = List(randomValue)
        list.nextItem = removed.rest?.randomSelect(amount: amount - 1)
        return list
    }
    
    public class func lotto(count: Int, maximumValue: Int) -> List<Int> {
        let numbers = range(from: 1, to: maximumValue)
        return numbers!.randomSelect(amount: count)!
    }
    
    public func randomPermute() -> List {
        return randomSelect(amount: count)!
    }
    
    private func spaces(_ group: Int) -> String {
        return Array(0 ..< 3 - group).map({ _ in "  " }).joined()
    }
    
    public func combinations(group: Int, recursive: Bool = true) -> List<List<T>>? {
        guard group > 0 else { return nil }
        guard group > 1 else { return List<List<T>>(List(value)) }
        
        var lists: List<List<T>>?
        let addToList = { (list: List<T>) in
            guard let _lists = lists else {
                lists = List<List<T>>(list)
                return
            }
            _lists.lastItem.nextItem = List<List<T>>(list)
        }
        
        var first = true
        self.forEachNode { (list) in
            guard !first else { first = false; return }
            guard let sublists = list.combinations(group: group - 1, recursive: false) else { return }
            
            sublists.forEach({ sublist in
                guard sublist.count == group - 1 else { return }
                let newFirstNode = List(value)
                newFirstNode.nextItem = sublist.copy()
                addToList(newFirstNode)
            })
        }
        
        if recursive {
            lists?.lastItem.nextItem = nextItem?.combinations(group: group)
        }
        return lists
    }
    
    public func permutations(_ group: Int) -> List<List<T>>? {
        guard group >= 1 else { return nil }
        guard group > 1 else {
            let allMutations = List<List<T>>(List(self.value))
            for i in 1 ..< self.count {
                allMutations.lastItem.nextItem = List<List<T>>(List(self.item(at: i)!.value))
            }
            return allMutations
        }
        
        let allMutations = List<List<T>>(List(self.value))
        
        for i in 0 ..< self.count {
            let removed = self.removeAt(i)
            guard let removedValue = removed.removed else { continue }
            guard let mutations: List = removed.rest else { continue }
            
            guard let subpermutations: List<List<T>> = mutations.permutations(group - 1) else { continue }
            
            subpermutations.forEach({ (mutation: List) in
                let first = List(removedValue)
                first.nextItem = mutation
                
                guard first.count == group else { return }
                allMutations.lastItem.nextItem = List<List<T>>(first)
            })
        }
        
        return allMutations.nextItem
    }
    
    public func forEach(_ body: (T) -> Void) {
        body(value)
        nextItem?.forEach(body)
    }
    
    private func forEachNode(_ body: (List) -> Void) {
        body(self)
        nextItem?.forEachNode(body)
    }
}

extension List where T:Equatable {
    public var isPalindrome: Bool {
        let reversed = self.reversed
        for i in 0 ..< self.count {
            guard self[i] == reversed[i] else { return false }
        }
        return true
    }
    
    public var compressed: List {
        guard let nextItem = nextItem else { return List(value) }
        // Find the next item that isn't a duplicate
        guard nextItem.value != value else {
            return nextItem.compressed
        }
        
        let list = List(value)
        list.nextItem = nextItem.compressed
        return list
    }
    
    private var duplicates: List<T> {
        guard let nextItem = nextItem else { return List(value) }
        guard nextItem.value == value else { return List(value) }
        let list = List(value)
        list.nextItem = nextItem.duplicates
        return list
    }
    
    public var packed: List<List<T>> {
        let duplicates = self.duplicates
        let list = List<List<T>>(duplicates)
        guard let next = self.skip(duplicates.count) else {
            return list
        }
        
        list.nextItem = next.packed
        return list
    }
    
    public var encoded: List<(Int, T)> {
        let encodedValue = (self.duplicates.count, value)
        let list = List<(Int, T)>(encodedValue)
        guard let next = self.skip(encodedValue.0) else {
            return list
        }
        
        list.nextItem = next.encoded
        return list
    }
    
    public var encodeDirect: List<(Int, T)> {
        // I solved 09 and 13 together
        return encoded
    }
    
    public var encodedModified: List<Any> {
        let encodedValue = (self.duplicates.count, value)
        let list: List<Any>
        if encodedValue.0 == 1 {
            list = List<Any>(value)
        } else {
            list = List<Any>(encodedValue)
        }
        guard let next = self.skip(encodedValue.0) else {
            return list
        }
        
        list.nextItem = next.encodedModified
        return list
    }
}

extension List {
    public class func range(from: Int, to: Int) -> List<Int>? {
        guard from <= to else { return nil }
        let values: [Int] = Array(from ... to)
        return List<Int>(values)
    }
}
