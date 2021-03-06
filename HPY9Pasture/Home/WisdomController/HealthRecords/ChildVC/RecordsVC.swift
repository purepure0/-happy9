//
//  RecordsVC.swift
//  HPY9Pasture
//
//  Created by purepure on 16/12/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RecordsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let myTableView = UITableView()
    let textArray = ["个人信息档案","个人电子病历档案","亲情圈"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = LGBackColor
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64-40*px)
        myTableView.separatorStyle = .None
        myTableView.sectionFooterHeight = 10*px
        self.view.addSubview(myTableView)

        // Do any additional setup after loading the view.
    }
    
    //MARK: ------UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 44*px
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        switch indexPath.section {
        case 0:
            let vc = PersonalMessagesViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
        case 1:
//            let vc = PersonalMessagesViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
        case 2:
            let vc = FamilyMessagesViewController()
            vc.textArray = ["王纯纯","李纯纯","张纯纯","时纯纯"]
            vc.title = "家族信息"
            vc.buttonText = "添加家属信息"
            vc.myFunc = {()->Void in
                //添加家族信息事件
                let vc1 = FamilyMessagesEditViewController()
                vc1.title = "添加家属信息"
                
                vc.navigationController?.pushViewController(vc1, animated: true)
            }
            vc.myIndexFunc = {(selectIndex,selectArray)->Void in
                //添加cell点击事件
                //                vc.navigationController?.pushViewController(vc1, animated: true)
            }
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
            
            
        default:
            break
        }
    }
    
    
    //MARK: ------TableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont.systemFontOfSize(13)
        cell.textLabel?.text = textArray[indexPath.section]
        
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        
        return cell
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.backgroundColor = LGBackColor
        footView.frame = CGRectMake(0, 0, WIDTH, 10*px)
        
        return footView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
