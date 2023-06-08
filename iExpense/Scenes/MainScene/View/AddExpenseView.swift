//
//  AddView.swift
//  AddExpenseView
//
//  Created by Джон Костанов on 30/12/21.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $expenses.item.name)

                Picker("Type", selection: $expenses.item.type) {
                    ForEach(expenses.item.types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $expenses.item.amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    expenses.addItem()
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
