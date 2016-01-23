d_outer has the same object id as a outer since they are both the same integer:
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 8975980 before the block.
c_outer is [42] with an id of: 8975960 before the block.
d_outer is 42 with an id of: 85 before the block.

Object ids do not change when inside a block:
a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 8975980 before the block and is: 8975980 inside the block.
c_outer id was 8975960 before the block and is: 8975960 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.

When the variables are reassigned to new values their object ids change:
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 8975980 before and: 8974900 after.
c_outer inside after reassignment is [44] with an id of: 8975960 before and: 8974860 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

Object ids are reused when assigned to a new variable:
a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 8974900 inside the block (compared to 8974900 for outer).
c_inner is [44] with an id of: 8974860 inside the block (compared to 8974860 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).

After exiting the block the variables keep the object ids that were assigned inside the block:
a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 8975980 BEFORE and: 8974900 AFTER the block.
c_outer is [44] with an id of: 8975960 BEFORE and: 8974860 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.

You can't access the variables that were assigned only inside of the block outside of the block:
 => "ugh ohhhhh" 
