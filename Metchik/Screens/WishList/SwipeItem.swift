import SwiftUI
struct SwipeToDeleteEffect<Content: View>: View {
    @Binding var swipeToDeleteIndex: Int?
    let index: Int
    let content: () -> Content
    let onDelete: (() -> Void)?

    init(index: Int, swipeToDeleteIndex: Binding<Int?>, onDelete: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.index = index
        self._swipeToDeleteIndex = swipeToDeleteIndex
        self.content = content
        self.onDelete = onDelete
    }

    var body: some View {
        ZStack {
            HStack {
                if let swipeIndex = swipeToDeleteIndex, swipeIndex == index {
                    Spacer()
                    Button {
                        onDelete?()
                    } label: {
                        Image(systemName: "trash.fill")
                            .frame(width: 80,height: 100)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(13)
                            .transition(.move(edge: .leading))
                            .animation(.easeInOut)
                    }

                }
            }
            content()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Asset.Colors.backgroundScreenColor.swiftUIColor)
                .cornerRadius(13)
                .offset(x: swipeToDeleteIndex == index ? -50 : 0) // Move left when swiped
                .animation(.easeInOut)
                .padding(.horizontal,25)
                .shadow(color: .gray.opacity(0.3), radius: 20,x:-5,y: 20)
        }
        .gesture(
            DragGesture().onChanged { gesture in
                let translation = gesture.translation.width
                swipeToDeleteIndex = translation < -30 ? index : nil
            }
        )
    }
}
