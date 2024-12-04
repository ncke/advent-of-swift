import Foundation

// MARK: - Memo

class Memo<Key: Hashable, Value> {

    private var memos = [Key: Value]()

    subscript(_ key: Key) -> Value? {
        get { memos[key] }
        set { memos[key] = newValue }
    }

    subscript(_ key: Key, else compute: (Key) -> Value) -> Value {
        if let memoised = memos[key] {
            return memoised
        }

        let computed = compute(key)
        memos[key] = computed
        return computed
    }

}

// MARK: - Memo Map

extension Array where Element: Hashable {

    func memoMap<T>(_ transform: (Element) -> T) -> [T] {
        let memo = Memo<Element, T>()
        return self.map { element in memo[element, else: transform] }
    }

}
