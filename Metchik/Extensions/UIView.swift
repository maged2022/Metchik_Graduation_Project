//
//  UIView.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit

extension UIView {
    /**
       Centers the view within its superview with optional size and position adjustments.
       
       - Parameters:
          - size: The size of the view (default is CGSize.zero).
          - xConstant: The constant value to adjust the view's centerX constraint (default is 0).
          - yConstant: The constant value to adjust the view's centerY constraint (default is 0).
       
       - Returns: An `AnchoredConstraints` instance that stores all the created constraints.
       */
    @discardableResult
    public func centerInSuperview(size: CGSize = .zero,
                                  xConstant: CGFloat = 0,
                                  yConstant: CGFloat = 0) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let superview = superview {
            anchoredConstraints.centerX = centerXAnchor.constraint(
                equalTo: superview.centerXAnchor,
                constant: xConstant
            )
            anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superview.centerYAnchor,
                                                                   constant: yConstant)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        [anchoredConstraints.centerX, anchoredConstraints.centerY,
         anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        return anchoredConstraints
    }
    /**
     Centers the view horizontally within its superview with an optional constant adjustment.
     
     - Parameters:
        - constant: The constant value to adjust the view's centerX constraint.
     
     - Returns: The `NSLayoutConstraint` instance representing the centerX constraint, if created; otherwise, `nil`.
     */
    @discardableResult
    public func centerXInSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant)
            constraint.isActive = true
            return constraint
        }
        return nil
    }

    /**
        Centers the view vertically within its superview with an optional constant adjustment.
        
        - Parameters:
           - constant: The constant value to adjust the view's centerY constraint.
        
        - Returns: The `NSLayoutConstraint` instance representing the centerY constraint, if created; otherwise, `nil`.
        */
    @discardableResult
    public func centerYInSuperview(constant: CGFloat = 0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
         if let superview = superview {
             let constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant)
             constraint.isActive = true
             return constraint
         }
        return nil
    }
}

extension UIView {
    /**
      Fills the view within its superview with optional padding on all sides.
      
      - Parameters:
         - padding: The padding to apply on all sides of the view (default is UIEdgeInsets.zero).
    */
    public func fillSuperview(padding: UIEdgeInsets = .zero) {
        self.fillYSuperView(paddingTop: padding.top, paddingBottom: padding.bottom)
        self.fillXSuperView(paddingLeft: padding.left, paddingRight: padding.right)
    }
    /**
       Fills the view horizontally within its superview with optional padding on the leading and trailing sides.
       
       - Parameters:
          - paddingLeft: The padding value to apply on the leading side of the view (default is 0).
          - paddingRight: The padding value to apply on the trailing side of the view (default is 0).
    */
    public func fillXSuperView(paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: paddingLeft).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -paddingRight).isActive = true
        }
    }
    /**
       Fills the view vertically within its superview with optional padding on the top and bottom sides.
       
       - Parameters:
          - paddingTop: The padding value to apply on the top side of the view (default is 0).
          - paddingBottom: The padding value to apply on the bottom side of the view (default is 0).
    */
    public func fillYSuperView(paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: paddingTop).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -paddingBottom).isActive = true
        }
    }
}
public struct AnchoredConstraints {
    public var top: NSLayoutConstraint?
    public var leading: NSLayoutConstraint?
    public var bottom: NSLayoutConstraint?
    public var trailing: NSLayoutConstraint?
    public var centerX: NSLayoutConstraint?
    public var centerY: NSLayoutConstraint?
    public var width: NSLayoutConstraint?
    public var height: NSLayoutConstraint?
}
extension UIView {
    /**
     Creates constraints for the edges and size of the view.
     
     - Parameters:
        - topAnchor: The top anchor to create a constraint for the top edge of the view.
        - bottomAnchor: The bottom anchor to create a constraint for the bottom edge of the view.
        - leadingAnchor: The leading anchor to create a constraint for the leading edge of the view.
        - trailingAnchor: The trailing anchor to create a constraint for the trailing edge of the view.
        - centerXAnchor: The centerX anchor to create a constraint for the centerX of the view.
        - centerYAnchor: The centerY anchor to create a constraint for the centerY of the view.
        - padding: The padding values to apply to the constraints (default is UIEdgeInsets.zero).
        - size: The size to create constraints for the width and height of the view (default is CGSize.zero).
     
     - Returns: An `AnchoredConstraints` instance that stores all the created constraints.
     */
    @discardableResult
    public func makeConstraints(
          topAnchor: NSLayoutYAxisAnchor? = nil,
          bottomAnchor: NSLayoutYAxisAnchor? = nil,
          leadingAnchor: NSLayoutXAxisAnchor? = nil,
          trailingAnchor: NSLayoutXAxisAnchor? = nil,
          centerXAnchor: NSLayoutXAxisAnchor? = nil,
          centerYAnchor: NSLayoutYAxisAnchor? = nil,
          padding: UIEdgeInsets = .zero,
          size: CGSize = .zero ) -> AnchoredConstraints {
            /// Tell the view to disable automatic constraints
            translatesAutoresizingMaskIntoConstraints = false
            var anchoredConstraints = AnchoredConstraints()

            /// If a top anchor is provided, create a constraint for the top edge of the view
            if let topAnchor = topAnchor {
                anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
            }

            /// If a leading anchor is provided, create a constraint for the leading edge of the view
            if let leadingAnchor = leadingAnchor {
                anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                            constant: padding.left)
            }

