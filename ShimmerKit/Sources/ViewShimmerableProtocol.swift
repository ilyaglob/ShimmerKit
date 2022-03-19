//
//  ViewShimmerableProtocol.swift
//  ShemmerKit
//
//  Created by Илья Разумов on 19.03.2022.
//

import UIKit

public protocol ViewShimmerableProtocol: AnyObject {
	
	/// Views которые нужно анимировать
	var shimerableViews: [UIView] { get }
	
	/// View где нужно разместить шиммер
	var viewForShimmer: UIView { get }
	
	var shimmerColor: UIColor { get }
	
	func updateShimmer(isEnabled: Bool)
	func prepareForShimmer()
}

extension ViewShimmerableProtocol {
	
	var shimmerColor: UIColor {
		return UIColor(red: 0.949, green: 0.949, blue: 0.965, alpha: 1)
	}
	
	func updateShimmer(isEnabled: Bool) {
		if isEnabled {
			guard !viewForShimmer.subviews.contains(where: { $0 is ShimmerContainerView }) else {
				return
			}
			prepareForShimmer()
			
			let shimmer = ShimmerContainerView(frame: viewForShimmer.bounds)
			shimerableViews.forEach {
				let view = ShimmerView(relatedView: $0)
				view.frame = $0.frame
				view.clipsToBounds = true
				view.backgroundColor = shimmerColor
				shimmer.addSubview(view)
			}
			viewForShimmer.addSubview(shimmer)
		} else {
			viewForShimmer.subviews.forEach {
				if $0 is ShimmerContainerView {
					$0.removeFromSuperview()
				}
			}
		}
	}
}
