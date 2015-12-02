M=[];
   for b=1:400
    impath=fl{b};
    %retrive keypoints and hsv image
    img = imread(impath);
    [imb_y,imb_x, tmp]=size(img);
    [kp_array,hsv_image]=kp(img);
    %determine picture size
    [kp_x,kp_y]=size(kp_array);
    %HSV values of keypoints
    j=1;
    %fill the h_mat matrix
    for i=1:kp_x
        x=kp_array(i,1);
        y=kp_array(i,2);
        h_mat(j,:,:)=hsv_image(x,y,:);
        rgb_mat(j,:,:)=img(x,y,:);
        for il_x=x-1:x+1
             for il_y=y-1:y+1
                 if il_y<=(imb_x-3) && il_y>3 && il_x<=(imb_y-3) && il_x>3
                   j=j+1;
                   h_mat(j,:,:)=hsv_image(il_x,il_y,:);
                   rgb_mat(j,:,:)=img(il_x,il_y,:);
                 end
             end 
        end
        j=j+1;
    end
    %compute HUE,SAT, and VALUE histogram in 100 bins seprately

      [m,y]=ksdensity(h_mat(:,1,:));

      n=[];
      for i=1:2:100
          n=[n m(i)];
      end
      m=n;
      %Filling input matrix
      M=[M m'];
      
end 


