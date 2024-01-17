//
//  PremiumLockView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct PremiumLockView: View {
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            Image(systemName: "lock.fill")
                .font(.system(size: 20))
                .foregroundColor(.blue)
            Text("Premium")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.blue)
        }
    }
    
    
    private struct Constants {
        #warning("Localize")
        static let title: String = "Premium"
    }
}

#Preview {
    PremiumLockView()
}
