
#import <Foundation/Foundation.h>

@interface NSString (LQCategory)

/**
 *  字典转Json字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/**
 json转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  计算文本的size
 */
+ (CGSize)calculateStringSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font string:(NSString *)string;

@end
