//
//  ContentView.swift
//  SUILesson1
//
//  Created by Григоренко Александр Игоревич on 17.01.2023.
//

import SwiftUI

/// Представление с контентом экрана мини приложения
struct ContentView: View {

    private enum Constants {
        static let defaultLabelText = "Текст лейбла для замены"
        static let showButtonText = "Показать"
        static let alertExampleText = "Пример алерта"
        static let sayAText = "Сказать А"
        static let sayAReplicText = "Аааааааа"
        static let sayBText = "Сказать Б"
        static let sayBReplicText = "Б-б-б"
        static let showActionSheetText = "Показать шторку"
        static let actionsText = "Действия"
        static let actionsExemples = "Пример ActionSheet"
        static let defaultEmptyText = ""
    }

    // MARK: - private properties

    @State private var isErrorFirstShown = false
    @State private var isErrorSecondShown = false
    @State private var isPresentedShown = false
    @State private var labelText = Constants.defaultLabelText

    // MARK: - public properties

    var body: some View {
        VStack {
            Form {
                Section {
                    Text(labelText)
                }

                Section {
                    makeFirstButton()
                }

                Section {
                    makeButtonWithDoubleButtonAlert()
                }

                Section {
                    makeActionSheertButton()
                }

                Section {
                    makeBottomActionSheerButton()
                }
            }
        }
    }

    private func makeFirstButton() -> some View {
        Button(
            action: {
                self.isErrorFirstShown = true
            },
            label: {
                Text(Constants.showButtonText)
            })
        .alert(isPresented: $isErrorFirstShown) {
            Alert(title: Text(Constants.alertExampleText))
        }
    }

    private func makeButtonWithDoubleButtonAlert() -> some View {
        Button(
            action: { self.isErrorSecondShown = true},
            label: { Text(Constants.showButtonText)})
        .alert(isPresented: $isErrorSecondShown) { Alert(
            title: Text(Constants.alertExampleText),
            primaryButton: .default( Text(Constants.sayAText),
                                     action: {labelText = Constants.sayAReplicText}),
            secondaryButton: .default(Text(Constants.sayBText),
                                      action: { labelText = Constants.sayBReplicText}))}
    }

    private func makeActionSheertButton() -> some View {
        Button(action: {
            self.isPresentedShown = true
        }, label: {
            Text(Constants.showActionSheetText)
        }).confirmationDialog(Constants.showActionSheetText, isPresented: $isPresentedShown, actions: {
            Text(Constants.actionsText)
        }) {
            Text(Constants.actionsExemples)
        }
    }

    private func makeBottomActionSheerButton() -> some View {
        Button(
            action: { self.isPresentedShown = true },
            label: { Text(Constants.showActionSheetText) })
        .confirmationDialog(
            Constants.showActionSheetText,
            isPresented: $isPresentedShown,
            actions: {
            Button(
                action: { labelText = Constants.defaultEmptyText },
                label: { Text(Constants.defaultEmptyText) }
            )})
        { Text(Constants.actionsExemples) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
