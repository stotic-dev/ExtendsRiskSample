import UIKit

// MARK: - 継承版の解説

class PrintExecuter {
    
    private var printers: [Printer] = []
    
    init(printers: [Printer]) {
        
        self.printers = printers
    }
    
    func execute(printString: String) {
        
        printers.forEach { printer in
            
            for _ in 1...15 {
                
                printer.printLine(line: printString)
            }
        }
    }
}

let strongPrinter = StrongPrinter(title: "strong")
let weakPrinter = WeakPrinter(title: "weak")

let executer = PrintExecuter(printers: [strongPrinter, weakPrinter])
executer.execute(printString: "sample message")

//let strongPrinter = StrongPrinter(title: "strong")
//let weakPrinter = WeakPrinter(title: "weak")
//let slashPrinter = IncrementSlashEffectPrinter(title: "slash")
//
//let executer = PrintExecuter(printers: [strongPrinter, weakPrinter, slashPrinter])
//executer.execute(printString: "sample message")

// MARK: - interface版の解説

//class PrintExecuter2 {
//    
//    private var printers: [Printable] = []
//    
//    init(printers: [Printable]) {
//        
//        self.printers = printers
//    }
//    
//    func execute(printString: String) {
//        
//        printers.forEach { printer in
//            
//            for _ in 1...15 {
//                
//                printer.printLine(line: printString)
//            }
//        }
//    }
//}
//
//let strongPrinter = StrongPrinter2(title: "strong", formatter: PrintFormatter())
//let weakPrinter = WeakPrinter2(title: "weak", formatter: PrintFormatter())
//let slashPrinter = IncrementSlashEffectPrinter2(title: "slash", formatter: PrintFormatter())
//
//let executer = PrintExecuter2(printers: [strongPrinter, weakPrinter, slashPrinter])
//executer.execute(printString: "sample message")
