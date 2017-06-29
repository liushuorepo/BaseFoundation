#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BaseCollectionViewCell.h"
#import "BaseNavigationController.h"
#import "BaseTableViewCell.h"
#import "BaseView.h"
#import "BaseViewController.h"
#import "SimpleWebViewController.h"
#import "DefaultView.h"
#import "UIImage+reSize.h"
#import "NSString+Additions.h"
#import "NSString+SHA.h"
#import "XYSearchBar.h"
#import "UITextFieldLimit.h"
#import "UITextViewPlaceHolder.h"
#import "GCDTimer.h"

FOUNDATION_EXPORT double BaseFoundationVersionNumber;
FOUNDATION_EXPORT const unsigned char BaseFoundationVersionString[];

