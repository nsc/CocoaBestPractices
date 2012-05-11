#import "MySuperClass.h"

@interface MySubClass : MySuperClass
@property (nonatomic, retain) Observee *subClassObservee;

- (id)initWithObservee:(Observee *)observee;

@end

