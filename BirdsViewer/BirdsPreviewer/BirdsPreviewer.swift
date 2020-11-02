//
//  BirdsPreviewer.swift
//  BirdsPreviewer
//
//  Created by 熊 炬 on 2020/11/02.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), bird: .alice)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, bird: .alice)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        if let bird = Bird.bird(from: configuration.cuty?.identifier) {
            entries.append(.init(date: Date(), configuration: configuration, bird: bird))
        } else {
            entries.append(.init(date: Date(), configuration: configuration, bird: .bobby))
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    let configuration: ConfigurationIntent
    let bird: Bird
}

struct BirdsPreviewerEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        BirdView(bird: entry.bird)
    }
}

@main
struct BirdsPreviewer: Widget {
    let kind: String = "BirdsPreviewer"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            BirdsPreviewerEntryView(entry: entry)
        }
        .configurationDisplayName("Cute bird")
        .description("choose a cuty to display")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
