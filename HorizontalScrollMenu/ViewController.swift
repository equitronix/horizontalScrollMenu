//
//  ViewController.swift
//  HorizontalScrollMenu
//
//  Created by Admin on 04/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //the adornment for selected button. Initialized as a zero size view; will be later converted to an underline of the selected button.
    var selectedButtonBar: UIView? = nil; // = UIView.init(frame: CGRect(x: 0.0,y: 0.0, width: 0.0, height: 0.0));
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    private lazy var  firstvc: FirstViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "firstvc") as! FirstViewController;
        //        self.addChild(vc);
        return vc;
    }();
    private lazy var  secondvc: SecondViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "secondvc") as! SecondViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  thirdvc: ThirdViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "thirdvc") as! ThirdViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  fourthvc: FourthViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "fourthvc") as! FourthViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  fifthvc: FifthViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "fifthvc") as! FifthViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  sixthvc: SixthViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "sixthvc") as! SixthViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  seventhvc: SeventhViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "seventhvc") as! SeventhViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    private lazy var  eighthvc: EighthViewController = {
        var vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "eighthvc") as! EighthViewController;
        //        self.add(asChildViewController: vc);
        return vc;
    }();
    
    @objc func clicked(_ sender: UIButton) {
        var fromvc: UIViewController? = nil;
        var tovc: UIViewController? = nil;
        var currenttag: Int? = nil;
        var newtag: Int? = nil;
        
        newtag = sender.tag;
        tovc = getController(forIndex: newtag!)!;
        
        if selectedButtonBar != nil {
            currenttag = selectedButtonBar!.superview?.tag;
            if currenttag == newtag {
                return; // the user clicked the same button.
            }
            selectedButtonBar!.removeFromSuperview();
            selectedButtonBar!.frame = CGRect(x: 0.0,y: sender.frame.size.height - 3, width: sender.frame.size.width, height: 3.0)
            sender.addSubview(selectedButtonBar!)
        }
        
        if currenttag != nil {
            fromvc = getController(forIndex: currenttag!)!;
        }
        
        if tovc != nil {
            if fromvc != nil {
                addChild(tovc!);
                if currenttag! < newtag! {
                    tovc!.view.center.x = -tovc!.view.bounds.width/2;
                }else{
                    tovc!.view.center.x = tovc!.view.bounds.width * 1.5;
                }
                transition(from: fromvc!, to: tovc!, duration: 0.25, options: .curveLinear, animations: {
                    tovc!.view.center.x = tovc!.view.bounds.width/2;
                    
                },  completion: {finished in
                    print(finished); //just to show that you can perform some actions if animation completed successfully.
                });
            }else{
                add(asChildViewController: tovc!)
            }
        }
        //        add(asChildViewController: getController(forIndex: newtag));
    }
    
    
    //                remove(asChildViewController: getController(forIndex: currenttag!));
    
    ///
    private func add(asChildViewController viewController: UIViewController?){
        if viewController != nil {
            addChild(viewController!);
            containerView.addSubview(viewController!.view);
            viewController!.view.frame = containerView.bounds;
            viewController!.view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
            viewController!.didMove(toParent: self);
        }
    }
    
    private func remove(asChildViewController viewController: UIViewController?){
        if viewController != nil {
            viewController!.willMove(toParent: nil);
            viewController!.view.removeFromSuperview();
            viewController!.removeFromParent();
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIButton.appearance().backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        if buttons.count > 0 {
            let b: UIButton = buttons[0]; //make the first button selected by default.
            selectedButtonBar = UIView.init(frame: CGRect(x: 0.0,y: b.frame.size.height - 3, width: b.frame.size.width, height: 3.0));
            selectedButtonBar?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            b.addSubview(selectedButtonBar!);
            add(asChildViewController: firstvc);
            //            remove(asChildViewController: secondvc)
            //            remove(asChildViewController: thirdvc)
            //            remove(asChildViewController: fourthvc)
            //            remove(asChildViewController: fifthvc)
            //            remove(asChildViewController: sixthvc)
            //            remove(asChildViewController: seventhvc)
            //            remove(asChildViewController: eighthvc)
            for b in buttons {
                b.addTarget(self, action: #selector(clicked(_:)), for: UIControl.Event.touchUpInside)
            }
        }
    }
    
    private func getController(forIndex index: Int) -> UIViewController? {
        var retval: UIViewController?;
        switch index{
        case 0:
            retval = firstvc;
        case 1:
            retval = secondvc;
        case 2:
            retval = thirdvc;
        case 3:
            retval = fourthvc;
        case 4:
            retval = fifthvc;
        case 5:
            retval = sixthvc;
        case 6:
            retval = seventhvc;
        case 7:
            retval = eighthvc;
        default:
            retval = nil;
        }
        
        return retval;
    }
    
    
    
}
