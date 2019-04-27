
import UIKit

enum Language {
    case arabic, english, both
    
    var regex: String {
        switch self {
        case .arabic:
            // ref: https://stackoverflow.com/a/29729405/6934314
            return #"^[\u0621-\u064A\u0660-\u0669 ]+$"#
        case .english:
            // ref: my self
            return #"[A-Za-z]*"#
        default:
            return ""
        }
    }
}

extension String {
    
    /// Validate if regex matches or not
    ///
    /// - Parameter regex: regular expression
    /// - Returns: true if matches the given regex
    ///
    /// - Author: Abdullah Alhaider
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression) != nil
    }
}

func checkLang(_ text: String) -> Language {
    if text.matches(Language.arabic.regex) {
        return .arabic
    } else if text.matches(Language.english.regex) {
        return .english
    } else {
        return .both
    }
}

let arText = "السلام عليكم"
let enText = "Hello World 4"

print(checkLang(arText))
print(checkLang(enText))
