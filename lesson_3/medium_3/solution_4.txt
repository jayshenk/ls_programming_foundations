My string looks like this now: rutabaga
My array looks like this now: ["pumpkins"]

In this case, the string is modified but the array is not. This is because
.gsub! mutates the caller and modifies the original string object. The 
array reassignment inside the method however, creates a new object
and does not modify the original array object.