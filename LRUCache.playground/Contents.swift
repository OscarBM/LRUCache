//: Playground - noun: a place where people can play

import UIKit

class LinkedNode {
    var v:Int = 0
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
    
    func get (_ value:Int) -> Int?{
        var result:Int? = 0
        
        
        
        s = hashT[value]
        p = s?.previous
        n = s?.next
        
        p?.next = n
        n?.previous = p
        result = s?.v
        
        //borrar s de hashT
        return result
    }
    
    func put (_ value:Int) -> Void{
        var LN:LinkedNode = LinkedNode(value)
        
        if hashT.count > 0 {
            tempHead = head
            LN.next = tempHead
            LN.previous = nil
            
            tempHead?.previous = LN
            
        }
        
        if tail == nil {
            tail = LN
        }
        
        head = LN
        
        hashT[value] = LN
        
        
        
        if hashT.count > limit {
            
            
            tempTail = tail?.previous
            tempTail?.next = nil
            //borrar tail
            //remover tail de hashT
            
            if let x = tail {
                hashT[tail!.v] = nil
            } else {
                
            }
            
            
            
            tail = tempTail
            //size -= 1
            
        }
        
    }
    
    
}

//------------------------ Extension --------------------------
extension LRUCache {
    var hashSize:Int {
        return self.hashT.count
    }
}



var l = LRUCache()

l.put(2)
print(l.hashT)
print(l.tail?.v)
l.put(3)
print(l.hashT)
print(l.tail?.v)
l.put(4)
print(l.hashT)
print(l.tail?.v)

print("---- Normal -----")
print("la cabeza es \(l.head?.v)")
print(l.head?.next?.v)
print(l.head?.next?.next?.v)


print("la cola es \(l.tail?.v)")


print("----- agregar un cuarto elemento -------")

l.put(5)
print(l.hashT)
print("la cabeza es \(l.head?.v)")
print(l.head?.next?.v)
//print(l.head?.next?.next?.v)
print("la cola es \(l.tail?.v)")
//print(l.tail?.v)
print("///////////////")
//print(l.get(3))
//print(l.head?.v)
//print(l.head?.next?.v)
//-------------- implementacion de extension -------------------
l.hashSize
