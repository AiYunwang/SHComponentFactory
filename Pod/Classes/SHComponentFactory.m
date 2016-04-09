//
//  WDComponentFactory.m
//  IOS-WeidaiCreditLoan
//
//  Created by yaoqi on 16/3/30.
//  Copyright © 2016年 . All rights reserved.
//

#import "SHComponentFactory.h"

@interface CommentObject : NSObject

@property (nonatomic, copy) NSString *componentname;

@property (nonatomic, copy) NSString *componentclass;

@end

@implementation CommentObject

@end

@interface SHComponentFactory () <NSXMLParserDelegate>

@property (nonatomic, retain) NSMutableDictionary *dic;

@end

@implementation SHComponentFactory

+ (instancetype)shareManager {
    static SHComponentFactory *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SHComponentFactory alloc] init];
    });
    return manager;
}

+ (void)regesiterXml:(NSString *)xmlname {

    NSString *path = [[NSBundle mainBundle] pathForResource:xmlname ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSXMLParser *par = [[NSXMLParser alloc] initWithData:data];
    par.delegate = [SHComponentFactory shareManager];
    [par parse];
}

+ (id<SHViewControllerProtocol>)loadpage:(NSString *)pageName withParam:(NSDictionary *)param {
    NSDictionary *dic = [SHComponentFactory shareManager].dic;
    CommentObject *object = dic[pageName];
    NSString *comentclass = object.componentclass;
    SEL selector = @selector(cratePage:);
    id cls = NSClassFromString(comentclass);
    if (![cls respondsToSelector:selector]) {
        NSAssert(NO, @"%@没有实现协议", cls);
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id<SHViewControllerProtocol> page = [cls performSelector:selector withObject:param];
    return page;
#pragma clang diagnostic pop
}

#pragma mark - NSXMLParserDelegate

//step 1 :准备解析
- (void)parserDidStartDocument:(NSXMLParser *)parser {
}

//step 2：准备解析节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    if ([@"componentreg" isEqualToString:elementName]) {
        self.dic = [[NSMutableDictionary alloc] init];
    } else if ([@"component" isEqualToString:elementName]) {
        CommentObject *object = [[CommentObject alloc] init];
        object.componentname = attributeDict[@"name"];
        object.componentclass = attributeDict[@"class"];
        self.dic[object.componentname] = object;
    }
}

//step 3:获取首尾节点间内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
}

//step 4 ：解析完当前节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
}

//step 5；解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
}

@end
