//
//  CreateUIController.m
//  bscate
//
//  Created by 叶新 on 16/1/25.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "CreateUIController.h"

@implementation CreateUIController
#pragma mark - Button
+(UIButton *)CreateUIButtonWithTittle:(NSString *)buttonTittle  andWithTittleColor:(UIColor *)tittleColor andWithSelectTittleColor:(UIColor *)selectTittleColor andWithFram:(CGRect)buttonFram andWithTargete:(id)buttonTargete andWithButtonClick:(SEL)ButtonClick andWithButtontage:(NSInteger)buttonTage andWithButtonBackgroudColor:(UIColor *)backgroudColor andWithButtonImage:(UIImage *)buttonImage andWithSelectImage:(UIImage *)selectImage andWithButtonBgImage:(UIImage *)buttonbgImage andWithSelectBgImage:(UIImage *)selectbgImage{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFram;
//    按键的tittle设置
    [button setTitle:buttonTittle forState:UIControlStateNormal];
    [button setTitleColor:selectTittleColor forState:UIControlStateSelected];
    [button setTintColor:tittleColor];
//    按键的事件
    [button addTarget:buttonTargete action:ButtonClick forControlEvents:UIControlEventTouchUpInside];
    [button setTag:buttonTage];
//    按键的图片设置
    [button setBackgroundImage:buttonbgImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectbgImage forState:UIControlStateSelected];
    
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateSelected];
    
    return button;
    
    
    
}
#pragma mark - Label
+ (UILabel *)CreatelabelWithFram:(CGRect)fram andWithLabelBackgroud:(UIColor *)labelBackColor andLabelText:(NSString *)labelText andTextColor:(UIColor *)textColor andfont:(UIFont *)textfont andNumberOflines:(NSInteger)numberofLines andshadowColor:(UIColor *)shadowColor andshadowOffset:(CGSize)shadowOffset andtextAlignment:(NSTextAlignment)textAlignment andHighlightedTextColor:(UIColor *)highlightedTextColor andHighlighted:(BOOL)highlighted{
    
    UILabel * label = [[UILabel alloc] initWithFrame:fram];
    label.text = labelText;
    label.textColor = textColor;
    label.font = textfont;
    label.numberOfLines = numberofLines;
    label.shadowColor = shadowColor;
    label.shadowOffset = shadowOffset;
    label.highlighted = highlighted;
    //    labelText的对齐方式  NSTextAlignmentLeft  NSTextAlignmentCenter  NSTextAlignmentRight
    label.textAlignment = textAlignment;
    label.highlightedTextColor = highlightedTextColor;
    
    
    return label;
}
/** 创建文本输入框*/
#pragma mark - TextField
+(UITextField *)CreateTextFieldWithFram:(CGRect)fram andtext:(NSString *)text andTextAlignment:(NSTextAlignment)textAlignment andDelegate:(id)delegate andBackgroudImage:(UIImage *)backgroudImage andDisabledBackground:(UIImage *)disabledBackground andEditing:(BOOL)sss andleftView:(UIView *)leftView andRightView:(UIView *)rightView andKeyType:(UIReturnKeyType)returnKeyType andAutocorrectionType:(UITextAutocorrectionType)autocorrectionType andSecureTextEntry:(BOOL)secureTextEntry andBorderStyle:(UITextBorderStyle) borderStyle andPlaceholder:(NSString *)placeholder andBackgroudColor:(UIColor *)backgroudcolor andUITextFieldViewMode:(UITextFieldViewMode)clearButtonMode{
    
    UITextField * textField = [[UITextField alloc] initWithFrame:fram];
    textField.textAlignment = textAlignment;
    textField.delegate = delegate;
    textField.leftView = leftView;
    textField.rightView = rightView;
    textField.returnKeyType = returnKeyType;
    textField.autocorrectionType = autocorrectionType;
    textField.secureTextEntry = secureTextEntry;
    textField.borderStyle = borderStyle;
    textField.placeholder = placeholder;
    textField.textAlignment = textAlignment;
    textField.backgroundColor = backgroudcolor;
    textField.clearButtonMode = clearButtonMode;
    return textField;
}
/** 创建图片视图*/
#pragma  mark UIImageView
+(UIImageView *)CreateUIImageViewWithFram:(CGRect)fram andBackgroudColor:(UIColor *)backgroudColor andImage:(NSString *)imageName andUserInteractionEnabled:(BOOL)userInteractionEnabled andTag:(NSInteger)tag{
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:fram];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.backgroundColor = backgroudColor;
    imageView.userInteractionEnabled = userInteractionEnabled;
    imageView.tag = tag;
    return imageView;
}
/** 创建表格视图*/
#pragma  mark - TableView
//+ (UITableView *)CreateTableViewWithFram:(CGRect)tableViewfram andTableRowheight:(NSInteger)height{
//    
//    UITableView * tableView = [[UITableView alloc] initWithFrame:tableViewfram];
//    tableView.rowHeight = height;
//    
//    return tableView;
//
//}
+ (UITableView *)CreateTableViewWithFram:(CGRect)tableViewfram andTableRowheight:(CGFloat)rowheight andWithSectionHeaderHeight:(CGFloat)sectionHeaderHeight andSectionFooterHeight:(CGFloat)sectionFooterHeight andDelegate:(id)delegate andDataSource:(id)dataSource  andStyle:(UITableViewStyle)tableViewStyle{
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:tableViewfram style:tableViewStyle];
    tableView.rowHeight = rowheight;
    tableView.sectionFooterHeight = sectionFooterHeight;
    tableView.sectionHeaderHeight = sectionHeaderHeight;
    tableView.delegate = delegate;
