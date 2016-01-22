In the first implementation, the buffer array is modified not only within the
method but outside the method as well. 

In the second implementation, the buffer variable is scoped only inside the 
method so the input array is not modified. 