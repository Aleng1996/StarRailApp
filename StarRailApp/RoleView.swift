//
//  ContentView.swift
//  StarRailApp
//
//  Created by A Leng on 2023/8/3.
//

import SwiftUI

struct RoleView: View {
    
    @State var editMode: EditMode = .inactive
    @State var role = RoleFormation.ChaList
    @State var selectedRoleID = Set<RoleFormation.ID>()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack{
                Text("角色資訊")
                    .padding(.horizontal)
                    .font(.title.bold())
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                List($role, editActions: .all, selection: $selectedRoleID){
                    $role in HStack{
                        HStack{
                            Image(role.image)
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 55, alignment: .leading)
                            Text(role.name)
                                .font(.title2.bold())
                                .foregroundColor(.black)
                        }
                    }
                }
                .sheet(isPresented: .constant(true)){
                    let role = role.first!
                    
                    HStack{
                        Image(role.image)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 180, alignment: .leading)
                            .padding(.horizontal)
                        VStack{
                            Text(role.name)
                                .font(.title.bold())
                                .padding(.bottom)
                            Grid(horizontalSpacing: 12, verticalSpacing: 12){
                                buildNutritionView(title: "技能", value: role.skill)
                                buildNutritionView(title: "終結技", value: role.ultimate)
                                buildNutritionView(title: "天賦", value: role.talent)
                                buildNutritionView(title: "戰技", value: role.technique)
                            }
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .presentationDetents([.medium])
                }
            }
        }
        .listRowBackground(Color.clear)
        .listStyle(.plain)
    }
    func buildNutritionView(title: String, value: String) -> some View{
        GridRow{
            Text(title).gridCellAnchor(.leading)
            Text(value).gridCellAnchor(.trailing)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RoleView()
    }
}
