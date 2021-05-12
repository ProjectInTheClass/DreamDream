import UIKit
import Foundation

enum SleepEnough{
    case lack
    case enough
    case over
    
    func description() -> String{
        switch self{
        case .lack:
            return "수면이 부족합니다."
        case .enough:
            return ""
        case .over:
            return "과한 수면을 취하고 있습니다."
        }
    }
}

enum SleepPattern{
    case unstable
    case stable
    
    func description() -> String{
        switch self{
        case .unstable:
            return "수면 패턴이 불규칙적입니다."
        case .stable:
            return ""
        }
    }
}

enum SleepTime{
    case tooEalry
    case normal
    case late
    
    func description() -> String{
        switch self{
        case .tooEalry:
            return "너무 이른 시간에 수면을 취하고 있습니다."
        case .normal:
            return ""
        case .late:
            return "너무 늦은 시간에 수면을 취하고 있습니다."
        }
    }
}

enum Napping{
    case non
    case adequate
    case often
    
    func description() -> String{
        switch self{
        case .non:
            return "낮잠을 자도 괜찮습니다."
        case .adequate:
            return ""
        case .often:
            return "너무 자주 낮잠을 자고 있습니다."
        }
    }
}
