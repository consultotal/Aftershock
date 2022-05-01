function [x,y,z]=SatelliteDish(prcss)

[x, y, z] = cylinder (9:-.25:0, 50);
z=ones(size(x))*72
figure(1)
surf (x, y, z);
title ("Shocksat");

figure(4)
surf (x, y, z);
title ("Satellite dish");