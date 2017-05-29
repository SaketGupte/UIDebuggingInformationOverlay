//
//  UIViewController+Debugging.swift
//  1mg
//
//  Created by Saket Gupte on 29/05/17.
//  Copyright © 2017 1mg Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

protocol UIDebuggingInformationOverlay {
  func toggleDebugOverlay()
}

extension UIViewController: UIDebuggingInformationOverlay {
  
  func toggleDebugOverlay() {
    
    #if DEBUG
      let debugInformationOverylayClass = DebugInformationOverylayClass.sharedInstance
      
      let debugOverlay = debugInformationOverylayClass.debugWindow?.perform(NSSelectorFromString("overlay")).takeUnretainedValue() as? UIWindow
      _ = debugOverlay?.perform(NSSelectorFromString("toggleVisibility"))
    #endif
    
  }
  
}

class DebugInformationOverylayClass {
  
  let debugWindow = NSClassFromString("UIDebuggingInformationOverlay") as? UIWindow.Type
  
  static let sharedInstance = DebugInformationOverylayClass()
  
  private init() {
    _ = debugWindow?.perform(NSSelectorFromString("prepareDebuggingOverlay"))
  }
  
}
