clear;                                   %Clear variables 
A = imread('plate_side.jpg');            %Read image to be registered
figure, imshow(A);                       %Display
[x,y]=ginput(4); input_points=[x y];     %Interactively define coords 
                                         %of input quadrilateral
figure, imshow('plate_reference.jpg')    %Read base reference)image.
[x,y]=ginput(4); base_points=[x y];      %Interactively define coords             
                                         %of base quadrilateral
t_carplate = cp2tform(input_points,base_points,'projective');    
%t_carplate = cp2tform(input_points,base_points,'affine');    
                                         %Create projective  
                                         %transformation structure.
registered = imtransform(A,t_carplate);  %Apply projective transform 
B=imcrop(registered);                    %Interactively crop result
figure, imshow(B)                        %Display corrected image
