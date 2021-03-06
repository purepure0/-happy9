//
//  RetireServerViewController.swift
//  HPY9Pasture
//
//  Created by purepure on 16/10/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RetireServerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let RetireTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //解决title不居中问题
        
        let viewControllerArray = self.navigationController?.viewControllers
        let previousViewControllerIndex = (viewControllerArray?.indexOf(self))!-1
        var previous = UIViewController()
        if previousViewControllerIndex >= 0 {
            previous = viewControllerArray![previousViewControllerIndex]
            previous.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style:.Plain, target: self, action: nil)
        }
        
        self.view.backgroundColor = LGBackColor
        self.title = "退休远程认证"
        createTableView()
        // Do any additional setup after loading the view.
    }
    
    func createTableView(){
        RetireTableView.frame = CGRectMake(0, 0, Screen_W, Screen_H-64)
        RetireTableView.backgroundColor = LGBackColor
        RetireTableView.delegate = self
        RetireTableView.dataSource = self
        RetireTableView.separatorStyle = .None
        RetireTableView.tableFooterView = UIView()
        RetireTableView.sectionHeaderHeight = 30
        RetireTableView.registerNib(UINib(nibName: "RetireTableViewCell",bundle: nil), forCellReuseIdentifier: "RetireTableViewCell")
        RetireTableView.registerNib(UINib(nibName: "RetireRecordTableViewCell",bundle: nil), forCellReuseIdentifier: "RetireRecordTableViewCell")
        self.view.addSubview(RetireTableView)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //MARK: ------TableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.section == 0 {
            return 78*px
        }else{
           return 344*px
        }
        
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
//        
//        NSLOG(indexPath)
//    }
    
    
    //MARK: ------TableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if indexPath.section == 0 {
            let dic = NSDictionary()
            let cell = tableView.dequeueReusableCellWithIdentifier("RetireTableViewCell", forIndexPath: indexPath)as!RetireTableViewCell
            cell.setValueWithInfo(dic)
            cell.appointmentButton.tag = indexPath.row
            cell.appointmentButton.addTarget(self, action: #selector(self.appointmentButtonAction(_:)), forControlEvents: .TouchUpInside)
            cell.accessoryType = .None
            cell.selectionStyle = .None
             return cell
        }else{
            let dic = NSDictionary()
            let cell = tableView.dequeueReusableCellWithIdentifier("RetireRecordTableViewCell", forIndexPath: indexPath)as!RetireRecordTableViewCell
            cell.setValueWithInfo(dic)
            cell.accessoryType = .None
            cell.selectionStyle = .None
             return cell
        }
        
        
       
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let mysectionView = UILabel()
        mysectionView.backgroundColor = LGBackColor
        mysectionView.frame = CGRectMake(0, 0, Screen_W, 30)
        if section == 0 {
            mysectionView.text = "  远程认证"
        }else{
            mysectionView.text = "  退休远程认证"
        }
        mysectionView.textColor = UIColor.grayColor()
        mysectionView.font = UIFont.systemFontOfSize(13)
        return mysectionView
        
    }
    
    func appointmentButtonAction(sender:UIButton){
        GXAlertView.showOneButtonWithTitleWithMidButton("温馨提示", message: "十分钟内系统将以短信形式通知您认证事件", buttonTitle: "知道了", middleButtonTitle: "", imageButton: UIImage(named: "shipin_chenggongzi"), click: {
            
            }) { 
//                sender.setTitle("开始认证", forState: .Normal)
//                sender.setTitleColor(UIColor.greenColor(), forState: .Normal)
//                sender.layer.masksToBounds = true
//                sender.layer.borderColor = UIColor.greenColor().CGColor
//                sender.addTarget(self, action: #selector(<#T##@objc method#>), forControlEvents: .TouchUpInside)
        }
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
