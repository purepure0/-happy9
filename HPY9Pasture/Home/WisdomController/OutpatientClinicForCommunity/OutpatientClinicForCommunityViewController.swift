//
//  OutpatientClinicForCommunityViewController.swift
//  HPY9Pasture
//
//  Created by purepure on 17/2/8.
//  Copyright © 2017年 xiaocool. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class OutpatientClinicForCommunityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let mainTableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "门诊服务"
        creatUI()
//        self.mainTableview.mj_header.beginRefreshing()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.hidden = false
    }

    
    func creatUI(){
        mainTableview.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        mainTableview.delegate = self
        mainTableview.dataSource = self
        mainTableview.backgroundColor = UIColor.whiteColor()
        mainTableview.separatorStyle = .None
        self.mainTableview.registerNib(UINib(nibName: "ALLOutpatientClinicTableViewCell",bundle: nil), forCellReuseIdentifier: "ALLOutpatientClinicTableViewCell")
        self.view.addSubview(self.mainTableview)
        //        mainTableview.mj_header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
        //            NSLOG("MJ:(下拉刷新)")
        //            self.getData( "0")
        //
        //        })
        //        mainTableview.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { () -> Void in
        //            NSLOG("MJ:(上拉加载)")
        //            self.getData( "1")
        //            
        //        })
    }
    
    //MARK: ------UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 145*px
        
        //        return self.textArray.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let vc =  OutpatientClinicDetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: ------TableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 3
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("ALLOutpatientClinicTableViewCell", forIndexPath: indexPath)as!ALLOutpatientClinicTableViewCell
        cell.selectionStyle = .None
        cell.setUI()
        cell.name.text = "11111111111111111"
        cell.personName.text = "负责人："+"12121212"
        cell.descriptionLabel.text = "1212545454435456464624545645454554314456456454545454545"
        cell.adress.text = "地址："+"545454531434545456465"
        return cell
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
