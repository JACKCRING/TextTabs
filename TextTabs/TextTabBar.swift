//
//  TextTabBar.swift
//  TextTabs
//
//  Created by JACKCRING BUREAU on 2025/3/3.
//

import SwiftUI

struct TextTabBar: View {
  @Binding var selectedTab: Int
  let tabItems: [String]

  var body: some View {
    VStack {
      ZStack(alignment: .leading) {
        // 胶囊背景
        let tabWidth = UIScreen.main.bounds.width / CGFloat(tabItems.count)
        Capsule()
          .fill(.capsule)
          .frame(width: tabWidth - 10, height: 34)
          .offset(x: CGFloat(selectedTab) * tabWidth + 5, y: 0)
          .animation(.bouncy(duration: 0.3), value: selectedTab)

        // Tab 按钮
        HStack(spacing: 0) {
          ForEach(0 ..< tabItems.count, id: \.self) { index in
            TabItemView(text: tabItems[index], isSelected: selectedTab == index)
              .frame(width: tabWidth, height: 50)
              .onTapGesture {
                withAnimation {
                  selectedTab = index
                }
              }
          }
        }
      }
      .padding(.vertical, 12)
      .background(Color.black)
    }
  }
}

// 单个 Tab 视图
struct TabItemView: View {
  let text: String
  let isSelected: Bool

  var body: some View {
    Text(text)
      .font(.system(size: 13))
      .foregroundColor(isSelected ? .black : .white)
      .fontWeight(isSelected ? .semibold : .semibold)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ContentView()
}
