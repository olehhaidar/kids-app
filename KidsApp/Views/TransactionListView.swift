//
//  TransactionListView.swift
//  KidsApp
//
//  Created by Oleh Haidar on 11.03.2022.
//

import SwiftUI

struct TransactionListView: View {
    @Binding var currentIndex: Int
    @ObservedObject var cardManager: CardManager
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(getListHeaders(), id: \.self) { date in
                    ListHeader(title: cardManager.getModifiedDate(date: date))
                    ForEach(getTransactions(date: date), id: \.self) { transaction in
                        TransactionListRow(transaction: transaction, isLast: cardManager.lastTransactionID == transaction.id)
                    }
                }
            }
        }
    }
    
    func getTransactions(date: String) -> [TransactionItem] {
        return cardManager.getTransaction(for: date, number: creditCards[currentIndex].number)
    }
    
    func getListHeaders() -> [String] {
        return cardManager.getUniqueDates(for: creditCards[currentIndex].number)
    }
}

