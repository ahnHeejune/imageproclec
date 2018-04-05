I=imread('trui.png');                       			%Read in image


for t = 1:10
    
    S = qtdecomp(I,.17 *(1 + 0.25*t));             % Do quadtree decomposition
   
    blocks = repmat(uint8(0),size(S));            % Create empty blocks
    for dim = [512 256 128 64 32 16 8 4 2 1];     % Loop through successively smaller blocks	
        numblocks = length(find(S==dim));           
        if (numblocks > 0)        
           	values = repmat(uint8(1),[dim dim numblocks]);
            values(2:dim,2:dim,:) = 0;
            blocks = qtsetblk(blocks,S,dim,values);
        end
    end
    blocks(end,1:end) =1;
    blocks(1:end,end) = 1;
    subplot(1,2,1), imshow(I);
    k=find(blocks==1);                          			%Find border pixels of regions
    A=I; A(k)=255;                              			%Superimpose on original image 
    subplot(1,2,2), imshow(A);                              %Display 
    s =sprintf("T = %f", .17 *(1 + 0.25*t));
    title(s);
    pause(5);
end
