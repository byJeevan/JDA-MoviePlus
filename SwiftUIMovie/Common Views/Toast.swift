//
//  Toast.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

/*
 GeometryReader gives us the preferred size of the superview , thus allowing the perfect sizing for our Toast.
 ZStack stacks views on top of each other.
 The logic is trivial: if the toast is not supposed to be seen (isShowing == false), then we render the presenting view. If the toast has to be presented (isShowing == true), then we render the presenting view with a little bit of blur - because we can - and we create our toast next.
 The toast is just a VStack with a Text, with custom frame sizing, some design bells and whistles (colors and corner radius), and a default slide transition.
 */
struct Toast<Presenting>: View where Presenting: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    /// The text to show
    let text: Text

    var body: some View {

        GeometryReader { geometry in

            ZStack(alignment: .center) {

                self.presenting()
                    .blur(radius: self.isShowing ? 1 : 0)

                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)

            }

        }

    }

}

// added this method on View to make the Toast creation easier:
extension View {

    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }

}
