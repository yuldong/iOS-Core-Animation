//
//  ContentView.swift
//  CAnimation
//
//  Created by yrion on 2020/4/2.
//  Copyright © 2020 yrion. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12, content: {
            Spacer()
            Text("0").font(.system(size: 76)).foregroundColor(.black).minimumScaleFactor(0.5).padding(.trailing, 24).lineLimit(1).frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, color: item.backgroudColor) {
                    print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 40
    let title: String
    let size: CGSize
    let color: Color
    let action: () -> Void
    
    var body: some View {
       Button(action: {
        self.action()
        }) {
            Text(title).font(.system(size: fontSize)).foregroundColor(.white).frame(width: size.width, height: size.height).background(color).cornerRadius(size.width / 2)
        }
    }
}
enum CalculatorButtonItem: Hashable {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "*"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, case value = 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroudColor: Color {
        switch self {
        case .digit(_), .dot:
            return .gray
        case .op(_):
            return .orange
        case .command(_):
            return .purple
        }
    }
}
