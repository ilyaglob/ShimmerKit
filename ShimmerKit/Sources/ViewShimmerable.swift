//
//  ViewShimmerable.swift
//  ShemmerKit
//
//  Created by Илья Разумов on 19.03.2022.
//

import UIKit

public protocol ViewShimmerable: AnyObject {
	
	var shimerableViews: [UIView] { get }
	
	var superView: UIView { get }
	
	var color: UIColor { get }
	
	func updateShimmer(isEnabled: Bool)
	
	func prepareForShimmer()
}
