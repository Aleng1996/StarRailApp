//
//  ContentView.swift
//  StarRailApp
//
//  Created by A Leng on 2023/8/3.
//

import SwiftUI

struct RoleView: View {
    
    @Environment(\.editMode) var editMode
    @State var role = RoleFormation.ChaList
    @State var selectedRoleID = Set<RoleFormation.ID>()
    
    @State var shouldShowSheet = false
    
    var isEditing : Bool { editMode?.wrappedValue == .active }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack{
                HStack {
                    Text("角色資訊")
                        .font(.title.bold())
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    EditButton()
                        .buttonStyle(.bordered)
                        .padding(.horizontal)
                    
                }
                .padding()
                List($role, editActions: .all, selection: $selectedRoleID){
                    $role in HStack{
                        Image(role.image)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 55, alignment: .leading)
                        Text(role.name)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture{
                        if isEditing {return}
                        shouldShowSheet = true
                    }
                }
                .sheet(isPresented: $shouldShowSheet){
                    
                    let role = RoleFormation.ChaList[3]
                    
                    Text(role.name)
                        .font(.title.bold())
                        .padding(.bottom)
                    HStack{
                        Image(role.image)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 130, alignment: .leading)
                            .padding(.horizontal)
                        VStack{
                            
                            Grid(horizontalSpacing: 18, verticalSpacing: 12){
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
                
                if isEditing{
                    HStack{
                        delRole
                        addRole
                    }
                } else{
                    addRole
                }
            }
        }
        .listRowBackground(Color.clear)
        .listStyle(.plain)
    }
    
}
private extension RoleView{
    var addRole: some View{
        Button{
            
        } label: {
            Text("新增角色")
                .padding(.top)
                .font(.title2.bold())
                .foregroundColor(.indigo)
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear)
    }
    
    var delRole: some View{
        Button{
            role = role.filter{ !selectedRoleID.contains($0.id)}
        } label: {
            Text("刪除角色")
                .padding(.top)
                .font(.title2.bold())
                .foregroundColor(.indigo)
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear)
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
