///
/// Array-Heap is an array extension to convert arrays of any
/// comparable elements into heaps (min or max).
///
extension Array where Element: Comparable {

    /// - Returns: Top element of the heap, if any, without removing it
    /// - Complexity: O(1)
    public var heapTop: Element? {
        first
    }

    /// - Returns: Top element of a **max** heap after removing it
    /// - Complexity: O(log n)
    public mutating func maxHeapRemoveTop() -> Element? {
        removeTop(comparator: >)
    }

    /// - Returns: Top element of a **min** heap after removing it
    /// - Complexity: O(log n)
    public mutating func minHeapRemoveTop() -> Element? {
        removeTop(comparator: <)
    }

    /// Insert one element into a **max** heap
    /// - Note: assumes array is already a **max** heap
    /// - Complexity: O(log n)
    public mutating func maxHeapInsert(_ element: Element) {
        insert(element, comparator: >)
    }

    /// Insert one element into a **min** heap
    /// - Note: assumes array is already a **min** heap
    /// - Complexity: O(log n)
    public mutating func minHeapInsert(_ element: Element) {
        insert(element, comparator: <)
    }

    /// Convert any array of comparable elements into a **max** heap
    /// - Complexity: O(n)
    public mutating func maxHeapify() {
        heapify(comparator: >)
    }

    /// Convert any array of comparable elements into a **min** heap
    /// - Complexity: O(n)
    public mutating func minHeapify() {
        heapify(comparator: <)
    }

    /// Make a **max** heap with the contents of the array
    /// - Complexity: O(n)
    public func maxHeapified() -> [Element] {
        var copy = self
        copy.heapify(comparator: >)
        return copy
    }

    /// Make a **min** heap with the contents of the array
    /// - Complexity: O(n)
    public func minHeapified() -> [Element] {
        var copy = self
        copy.heapify(comparator: <)
        return copy
    }

    // MARK: Private logic

    private mutating func removeTop(comparator: (Element, Element) -> Bool) -> Element? {
        guard !isEmpty else { return nil }
        swapAt(0, count -  1)
        let result = removeLast()
        sink(0, comparator: comparator)
        return result
    }

    private mutating func insert(_ element: Element, comparator: (Element, Element) -> Bool) {
        append(element)
        bubbleUp(count - 1, comparator: comparator)
    }

    private mutating func heapify(comparator: (Element, Element) -> Bool) {
        var index = count / 2
        while index >= 0 {
            sink(index, comparator: comparator)
            index -= 1
        }
    }

    private mutating func sink(_ parent: Int, comparator: (Element, Element) -> Bool) {
        let leftChild = parent * 2 + 1
        let rightChild = parent * 2 + 2
        guard leftChild < count else { return }

        let child: Int
        if rightChild >= count || comparator(self[leftChild], self[rightChild]) {
            child = leftChild
        } else {
            child = rightChild
        }

        if !comparator(self[parent], self[child]) {
            swapAt(parent, child)
            sink(child, comparator: comparator)
        }
    }

    private mutating func bubbleUp(_ child: Int, comparator: (Element, Element) -> Bool) {
        guard child > 0 else { return }
        let parent = (child - 1) / 2
        if !comparator(self[parent], self[child]) {
            swapAt(parent, child)
            bubbleUp(parent, comparator: comparator)
        }
    }
}
