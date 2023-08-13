import ArrayHeap
import XCTest

final class ArrayHeapTests: XCTestCase {
    
    func testMinHeapify() throws {
        var array = [2,1,3]
        array.minHeapify()
        XCTAssertEqual(array.heapTop, 1)
        XCTAssertEqual(array.minHeapRemoveTop(), 1)
        XCTAssertEqual(array.minHeapRemoveTop(), 2)
        XCTAssertEqual(array.minHeapRemoveTop(), 3)
        XCTAssertEqual(array.minHeapRemoveTop(), nil)
    }
    
    func testMaxHeapify() throws {
        var array = [2,1,3]
        array.maxHeapify()
        XCTAssertEqual(array.heapTop, 3)
        XCTAssertEqual(array.maxHeapRemoveTop(), 3)
        XCTAssertEqual(array.maxHeapRemoveTop(), 2)
        XCTAssertEqual(array.maxHeapRemoveTop(), 1)
        XCTAssertEqual(array.maxHeapRemoveTop(), nil)
    }
    
    func testMinInsertion() throws {
        var array: [String] = []
        array.minHeapInsert("bob")
        array.minHeapInsert("pete")
        array.minHeapInsert("mark")
        array.minHeapInsert("alice")
        XCTAssertEqual(array.minHeapRemoveTop(), "alice")
        XCTAssertEqual(array.minHeapRemoveTop(), "bob")
        XCTAssertEqual(array.minHeapRemoveTop(), "mark")
        XCTAssertEqual(array.minHeapRemoveTop(), "pete")
    }
    
    func testMaxInsertion() throws {
        var array: [String] = []
        array.maxHeapInsert("bob")
        array.maxHeapInsert("pete")
        array.maxHeapInsert("mark")
        array.maxHeapInsert("alice")
        XCTAssertEqual(array.maxHeapRemoveTop(), "pete")
        XCTAssertEqual(array.maxHeapRemoveTop(), "mark")
        XCTAssertEqual(array.maxHeapRemoveTop(), "bob")
        XCTAssertEqual(array.maxHeapRemoveTop(), "alice")
    }
    
    func testLargeMinHeap() {
        let numbers = Array(0...100_000)
        var minHeap = numbers.shuffled().minHeapified()
        for number in numbers {
            XCTAssertEqual(number, minHeap.minHeapRemoveTop())
        }
    }
    
    func testLargeMaxHeap() {
        let numbers = Array(0...100_000)
        var maxHeap = numbers.shuffled().maxHeapified()
        for number in numbers.reversed() {
            XCTAssertEqual(number, maxHeap.maxHeapRemoveTop())
        }
    }

    func testReadme1() {
        var heap = [Int]()
        heap.minHeapInsert(2)
        XCTAssertEqual(heap.heapTop, 2)
        heap.minHeapInsert(3)
        XCTAssertEqual(heap.heapTop, 2)
        heap.minHeapInsert(1)
        XCTAssertEqual(heap.heapTop, 1)
        XCTAssertEqual(heap.minHeapRemoveTop(), 1)
        XCTAssertEqual(heap.heapTop, 2)
    }

    func testReadme2() {
        let items = Array(1...100)
        var heap = items.maxHeapified()
        XCTAssertEqual(heap.heapTop, 100)
        heap.minHeapify()
        XCTAssertEqual(heap.heapTop, 1)
    }
}
