//
//  Loading.swift
//  KidsApp
//
//  Created by Oleh Haidar on 28.09.2021.
//

import SwiftUI

extension View {
    func loading(isShowing: Binding<Bool>,
                 hideContent: Bool = false,
                 section: Bool = false) -> some View {
        return modifier(SQLoading(isShowing: isShowing,
                                  hideContent: hideContent,
                                  section: section))
    }
}

struct Loading: View {
    var body: some View {
        VStack {
            LottieView(fileName: "loadingDots")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingSuccess: View {
    var body: some View {
        VStack {
            LottieView(fileName: "loadingSuccess")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingCorrect: View {
    var body: some View {
        VStack {
            LottieView(fileName: "correct")
                .frame(width: 150, height: 150)
        }
    }
}

struct LoadingWrong: View {
    var body: some View {
        VStack {
            LottieView(fileName: "wrong")
                .frame(width: 150, height: 150)
        }
    }
}

struct LoadingSignOut: View {
    var body: some View {
        VStack {
            LottieView(fileName: "signOut")
                .frame(width: 100, height: 100)
        }
    }
}

struct LoadingSavings: View {
    var body: some View {
        VStack {
            LottieView(fileName: "savings")
                .frame(width: 80, height: 80)
        }
    }
}

struct LoadingWallet: View {
    var body: some View {
        VStack {
            LottieView(fileName: "wallet")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingPig: View {
    var body: some View {
        VStack {
            LottieView(fileName: "pig1")
                .frame(width: 400, height: 400)
        }
    }
}

struct LoadingTransfer: View {
    var body: some View {
        VStack {
            LottieView(fileName: "flyingMoney")
                .frame(width: 220, height: 220)
        }
    }
}

struct LoadingCharityBox: View {
    var body: some View {
        VStack {
            LottieView(fileName: "charityBox")
                .frame(width: 300, height: 300)
        }
    }
}

struct LoadingMaintanance: View {
    var body: some View {
        VStack {
            LottieView(fileName: "maintanance")
                .frame(width: 350, height: 350)
        }
    }
}

struct SQLoading: ViewModifier {
    
    private static let transition = AnyTransition.opacity.animation(.easeInOut(duration: 0.5))
    
    @Binding var isShowing: Bool
    
    private let hideContent: Bool
    private let section: Bool
    
    init(isShowing: Binding<Bool>, hideContent: Bool = false, section: Bool = false) {
        self._isShowing = isShowing
        self.hideContent = hideContent || section
        self.section = section
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            if hideContent {
                if isShowing {
                    loader
                } else {
                    content
                        .transition(Self.transition)
                }
            } else {
                content
                    .disabled(isShowing)
                if isShowing { loader }
            }
        }
    }
    
    private var loader: some View {
        Group {
            if section {
                sectionLoader
            } else {
                fullScreenLoader
            }
        }
    }
    
    private var fullScreenLoader: some View {
        LottieView(fileName: "loadingDots", isAnimating: isShowing)
            .frame(width: 200, height: 200)
    }
    
    private var sectionLoader: some View {
        LottieView(fileName: "loadingDots")
            .frame(width: 35, height: 10)
    }
}
