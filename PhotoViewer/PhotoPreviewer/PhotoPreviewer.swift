//
//  PhotoPreviewer.swift
//  PhotoPreviewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        .init(date: Date(), relevance: nil, bird: .default)
    }
    
    func getSnapshot(for configuration: PhotoSelectionIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(.init(date: Date(), relevance: nil, bird: .default))
    }
    
    func getTimeline(for configuration: PhotoSelectionIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        
        let entries = Kingfisher.all.map {
            SimpleEntry(date: Date(), relevance: nil, bird: $0)
        }
        completion(.init(entries: entries, policy: .atEnd))
    }
    
    typealias Intent = PhotoSelectionIntent
    typealias Entry = SimpleEntry
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let relevance: TimelineEntryRelevance?
    let bird: Kingfisher
}

struct PhotoPreviewerEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    var body: some View {
        PhotoView(kingfisher: entry.bird)
    }
}

@main
struct PhotoPreviewer: Widget {
    let kind: String = "PhotoPreviewer"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PhotoSelectionIntent.self, provider: Provider()) { entry in
            PhotoPreviewerEntryView(entry: entry)
        }
        .configurationDisplayName("Bird")
        .supportedFamilies([.systemSmall])
    }
}

struct PhotoPreviewer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoPreviewerEntryView(entry: .init(date: Date(), relevance: nil, bird: .default))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
