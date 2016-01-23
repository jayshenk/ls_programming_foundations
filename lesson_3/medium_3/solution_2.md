Same as the previous exercise:
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 5718760 before the block.
c_outer is [42] with an id of: 5718740 before the block.
d_outer is 42 with an id of: 85 before the block.

For objects that are used as arguments to a method, the object id does not change when entering the method:
a_outer id was 85 before the method and is: 85 inside the method.
b_outer id was 5718760 before the method and is: 5718760 inside the method.
c_outer id was 5718740 before the method and is: 5718740 inside the method.
d_outer id was 85 before the method and is: 85 inside the method.

When the variable is reassigned inside the method, the object id changes:
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 5718760 before and: 5693300 after.
c_outer inside after reassignment is [44] with an id of: 5718740 before and: 5693280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

Object ids are reused when assigned to a new variable:
a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
b_inner is thirty three with an id of: 5693300 inside the method (compared to 5693300 for outer).
c_inner is [44] with an id of: 5693280 inside the method (compared to 5693280 for outer).
d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).

Any reassignments that were made inside of the method are no longer in effect after exiting
the method. The object ids are the same as they were before the method call. Only VALUES are used
as parameters in a method:
a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
b_outer is forty two with an id of: 5718760 BEFORE and: 5718760 AFTER the method call.
c_outer is [42] with an id of: 5718740 BEFORE and: 5718740 AFTER the method call.
d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.

Variables that were assigned only in the method cannot be accessed outside of the method:
 => "ugh ohhhhh" 
