import UIKit

var str = "Hello, playground"

class LinkedNode {
    var v:Int?
    var next:LinkedNode?
    var previous:LinkedNode?
    
    //init(_ v1:Int, _ next1:LinkedNode?,_ previous1:LinkedNode?) {
    init(_ v1:Int) {
        self.v = v1
        //self.next = next1
        //self.previous = previous1
    }
    
}

class LRUCache {
    var tempHead:LinkedNode?
    var tempTail:LinkedNode?
    var head:LinkedNode?
    var tail:LinkedNode?
    let limit:Int = 3
    var size:Int = 0
    
    var hashT: [Int : LinkedNode] = [:]
    
    var n:LinkedNode?
    var p:LinkedNode?
    var s:LinkedNode?
    
    
    
    
    func put (_ value:Int) -> Void{
        var LN:LinkedNode = LinkedNode(value)
        
        if size != 0 {
            tempHead = head
            LN.next = tempHead
            LN.previous = nil
            
            tempHead?.previous = LN
        }
        
        head = LN
        size += 1
        
        hashT[value] = LN
        
        if size > limit {
            tempTail = tail?.previous
            tempTail?.next = nil
            //borrar tail
            //remover tail de hashT
            tail = tempTail
            size -= 1
        }
        
    }
    
    
}

var l = LRUCache()

l.put(2)
print(l.hashT)
l.put(3)
print(l.hashT)
l.put(4)
print(l.hashT)
l.put(5)
print(l.hashT)
