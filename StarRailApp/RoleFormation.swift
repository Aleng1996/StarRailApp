//
//  RoleFormation.swift
//  StarRailApp
//
//  Created by A Leng on 2023/8/3.
//

import Foundation

struct RoleFormation: Equatable, Identifiable {
    
    var id = UUID()
    
    var strLevel: Int
    var name: String
    var image: String
    var paths: String
    var combatTypes: String
    var skill: String
    var ultimate: String
    var talent: String
    var technique: String
    
    static let FiStrCha = [
    RoleFormation(strLevel: 5, name: "景元", image: "景元", paths: "智識", combatTypes: "雷", skill: "紫霄震曜", ultimate: "吾身光明", talent: "斬勘神形", technique: "攝召威靈"),
    RoleFormation(strLevel: 5, name: "刃", image: "刃", paths: "毀滅", combatTypes: "風", skill: "地獄變", ultimate: "大辟萬死", talent: "倏忽恩賜", technique: "業途風"),
    RoleFormation(strLevel: 5, name: "希兒", image: "希兒", paths: "巡獵", combatTypes: "量子", skill: "歸刃", ultimate: "亂蝶", talent: "再現", technique: "幻身"),
    RoleFormation(strLevel: 5, name: "銀狼", image: "銀狼", paths: "虛無", combatTypes: "量子", skill: "是否允許更改？", ultimate: "｜帳號已封禁｜", talent: "等待程式響應...", technique: "｜強制結束進程｜"),
    RoleFormation(strLevel: 5, name: "羅剎", image: "羅剎", paths: "豐饒", combatTypes: "虛數", skill: "白花的祈望", ultimate: "歸葬的遂願", talent: "生息的輪轉", technique: "愚者的悲憫")
    ]
    
    static let FoStrCha = [
    RoleFormation(strLevel: 4, name: "馭空", image: "馭空", paths: "同諧", combatTypes: "虛數", skill: "天闕名弦", ultimate: "貫云飲羽", talent: "箭彻七禮", technique: "云鳶逐風"),
    RoleFormation(strLevel: 4, name: "停云", image: "停云", paths: "同諧", combatTypes: "雷", skill: "翔音和韻", ultimate: "慶云光覆儀禱", talent: "紫電扶搖", technique: "惠風和暢"),
    RoleFormation(strLevel: 4, name: "娜塔莎", image: "娜塔莎", paths: "豐饒", combatTypes: "物理", skill: "愛,救護與抉擇", ultimate: "新生之禮", talent: "生機換發", technique: "催眠研習")
    ]
    
    static let ChaList:Array<RoleFormation> = FiStrCha + FoStrCha
    
   
}
