import Foundation

// <要件>
// printLine(line: String)を実行すると、"【プリント番号-ラベル】: <引数>"の形式でログ出力する
// プリント番号は初回は1でprintLineごとにインクリメントされる
// 出力する文言を"**"で囲むプリンタの作成
// 出力する文言を"()"で囲むプリンタの作成、"【yyyy/MM/dd hh:mm:ss-ラベル】: <引数>"の形式でログ出力する

//public class Printer {
//    
//    // ラベル
//    var title: String
//    // プリント番号
//    var count: Int = .zero
//    
//    public init(title: String) {
//        
//        self.title = title
//    }
//    
//    public func printLine(line: String) {
//        
//        print(makePrintLineString(line: line))
//        
//        count += 1
//    }
//    
//    public func makePrintLineString(line: String) -> String {
//        
//        return "【\(count)-\(title)】: \(line)"
//    }
//}
//
//public class StrongPrinter: Printer {
//    
//    public override func printLine(line: String) {
//        
//        super.printLine(line: "** \(line) **")
//    }
//}
//
//public class WeakPrinter: Printer {
//    
//    public override func printLine(line: String) {
//        
//        super.printLine(line: "(\(line))")
//    }
//    
//    public override func makePrintLineString(line: String) -> String {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
//        let dateString = dateFormatter.string(from: Date())
//        return "【\(dateString)-\(title)】: \(line)"
//    }
//}

// <要件>
// printLine(line: String)を実行すると、"【プリント番号-ラベル】: <引数>"の形式でログ出力する
// プリント番号は初回は1でprintLineごとにインクリメントされる
// 出力する文言を"**"で囲むプリンタの作成
// 出力する文言を"()"で囲むプリンタの作成、"【yyyy/MM/dd hh:mm:ss-ラベル】: <引数>"の形式でログ出力する
// ↓ *追加要件* ↓
// 出力する文言を番号の数分"/"で囲むプリンタの作成、またプリンタ番号の上限は10までとしそれを超えると0に戻る

public class Printer {
    
    // ラベル
    var title: String
    // プリント番号
    var count: Int = .zero
    
    public init(title: String) {
        
        self.title = title
    }
    
    public func printLine(line: String) {
        
        print(makePrintLineString(line: line))
        
        if count < 10 {
            
            count += 1
        }
        else {
            
            count = .zero
        }
    }
    
    func makePrintLineString(line: String) -> String {
        
        return "【\(count)-\(title)】: \(line)"
    }
}

public class StrongPrinter: Printer {
    
    public override func printLine(line: String) {
        
        super.printLine(line: "** \(line) **")
    }
}

public class WeakPrinter: Printer {
    
    public override func printLine(line: String) {
        
        super.printLine(line: "(\(line))")
    }
    
    public override func makePrintLineString(line: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        return "【\(dateString)-\(title)】: \(line)"
    }
}

public class IncrementSlashEffectPrinter: Printer {
    
    public override func printLine(line: String) {
        
        // count分"/"を繰り返す文字列を生成
        let effectString = Array(repeating: "/", count: count).joined()
        // プリントを出力
        super.printLine(line: "\(effectString) \(line) \(effectString)")
    }
}
