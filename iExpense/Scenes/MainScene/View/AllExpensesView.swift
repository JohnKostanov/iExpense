//
//  AllExpensesView.swift
//  iExpense
//
//  Created by Джон Костанов on 27/12/21.
//

import SwiftUI

struct AllExpensesView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: expenses.removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onAppear() {
                expenses.loadItems()
            }
            .onChange(of: expenses.items) { _ in
                expenses.saveItems()
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllExpensesView()
    }
}
