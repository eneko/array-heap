# array-heap

This Swift package provides an extension for using arrays of `Comparable` elements as heaps (both min and max).

The extension uses the array itself as the store, meaning no additional memory storage is required.

## Usage

Empty arrays are already valid heaps! Because of this, elements can be inserted right away:

```swift
var heap = [Int]()
heap.minHeapInsert(2)
heap.heapTop // 2
heap.minHeapInsert(3)
heap.heapTop // 2
heap.minHeapInsert(1)
heap.heapTop // 1
heap.minHeapRemoveTop() // 1
heap.heapTop // 2
```

Arrays with existing items can be transformed into a heap in linear time `O(n)`:

```swift
let items = Array(1...100)
var heap = items.maxHeapified()
heap.heapTop // 100
heap.minHeapify()
heap.heapTop // 1
```

## Complexity

| Operation   | Time Complexity | Space Complexity |
| ----------- | --------------- | ---------------- |
| top         | O(1)            | O(1)             |
| removeTop   | O(log n)        | O(1)             |
| insert      | O(log n)        | O(1)             |
| heapify/ied | O(n)            | O(1)             |


