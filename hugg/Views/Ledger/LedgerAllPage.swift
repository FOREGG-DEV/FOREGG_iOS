//
//  LedgerAllFragment.swift
//  hugg
//
//  Created by Donghan Kim on 1/15/25.
//

import SwiftUI

struct LedgerAllPage: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame(width: .infinity, height: 171)
                .overlay {
                    VStack {
                        HStack {
                            // TODO: Date text
                            Text("2024. 07. 17 - 2024. 08. 25")
                                .font(.h4)
                                .foregroundStyle(Constants.Colors.black70)
                            Spacer()
                            Image("tune")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                        Spacer()
                            .frame(height: 12)
                        
                        HStack {
                            HGTagWithoutText(color: Constants.Colors.accountbookPersonal)
                            Text("개인")
                                .font(.p1)
                                .foregroundStyle(Constants.Colors.black80)
                            Spacer()
                            Text("0원")
                                .font(.p1)
                                .foregroundStyle(Constants.Colors.black80)
                        }
                        
                        Spacer().frame(height: 20)
                        
                        HStack {
                            HGTagWithoutText(color: Constants.Colors.black20)
                            Text("지원금 전체")
                                .font(.p1)
                                .foregroundStyle(Constants.Colors.black80)
                            Spacer()
                            Text("0원")
                                .font(.p1)
                                .foregroundStyle(Constants.Colors.black80)
                        }
                        Divider()
                            .padding(.bottom, 8)
                        
                        HStack {
                            Text("총 지출")
                                .font(.h2)
                                .foregroundStyle(Constants.Colors.black90)
                            Spacer()
                            Text("0원")
                                .font(.h2)
                                .foregroundStyle(Constants.Colors.black90)
                        }
                        
                        Spacer()
                    }.padding(12)
                }
            Spacer()
                .frame(height: 16)
            
            HStack(spacing: 4) {
                Capsule(style: .circular)
                    .fill(Constants.Colors.black70)
                    .stroke(Constants.Colors.black70)
                    .frame(width: 78, height: 28)
                    .overlay {
                        Text("전체")
                            .font(.p2)
                            .foregroundStyle(.white)
                    }
                
                Capsule(style: .circular)
                    .fill(.white)
                    .stroke(Constants.Colors.black20)
                    .frame(width: 78, height: 28)
                    .overlay {
                        Text("개인")
                            .font(.p2)
                            .foregroundStyle(Constants.Colors.black60)
                    }
                
                Capsule(style: .circular)
                    .fill(.white)
                    .stroke(Constants.Colors.black20)
                    .frame(width: 78, height: 28)
                    .overlay {
                        Text("지원")
                            .font(.p2)
                            .foregroundStyle(Constants.Colors.black60)
                    }
                
                Spacer()
            }
            .padding(.bottom, 8)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ComponentPreviewContainer {
        LedgerAllPage()
    }
}
