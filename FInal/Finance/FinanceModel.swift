//
//  FinanceModel.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-21.
//



struct FinanceModel:Hashable {
    var name: String
    var category: String
    var date:String
    var time:String
    var amount:String
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(name)
          hasher.combine(category)
          hasher.combine(date)
          hasher.combine(time)
          hasher.combine(amount)
      }
}
