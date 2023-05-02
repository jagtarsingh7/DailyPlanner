//
//  EventModel.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-22.
//

struct EventModel:Hashable {
    var name: String
    var date:String
    var time:String
    var note:String
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(name)
          hasher.combine(date)
          hasher.combine(time)
          hasher.combine(note)
      }
}
