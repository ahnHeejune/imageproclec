imfinfo('cameraman.tif')    % Query the cameraman image that 
                            % is available with matlab. 
                            % imfinfo provides information

                            %ColorType is gray-scale, width is 256 ... etc.
                    
I1=imread('cameraman.tif'); %Read in the TIF format cameraman image

imwrite(I1,'cameraman.jpg','jpg');    % Write the resulting array I1 to 
                                      % disk as a JPEG image
                                      
imfinfo('cameraman.jpg')    % Query the resulting disk image
                            % Note changes in storage size etc.                            
