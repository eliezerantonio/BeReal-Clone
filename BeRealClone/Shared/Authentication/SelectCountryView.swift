//
//  SelectCountryView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 12/04/24.
//

import SwiftUI

struct SelectCountryView: View {
    var countries: [Country] = Country.allCountries

    @Binding var countryChosen: Country

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Select Country")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Button {
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }

                            Spacer()
                        } //: HStack
                    } //: ZStack
                    Spacer()
                } //: VStack
                .padding(.horizontal)

                VStack {
                    VStack {
                        List {
                            Section {
                                ForEach(countries, id: \.isoCode) { country in

                                    HStack {
                                        Text("\(country.flag(country: country.isoCode)) \(country.localizedName) (+\(country.phoneCode)) ")
                                        Spacer()
                                        if country.isoCode == countryChosen.isoCode {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.green)
                                        }
                                    } //: HStack
                                    .onTapGesture {
                                        countryChosen = country
                                        dismiss()
                                    }
                                } //: For
                            } //: Sectoon
                        header: {
                                Text("Suggested".uppercased())
                                    .padding(.leading, -8)
                                    .font(.system(size: 12))
                            }
                        } //: List
                    } //: VStack
                } //: VStack
                .padding(.top, 70)
            } //: ZStack
            .environment(\.colorScheme, .dark)
        } //: VStack
    }
}
