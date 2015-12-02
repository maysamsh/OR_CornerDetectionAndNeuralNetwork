function [ptMat,ptHSV]=test(img)
clc;
    img2=rgb2gray(img);
    img2=medfilt2(img2,[2 2]);
    pt  = kp_harris(img2);
    ptMat=pt;
  
   %draw(img,pt,'Gilles');
   %Uncomment above line to see the keypoints
    img_hsv=rgb2hsv(img);
    ptHSV=img_hsv;

end

function draw(img,pt,str)
    figure('Name',str);
    imshow(img);
    hold on;
    axis off;
    switch size(pt,2)
        case 2
            s = 2;
            for i=1:size(pt,1)
                rectangle('Position',[pt(i,2)-s,pt(i,1)-s,2*s,2*s],'Curvature',[0 0],'EdgeColor','b','LineWidth',2);
            end
        case 3
            for i=1:size(pt,1)
                rectangle('Position',[pt(i,2)-pt(i,3),pt(i,1)-pt(i,3),2*pt(i,3),2*pt(i,3)],'Curvature',[1,1],'EdgeColor','w','LineWidth',2);
            end
    end
end
