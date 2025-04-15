//
//  ContentViewModel.swift
//  progress-watch Watch App
//
//  Created by Shohei Yamasaki on 2025/04/15.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published var progressTime: String = "";
    
    private var dayTimestamp: Double = 86400.0;
    
    init() {
        update();
    }
        
    public func update() {
        let calendar = Calendar(identifier: .gregorian);
        
        let now: Date = Date();
        let nowTimestamp = now.timeIntervalSince1970;
        
        let startOfDay: Date = calendar.startOfDay(for: now);
        let startTimestamp = startOfDay.timeIntervalSince1970;
        
        let diffTimestamp = nowTimestamp - startTimestamp;
        let rawProgress = diffTimestamp / Double(dayTimestamp) * 100;
        let progress = String(format: "%.4f", rawProgress);
        
        progressTime = "\(progress)";
    }
    
}
