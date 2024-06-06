import Foundation

// printLine(line: String)を実行すると、"【プリント番号-ラベル】: <引数>"の形式でログ出力する
// プリント番号は初回は1でprintLineごとにインクリメントされる
// 出力する文言を"**"で囲むプリンタの作成
// 出力する文言を"()"で囲むプリンタの作成
// 出力する文言を番号の数分"/"で囲むプリンタの作成、またプリンタ番号の上限は10までとしそれを超えると0に戻る

// Printerのinterface
public protocol Printable {
    
    func printLine(line: String)
}

// Printerの共通処理を委譲するクラス
public class PrintFormatter {
    
    func format(title: String, count: Int, line: String) -> String {
        
        // フォーマットした文字列を生成
        return "【\(count)-\(title)】: \(line)"
    }
    
    public init() {}
}

public class StrongPrinter2: Printable {
    
    private let formatter: PrintFormatter
    // ラベル
    private let title: String
    // プリント番号
    private var count: Int = .zero
    
    public init(title: String, formatter: PrintFormatter) {
        
        self.title = title
        self.formatter = formatter
    }
    
    public func printLine(line: String) {
        
        print(formatter.format(title: title, count: count, line: "** \(line) **"))
        
        count += 1
    }
}

public class WeakPrinter2: Printable {
    
    private let formatter: PrintFormatter
    // ラベル
    private let title: String
    // プリント番号
    private var count: Int = .zero
    
    public init(title: String, formatter: PrintFormatter) {
        
        self.title = title
        self.formatter = formatter
    }
    
    public func printLine(line: String) {
        
        print(formatter.format(title: title, count: count, line: "(\(line))"))
        
        count += 1
    }
}

public class IncrementSlashEffectPrinter2: Printable {
    
    private let formatter: PrintFormatter
    // ラベル
    private let title: String
    // プリント番号
    private var count: Int = .zero
    
    public init(title: String, formatter: PrintFormatter) {
        
        self.title = title
        self.formatter = formatter
    }
    
    public func printLine(line: String) {
        
        let effectString = Array(repeating: "/", count: count).joined()
        print(formatter.format(title: title, count: count, line: "\(effectString) \(line) \(effectString)"))
        
        if count > 10 {
            
            count = .zero
        }
        else {
            
            count += 1
        }
    }
}
 
