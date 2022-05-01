function [X1,Y1,Z1,X21,X31,X41,Y21,Y31,Y41,Z211,Z212,Z213,Z214]=tpbx(prcss)
%close all
%clear all
%clc
%prcss=.25;% Model accuracy(inches) = 1/4
bxlgth=36;%  Box length
%Function to plot the Bottom box surface
[X1,Z1]=meshgrid(-bxlgth/2:prcss:bxlgth/2);
Y1=ones(size(X1))*bxlgth/4;

btmmbxh=-47;% box height
Z1=Z1+btmmbxh%+bxlgth/2;
X1=X1+bxlgth/4;
X1_2=X1-bxlgth/4;

Z1=Z1;
Y1(:,size(Y1,2)/2:size(Y1,2))=NA;
Z1(:,size(Y1,2)/2:size(Z1,2))=NA;
%Y1(8,8)=NA;
%Y1(8,9)=NA;

% Drilled points

prfrt=0.266/2;%perforation radius
pntrds=7.5-prfrt;% point radius
[diftrcrclrds,indcrclrds]=min(abs((X1(1,:))-(pntrds)))%index radius

%Y1(9,32)=NA;
%Y1(9,20)=NA;
%Y1(9,8)=NA;


vtrprf=[0 0 -1 1];%drilled points center x
vprfhght=[0.75 2.50 6.875 6.875];% perforation center y

[difcrclctr,indcrclctr]=min(abs((X1(1,:))-(7.5)))% circle center
crclrds=indcrclctr-indcrclrds








Y2=ones(size(X1))*-bxlgth/4;
for iax=1:length(vtrprf)
  [difcrclctrx,indcrclctrx]=min(abs((X1(1,:))-(vtrprf(iax))))% circle center
  
  prfhght=Z1(1,1)+vprfhght(iax);% first value in Z1 plus the value in the vector vprfhght(iax) for the perf height
  [difprfhght,indprfhght]=min(abs((Z1(:,1))-(prfhght)))%index radius
  
  Y1(indprfhght,indcrclctrx)=NA;
  Y2(indprfhght,indcrclctrx)=NA;

end



Z1=-Z1;




%% Shocksat flange
vtrprfflng=[7.5 5 2.5 0 -2.5 -5 -7.5]
[X21,Y21]=meshgrid(-bxlgth/4:prcss:bxlgth/4);

X31=X21-2;
[diftr,inditf]=min(abs((X31(1,:))-(-bxlgth/4)));


if X31(1,inditf)<-bxlgth/4
X31(:,inditf:length(X31(:,1)))=NA;
X31(:,inditf)=-bxlgth/4; 
else
X31(:,inditf-1:length(X31(:,1)))=NA;
X31(:,inditf-1)=-bxlgth/4;  
end



X41=X21+2;
[diftr2,inditf2]=min(abs((X41(1,:))-(bxlgth/4)));
if X41(1,inditf2)<bxlgth/4
X41(:,1:inditf2)=NA;
X41(:,inditf2)=bxlgth/4;
else
X41(:,1:inditf2)=NA;
X41(:,inditf2)=bxlgth/4;
end
Y31=Y21-2;

if Y31(1,inditf)<-bxlgth/4
Y31(inditf:length(Y31(1,:)),:)=NA;
Y31(inditf,:)=-bxlgth/4; 
else
Y31(inditf-1:length(Y3(1,:)),:)=NA;
Y31(:,inditf-1)=-bxlgth/4;  
end


%Y3(6:36,:)=NA;
%Y3(5,:)=-9;

Y41=Y21+2;
if X41(1,inditf2)<bxlgth/4
Y41(1:inditf2,:)=NA;
Y41(inditf2,:)=bxlgth/4;
else
Y41(1:inditf2,:)=NA;
Y41(inditf2,:)=bxlgth/4;
end
%Y4(1:32,:)=NA;
%Y4(32,:)=9;

Z21=ones(size(X21))*-28.625;
[difcrclctrxy,indcrclctrxy]=min(abs((X41(1,:))-(11-(1.5-1.125))))% circle center drilled points
[difcrclctrxyn,indcrclctrxyn]=min(abs((X31(1,:))-(-11+(1.5-1.125))))% circle center drilled points

for iax=1:length(vtrprfflng)
  [difcrclctrx,indcrclctrx]=min(abs((X1(1,:))-(vtrprfflng(iax))))% circle center
  Y31(indcrclctrxyn+1,indcrclctrx)=NA;
  
  Y41(indcrclctrxy,indcrclctrx)=NA;
  X41(indcrclctrx,indcrclctrxy)=NA;
X31(indcrclctrx,indcrclctrxyn+1)=NA;
end


Z211=Z21;
Z211(1,:)=NA;
Z211(2,:)=NA;
%Z211(3,:)=NA;

Z212=Z21;
Z212(length(Z212),:)=NA;
%Z212(length(Z212)-1,:)=NA;

Z213=Z21;
Z213(:,1)=NA;
%Z213(:,2)=NA;
Z214=Z21;
Z214(:,length(Z214))=NA;
Z211=-Z211
Z212=-Z212
Z213=-Z213
Z214=-Z214



figure(1)
surfc(X1,Y1,Z1);% surface 1 - bottom box
title('Top box 6061 Al 31.16')
hold on
surfc(X1,Y2,Z1);% surface 2 - bottom box
surfc(Y1,X1,Z1);% surface 3 - bottom box
surfc(Y2,X1,Z1);% surface 4 - bottom box
surfc(X31,Y21,Z212);
surfc(X41,Y21,Z211)
surfc(X21,Y31,Z214)
surfc(X21,Y41,Z213)
xlim([-(1.5*bxlgth/2)-3 (1.5*bxlgth/2)+3])
ylim([-(1.5*bxlgth/2)-3 (1.5*bxlgth/2)+3])
zlim([0 (2*bxlgth)+3])

figure(3)
surfc(X1,Y1,Z1);% surface 1 - bottom box
title('Top box 6061 Al 31.16')
hold on
surfc(X1,Y2,Z1);% surface 2 - bottom box
surfc(Y1,X1,Z1);% surface 3 - bottom box
surfc(Y2,X1,Z1);% surface 4 - bottom box
surfc(X31,Y21,Z212);
surfc(X41,Y21,Z211)
surfc(X21,Y31,Z214)
surfc(X21,Y41,Z213)
xlim([-(1.5*bxlgth/2)-3 (1.5*bxlgth/2)+3])
ylim([-(1.5*bxlgth/2)-3 (1.5*bxlgth/2)+3])
zlim([25 (2*bxlgth)+3])

  
  