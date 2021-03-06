//
//  AppRequestManager.swift
//  HPY9Pasture
//
//  Created by purepure on 17/1/9.
//  Copyright © 2017年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


typealias ResponseBlock = (success:Bool,response:AnyObject)->Void

class AppRequestManager: NSObject {
    
    //单例
//    class func shareManager()->AppRequestManager{
//        struct Singleton{
//            static var onceToken : dispatch_once_t = 0
//            static var single:AppRequestManager?
//        }
//        dispatch_once(&Singleton.onceToken,{
//            Singleton.single=shareManager()
//            }
//        )
//        return Singleton.single!
//    }
    //单例
    static let shareManager = AppRequestManager()
    private override init() {
                
    }
     //MARK:检查手机号是否注册
    func comfirmPhoneHasRegister(phoneNum:String,handle:ResponseBlock){
        
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        
        let url = Happy_HeaderUrl+"checkphone"
        let paraDic = ["phone":phoneNum]
        
        Alamofire.request(.GET, url, parameters: paraDic).response{request, response, json, error in
            let json = JSON(data:json!)
            NSLOG(request)
            NSLOG(json)
            indicator.stopAnimating()
            if json["status"].string != nil && json["status"].string == "success"{
                handle(success: true, response: json["data"].string!)
            }else{
                if json["data"].string != nil{
                    handle(success: false, response: json["data"].string!)
                }
                
            }
        }
    }
     //MARK:发送验证码
    func sendMobileCodeWithPhoneNumber(phoneNumber:String,handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        
        let url = Happy_HeaderUrl+"SendMobileCode"
        let paramDic = ["phone":phoneNumber]
        
        Alamofire.request(.GET, url, parameters: paramDic).response{request, response, json, error in
            let json = JSON(data:json!)
            NSLOG(request)
            NSLOG(json)
            indicator.stopAnimating()
            if json["status"].string != nil && json["status"].string == "success"{
                handle(success: true, response: json["data"]["code"].floatValue)
            }else{
                if json["data"].string != nil{
                    handle(success: false, response:json["data"].string!)
                }
            }
        }
        
    }
    //MARK:获取个人基本资料
    func getUserinfoWithUserId(userid:String,handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        
        let url = Happy_HeaderUrl+"getuserinfo"
        let paramDic = ["userid":userid]
        
        Alamofire.request(.GET, url, parameters: paramDic).response{request, response, json, error in
            let json1 = JSON(data:json!)
            NSLOG(request)
            NSLOG(json)
            NSLOG(json1)
            indicator.stopAnimating()
            if json1["status"].string != nil && json1["status"].string == "success"{
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
            }
        }
        
    }
    
    //MARK:注册
    func register(phone:String,password:String,
                  code:String,token:String,
            handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()

        let url = Happy_HeaderUrl+"AppRegister"
        let paramDic = ["phone":phone,"password":password,"devicetype":"1",
                        "code":code,"token":token
        ]
        
        Alamofire.request(.GET, url, parameters: paramDic).response { request, response, json, error in
            let json1 = JSON(data:json!)
            NSLOG(json)
            NSLOG(request)
            NSLOG(json1["data"]["code"])
            indicator.stopAnimating()
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
            
        }
    }
    
    //MARK:修改密码
    func forgetPassword(phone:String,code:String,password:String,handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"forgetpwd"
        let paramDic = ["phone":phone,"code":code,"password":password]
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            let json1 = JSON(data:json!)
            NSLOG(json)
            NSLOG(request)
            indicator.stopAnimating()
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
        }
    }
    //MARK:登录
    func login(phoneNum:String,password:String,registrationID:String,handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"applogin"
        let paramDic = ["phone":phoneNum,"password":password,"token":registrationID,"devicestate":"1"]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
            }
            
            }
    }
    
    //MARK:修改个人资料[姓名]
    func UpdateUserName(name:String,userid:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"UpdateUserName"
        let paramDic = ["userid":userid,"name":name]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
        }
    }
    //MARK:修改个人资料[头像]
    func UpdateUserAvatar(avatar:String,userid:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"UpdateUserAvatar"
        let paramDic = ["userid":userid,"avatar":avatar]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
        }
    }
    //MARK:修改个人资料[性别]
    func UpdateUserSex(userid:String,sex:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"UpdateUserSex"
        let paramDic = ["userid":userid,"sex":sex]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
        }
    }
    //MARK:修改个人资料[手机]
    func UpdateUserPhone(userid:String,phone:String, code:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"UpdateUserPhone"
        let paramDic = ["userid":userid,"phone":phone,"code":code]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
        }
    }
    //MARK:获取社区养老机构
    func getOrganizationList(cid:String,type:String,beginId:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"getOrganizationList"
        let paramDic = ["cid":cid,"type":type,beginId:"beginId"]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
        }
    }
    
    //MARK:获取社区服务者电话
    func getcommunityServiceListBycommunityId(communityId:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"getcommunityServiceListBycommunityId"
        let paramDic = ["cid":communityId]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
        }
    }
    //MARK:获取家庭厨房列表
    func getHomekitchenListByCommunityId(communityId:String,beginID:String,keyWord:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"getHomekitchenListByCommunityId"
        let paramDic = ["cid":communityId,"begin":beginID,"keyword":keyWord]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
            
        }
    }
    
    //MARK:获取家庭厨房食品列表
    func getFoodListByHomeId(foodID:String,beginID:String, handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"getFoodListByHomeId"
        let paramDic = ["hid":foodID,"begin":beginID]
        
        Alamofire.request(.GET,url, parameters: paramDic).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
                       
        }
    }
    //MARK:上传图片
    
    func uploadImage(imageName:String,imageData:NSData,handle:ResponseBlock){
        let indicator = JQIndicatorView.init(type: .BounceSpot1)
        indicator.startAnimating()
        let url = Happy_HeaderUrl+"uploadimg"
        
         ConnectModel.uploadWithImageName(imageName, imageData: imageData, URL: url) { (data) in
            NSLOG(data)
            let json1 = JSON(data:data!)
            NSLOG(json1)
            indicator.stopAnimating()
            if (json1["status"].string) != nil&&(json1["status"].string) == "success" {
                if json1["data"].string != nil{
                    handle(success: true, response:json1["data"].string!)
                }
            }else{
                if json1["data"].string != nil{
                handle(success: false, response:json1["data"].string!)
                }
            }
        }
        
        Alamofire.upload(.POST, url, data: imageData).response { request, response, json, error in
            NSLOG(json)
            NSLOG(request)
            let json1 = JSON(data:json!)
            NSLOG(json1)
            indicator.stopAnimating()
            
            if json1["status"].string != nil && json1["status"].string == "success"{
                //                print(result.datas)
                handle(success: true, response: json!)
            }else{
                if json1["data"].string != nil{
                    handle(success: false, response:json1["data"].string!)
                }
                
            }
        }
    }
    
    
}
