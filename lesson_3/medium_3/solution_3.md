"My string looks like this now: pumpkins" will be displayed, because += creates a 
new string object. 

"My array looks like this now: ["pumpkins", "rutabaga"]" will display because
the same array object is used inside and outside the method, and the << adds to
that same object. 
