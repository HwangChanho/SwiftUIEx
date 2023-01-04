//
//  StopWatchContentView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2023/01/04.
//

import SwiftUI

// StopWatchContentView

struct StopWatchContentView: View {
    
    @State private var time: Double = 0
    @State private var isStart = false
    
    var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect() // autoconnect: 자동으로 연결
    
    var humanReaderbleTime: String {
        let sec = Int(time) % 60
        let min = Int(time) / 60
        
        let milliSec = time.truncatingRemainder(dividingBy: 1) // Int형이 아닐 경우에는 % 사용 불가
        let milliString = String(format: "%.1f", milliSec).split(separator: ".").last ?? "0"
        
        return String(format: "%02d", min) + " : " + String(format: "%02d", sec) + " : " + milliString
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                ClockTick()
    //            ClockNumber()
                SecondHand(sec: time)
                MinuteHand(min: time)
                
                CenterCircle()
                
                ZStack {
                    MilliClockTick()
                    HundredMilliSecHand(milliSec: time)
                    CenterCircle()
                }
                .offset(y: 70)
            }
            .onReceive(timer) { _ in
                withAnimation {
                    if isStart {
                        self.time += 0.1
                    }
                }
            }
            .padding(.bottom, 150)
            
            StartStopButton(isStart: $isStart)
                .padding(.bottom, 50)
            
            Text(humanReaderbleTime)
                .font(.largeTitle)
        }
    }
}

struct StartStopButton: View {
    
    @Binding var isStart: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                isStart = true
            } label: {
                Text("Start")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(.orange)
            }
            
            Button {
                isStart = false
            } label: {
                Text("stop")
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: 50)
                    .background(.orange.opacity(0.5))
            }
        }
    }
}

struct CenterCircle: View {
    var body: some View {
        Circle()
            .fill(.gray)
            .frame(width: 10, height: 10)
    }
}

struct ClockTick: View {
    
    var tickCount: Int = 60
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount, id: \.self) { tick in
                Rectangle()
                    .fill(.red)
                    .frame(width: 1, height: tick % 5 == 0 ? 23 : 10)
                    .offset(y: -140)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360 ))
            }
        }
    }
}

struct MilliClockTick: View {
    
    var tickCount: Int = 10
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount, id: \.self) { tick in
                Rectangle()
                    .fill(.black)
                    .frame(width: 1, height: 10)
                    .offset(y: 30)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360 ))
            }
        }
    }
}

//struct ClockNumber: View {
//
//    var tickCount: Double = 60
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<tickCount, id: \.self) { tick in
//                if tick % 5 == 0 {
//                    ZStack {
//                        Text("\(tick)")
//                            .rotationEffect(.degrees( Double(tick) / Double(tickCount) * -360 ))
//                    }
//                    .offset(y: -130)
//                    .rotationEffect(.degrees( .degrees( Double(tick) / Double(tickCount) * 360 ) ))
//                }
//            }
//        }
//    }
//}

struct SecondHand: View {
    
    var sec: Double
    private var height: CGFloat = 100
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        Rectangle()
            .fill(.orange)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(sec / 60 * 360))
    }
}

struct MinuteHand: View {
    
    var min: Double
    private var height: CGFloat = 70
    
    init(min: Double) {
        self.min = min
    }
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(min / 60 / 60 * 360))
    }
}

struct HundredMilliSecHand: View {
    
    var milliSec: Double
    private var height: CGFloat = 25
    
    init(milliSec: Double) {
        self.milliSec = milliSec
    }
    
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(milliSec / 60 * 60 * 360))
    }
}

struct StopWatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
