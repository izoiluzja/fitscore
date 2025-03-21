/*
 
 Copyright (c) <2020>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */
import Foundation

extension BFIELD {
    
    //MARK:- J : Int32
    /// 32-bit integer
    final public class J : BFIELD, ValueBField, ExpressibleByArrayLiteral{
        typealias ValueType = Int32Value
        typealias BaseType = Int32
        
        let name = "J"
        var val: [ValueType]?
        
        init(val: [ValueType]?){
            self.val = val
        }
        
        public init(val : [Int32]){
            self.val = val.map{Int32Value(integerLiteral: $0)}
        }
        
        public init(arrayLiteral : Int32Value...){
            self.val = arrayLiteral
        }
        
        override public var form: BFORM {
            return BFORM.J(r: val?.count ?? 0)
        }
        
        override public func format(_ disp: BDISP?, _ form: BFORM?, _ null: String?) -> String {
            
            self.form(disp, form, null)
        }
        
        override public var description: String {
            self.desc
        }
        
        override public var debugDescription: String {
            self.debugDesc
        }
        
        override public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(val)
        }
        
        override public subscript(_ index: Int) -> BFIELD.VALUE? {
            get {
                return val?[index]
            }
            set {
                if let new = newValue as? ValueType {
                    val?.insert(new, at: index)
                }
            }
        }
        
        override public var all: [BFIELD.VALUE] {
            return val ?? []
        }
    }
    
}
