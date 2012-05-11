#import <Foundation/Foundation.h>
#import "Observee.h"

@interface MySuperClass : NSObject
@property (nonatomic, retain) Observee *observee;

- (id)initWithObservee:(Observee *)observee;

@end



