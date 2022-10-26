%% 环形六子径
% three_aperture 三孔径阵列 每个孔径间隔 2/3 pi
% Rcirc 孔径半径
%x,y    位置坐标
function [PU] = six_aperture(Rcirc, x , y)

% 相邻孔径的相位差
delta = pi/3;
rho = sqrt(x*x+y*y);
theta = atan2(y,x);
% 三个孔径
pu0 = aperture(Rcirc, rho, theta);
pu1 = aperture(Rcirc, rho, theta + delta);
pu2 = aperture(Rcirc, rho, theta + 2 * delta);
pu3 = aperture(Rcirc, rho, theta + 3 * delta);
pu4 = aperture(Rcirc, rho, theta + 4 * delta);
pu5 = aperture(Rcirc, rho, theta + 5 * delta);

% 逻辑或 孔径阵列复合
pu = pu0 | pu1 | pu2 | pu3 | pu4 | pu5;

% 设置返回值
PU = double(pu);
end

