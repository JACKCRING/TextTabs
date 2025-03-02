//
//  ContentView.swift
//  TextTabs
//
//  Created by JACKCRING.COM on 2025/3/2.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0 // 当前选中的 Tab
  private let tabItems = ["计价器", "记录本", "调价申请", "我的"] // Tab 选项

  var body: some View {
    ZStack {
      // 全局背景颜色
      Color.black
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 0) {
        TabView(selection: $selectedTab) {
          ForEach(0 ..< tabItems.count, id: \.self) { index in
            Text(tabItems[index])
              .font(.largeTitle)
              .tag(index)
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(RoundedRectangle(cornerRadius: 24).fill(Color.baseBG))
        .edgesIgnoringSafeArea(.top)

        TextTabBar(selectedTab: $selectedTab, tabItems: tabItems)
      }
    }
  }
}

#Preview {
  ContentView()
}
