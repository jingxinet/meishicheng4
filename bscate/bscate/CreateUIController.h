//
//  CreateUIController.h
//  bscate
//
//  Created by 叶新 on 16/1/25.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateUIController : NSObject
/** 快速创建按键*/
+(UIButton *)CreateUIButtonWithTittle:(NSString *)buttonName
                   andWithTittleColor:(UIColor *)tittleColor
             andWithSelectTittleColor:(UIColor *)selectTittleColor
                          andWithFram:(CGRect)buttonFram
                       andWithTargete:(id)buttonTargete
                   andWithButtonClick:(SEL)ButtonClick
                    andWithButtontage:(NSInteger)buttonTage
          andWithButtonBackgroudColor:(UIColor *)backgroudColor
                   andWithButtonImage:(UIImage *)buttonImage
                   andWithSelectImage:(UIImage *)selectImage
                   andWithButtonBgImage:(UIImage *)buttonbgImage
                   andWithSelectBgImage:(UIImage *)selectbgImage;
/** 创建标签 */
+ (UILabel *)CreatelabelWithFram:(CGRect)fram
           andWithLabelBackgroud:(UIColor *)labelBackColor
                    andLabelText:(NSString *)labelText
                    andTextColor:(UIColor *)textColor
                         andfont:(UIFont *)textfont
                andNumberOflines:(NSInteger)numberofLines
                  andshadowColor:(UIColor *)shadowColor
                 andshadowOffset:(CGSize)shadowOffset
                andtextAlignment:(NSTextAlignment)textAlignment
         andHighlightedTextColor:(UIColor *)highlightedTextColor
                  andHighlighted:(BOOL)highlighted;
/** 创建输入框*/
+ (UITextField *)CreateTextFieldWithFram:(CGRect)fram
                                 andtext:(NSString *)text
                        andTextAlignment:(NSTextAlignment)textAlignment
                             andDelegate:(id)delegate
                                andBackgroudImage:(UIImage *)backgroudImage
                   andDisabledBackground:(UIImage *)disabledBackground
                              andEditing:(BOOL)editing
                             andleftView:(UIView *)leftView
                            andRightView:(UIView *)rightView
                              andKeyType:(UIReturnKeyType)returnKeyType
                   andAutocorrectionType:(UITextAutocorrectionType)autocorrectionType
                      andSecureTextEntry:(BOOL)secureTextEntry
                          andBorderStyle:(UITextBorderStyle)borderStyle
                          andPlaceholder:(NSString *)placeholder
                       andBackgroudColor:(UIColor *)backgroudcolor
                  andUITextFieldViewMode:(UITextFieldViewMode)clearButtonMode;

/**创建图片视图 */
+ (UIImageView *)CreateUIImageViewWithFram:(CGRect)fram andBackgroudColor:(UIColor *)backgroudColor andImage:(NSString *)imageName andUserInteractionEnabled:(BOOL)userInteractionEnabled andTag:(NSInteger)tag;

/** 创建表格视图*/
//+ (UITableView *)CreateTableViewWithFram:(CGRect)tableViewfram
//                       andTableRowheight:(NSInteger)height;

+ (UITableView *)CreateTableViewWithFram:(CGRect)tableViewfram
                       andTableRowheight:(CGFloat)rowheight andWithSectionHeaderHeight:(CGFloat)sectionHeaderHeight
                  andSectionFooterHeight:(CGFloat)sectionFooterHeight
                             andDelegate:(id)delegate
                           andDataSource:(id)dataSource
                                andStyle:(UITableViewStyle)tableViewStyle;
+ (UITableViewCell *)CreateTableVIewCell:(UIImage *)imageView WithTextLabel:(NSString *)textLabel;

/** 创建滚视图 */
//test
//+ (UIScrollView *)CreateScrollViewWithFram:(CGRect)scrollViewFram andWithContentSize:(CGSize)contentSize;
//

+(UIScrollView *)CreateScrollViewWithFram:(CGRect)fram
                      andWithContenOfSize:(CGSize)contenSize
                         andContentOffset:(CGPoint)contentOffset
                       andbackgroundColor:(UIColor *)backgroundColor
                          andWithDelegate:(id)scrollViewDelegate
                         andPagingEnabled:(BOOL)pagingEnabled
                               andBounces:(BOOL)bounces
                        andShowHorizontal:(BOOL)horizontal
                          andShowVertical:(BOOL)vertical;

+ (UISegmentedControl *)CreateSegmentWithFram:(CGRect)fram
                                WithTintColor:(UIColor *)segmentColor
                                      WithTag:(NSInteger)tag
                       WithSelectSegmentIndex:(NSInteger)selectIndex
                                    WithItems:(NSArray *)items
                                   WithTarget:(id)target
                                   WithAction:(SEL)selectClick
                           WithUIControlEvent:(UIControlEvents)controlEvents
                           WithBackgroudColor:(UIColor *)backgroudColor;
@end