//    tableView
    tableView.dataSource = dataSource;
   
    return tableView;
}
+ (UITableViewCell *)CreateTableVIewCell:(UIImage *)imageView WithTextLabel:(NSString *)textLabel{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.imageView.image  = imageView;
    cell.textLabel.text  = textLabel;
    return cell;
}
#pragma mark - ScrollView
//+ (UIScrollView *)CreateScrollViewWithFram:(CGRect)scrollViewFram andWithContentSize:(CGSize)contentSize{
//    
//    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFram];
//    scrollView.contentSize = contentSize;
////    偏移
////    scrollView.contentOffset
//    return scrollView;
//    
//}
+(UIScrollView *)CreateScrollViewWithFram:(CGRect)fram andWithContenOfSize:(CGSize)contenSize andContentOffset:(CGPoint)contentOffset andbackgroundColor:(UIColor *)backgroundColor andWithDelegate:(id)scrollViewDelegate andPagingEnabled:(BOOL)pagingEnabled andBounces:(BOOL)bounces andShowHorizontal:(BOOL)horizontal andShowVertical:(BOOL)vertical{
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:fram];
    scrollView.delegate = scrollViewDelegate;
    scrollView.contentSize = contenSize;
    scrollView.contentOffset = contentOffset;
    scrollView.backgroundColor = backgroundColor;
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.bounces = bounces;
    scrollView.showsHorizontalScrollIndicator = horizontal;
    scrollView.showsVerticalScrollIndicator = vertical;
    return scrollView;
    
}
#pragma mark - UISegmentedControl
+ (UISegmentedControl *)CreateSegmentWithFram:(CGRect)fram WithTintColor:(UIColor *)segmentColor WithTag:(NSInteger)tag WithSelectSegmentIndex:(NSInteger)selectIndex WithItems:(NSArray *)items WithTarget:(id)target WithAction:(SEL)selectClick WithUIControlEvent:(UIControlEvents)controlEvents WithBackgroudColor:(UIColor *)backgroudColor{
    
    UISegmentedControl * segment = [[UISegmentedControl alloc] initWithItems:items];
    segment.frame = fram;
    segment.selectedSegmentIndex = selectIndex;
    segment.tintColor = segmentColor;
    segment.tag = tag;
    segment.backgroundColor = backgroudColor;
    [segment addTarget:target action:selectClick forControlEvents:controlEvents];
    
    return segment;
    
}

@end