            /// If a bottom anchor is provided, create a constraint for the bottom edge of the view
            if let bottomAnchor = bottomAnchor {
                anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                          constant: -padding.bottom)
            }
            /// If a trailing anchor is provided, create a constraint for the trailing edge of the view

            if let trailingAnchor = trailingAnchor {
                anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                              constant: -padding.right)
            }
            /// If a centerX anchor is provided, create a constraint for the centerX of the view
            if let centerXAnchor = centerXAnchor {
                anchoredConstraints.centerX = self.centerXAnchor
                    .constraint(equalTo: centerXAnchor,
                                constant: padding.right > 0 ? -padding.right : padding.left)
            }
            /// If a centerY anchor is provided, create a constraint for the centerY of the view
            if let centerYAnchor = centerYAnchor {
                anchoredConstraints.centerY = self.centerYAnchor
                    .constraint(equalTo: centerYAnchor,
                                constant: padding.top > 0 ? padding.top : -padding.bottom)
            }
            /// If a width value is provided, create a constraint for the width of the view
            if size.width != 0 {
              anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
            }

            /// If a height value is provided, create a constraint for the height of the view
            if size.height != 0 {
              anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
            }

            /// Activate all of the constraints
              [anchoredConstraints.top, anchoredConstraints.leading,
               anchoredConstraints.bottom, anchoredConstraints.trailing,
               anchoredConstraints.width, anchoredConstraints.height,
               anchoredConstraints.centerX, anchoredConstraints.centerY].forEach { $0?.isActive = true }

            /// Return the anchoredConstraints instance
            return anchoredConstraints
        }
}

extension UIView {
    /**
        The width of the view.
    */
    public var width: CGFloat {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.layoutFrame.width
        }
        return frame.width
    }
    /**
        The height of the view.
    */
    public var height: CGFloat {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.layoutFrame.height
        }
        return frame.height
    }
    /**
        Creates a width constraint for the view with the specified constant.
        
        - Parameters:
           - constant: The constant value for the width constraint.
        
        - Returns: The created `NSLayoutConstraint` for the width constraint.
    */
    @discardableResult
    public func widthConstraints(_ constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = widthAnchor.constraint(equalToConstant: constant)
        const.isActive = true
        return const
    }
    /**
     Creates a height constraint for the view with the specified constant.
     
     - Parameters:
        - constant: The constant value for the height constraint.
     
     - Returns: The created `NSLayoutConstraint` for the height constraint.
     */
    @discardableResult
    public func heightConstraints(_ constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let const = heightAnchor.constraint(equalToConstant: constant)
        const.isActive = true
        return const
    }
    /**
     Creates equal width and height constraints for the view with the specified constant.
     
     - Parameters:
        - constant: The constant value for both width and height constraints.
     */
    public func equalSizeConstraints(_ constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    /**
     Creates width and height constraints for the view with specified width and height constants.
     
     - Parameters:
        - width: The constant value for the width constraint.
        - height: The constant value for the height constraint.
     */
    public func sizeConstraints(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
