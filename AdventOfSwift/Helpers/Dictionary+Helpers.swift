import Foundation

extension Dictionary where Value: RangeReplaceableCollection {

    /// Adds the given element to the array of elements maintained for
    /// the given key.
    mutating func collate(intoKey key: Key, _ element: Value.Element) {
        if var array = self[key] {
            array.append(element)
            self[key] = array
        } else {
            self[key] = [element] as? Value
        }
    }

}
