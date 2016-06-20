//
//  ViewController.swift
//  obento
//
//  Created by masa on 2016/06/13.
//  Copyright © 2016年 yoursoft.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var logonBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    var id:String = ""
    var pass:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
//        let url:NSURL = NSURL(string: "http://tryworks-design.ciao.jp/webtest.html")!
        let url: NSURL = NSURL(string: "http://www.lunch-online.com/app/logon")!
        let request:NSURLRequest = NSURLRequest(URL:url)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        //ID呼び出し
        if let id_val = userDefaults.stringForKey("id") {
            id = id_val
        }
        //PASS呼び出し
        if let pass_val = userDefaults.stringForKey("pass") {
            pass = pass_val
        }
        webview.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLoginBtn(sender: AnyObject) {
        
        if id == "" || pass == "" {
            if let viewController = storyboard?.instantiateViewControllerWithIdentifier("settingViewController")
                as? SettingViewController {
                self.presentViewController(viewController, animated: true, completion: nil);
            }
        }
        
        var reqText:String = "document.getElementById('chumonshacd').value='"+id+"';"
        reqText = reqText+"document.getElementById('password').value='"+pass+"';"
        reqText = reqText+"var form = document.forms.item(0);form.submit();"
        webview.stringByEvaluatingJavaScriptFromString(reqText)!
        
    }
    
    //ロード時にインジケータを回す
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print("indicator off")
        let url = webView.stringByEvaluatingJavaScriptFromString("document.URL")
        print(url)
       /*
        if(url == "http://tryworks-design.ciao.jp/webtest2.html?" ) {
            lockView.hidden = true
            logonBtn.hidden = true
            settingBtn.hidden = true
        } else if ( url == "http://tryworks-design.ciao.jp/webtest.html?" ) {
            lockView.hidden = false
            logonBtn.hidden = false
            settingBtn.hidden = false
        } else if ( url == "http://tryworks-design.ciao.jp/webtest.html" ) {
            lockView.hidden = false
            logonBtn.hidden = false
            settingBtn.hidden = false
        }
        */
        if(url == "http://www.lunch-online.com/app/logon" ) {
            lockView.hidden = false
            logonBtn.hidden = false
            settingBtn.hidden = false
        } else {
            lockView.hidden = true
            logonBtn.hidden = true
            settingBtn.hidden = true
        }
    }
    

    @IBAction func restart(segue :UIStoryboardSegue) {
        
    }

}

