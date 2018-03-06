global x
x = 1
y = 2
disp(' non-global variable access');
setNonGlobal(5, 10)
x
y

disp(' global variable access');
setGlobal(5, 10)
x
y
