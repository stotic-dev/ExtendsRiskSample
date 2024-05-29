import Foundation

// printLine(line: String)を実行すると、"【プリント番号-ラベル】: <引数>"の形式でログ出力する
// プリント番号は初回は1でprintLineごとにインクリメントされる

class Printer {
    
    var title: String
    var count: Int = .zero
    
    init(line: String) {
        
        self.title = line
    }
    
    func printLine(line: String) {
        
        print(makePrintLineString(line: line))
    }
    
    func makePrintLineString(line: String) -> String {
        
        if count <= 10 {
            
            count += 1
        }
        else {
            
            count = 1
        }
//        count += 1
        return "【\(count)-\(title)】: \(line)"
    }
}

class StrongPrinter: Printer {
    
    override func printLine(line: String) {
        
        super.printLine(line: "** \(line) **")
    }
}

class WeakPrinter: Printer {
    
    override func printLine(line: String) {
        
        super.printLine(line: "(\(line))")
    }
}

class IncrementSlashEffectPrinter: Printer {
    
    override func printLine(line: String) {
        
        let effectString = Array(repeating: "/", count: count).joined()
        super.printLine(line: "\(effectString) \(line) \(effectString)")
    }
}

public func polymorphism_extends() {
    
    let strongPrinter = StrongPrinter(line: "strong line")
    let weakPrinter = WeakPrinter(line: "weak line")
    let slashPrinter = IncrementSlashEffectPrinter(line: "slash line")
    
    for _ in 1...100 {
        
        let randomInt = Int.random(in: 1...3)
        if randomInt == 1 {
            
            strongPrinter.printLine(line: "sample1")
        }
        else if randomInt == 2 {
            
            weakPrinter.printLine(line: "sample2")
        }
        else {
            
            slashPrinter.printLine(line: "sample3")
        }
    }
}
