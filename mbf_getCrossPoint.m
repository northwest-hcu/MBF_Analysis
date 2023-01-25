% (x1, y1)と(x2, y2)の中点と(x3, y3)と(x4, y4)の中点
function point = mbf_getCrossPoint(x1, y1, x2, y2, x3, y3, x4, y4)
    % figure(fig);
    % hold on;
    mid1.x = (x1 + x2) / 2;
    mid1.y = (y1 + y2) / 2;
    mid2.x = (x3 + x4) / 2;
    mid2.y = (y3 + y4) / 2;
    % (y - mid.y) = ((y2 - y1) / (x2 - x1)) * (x - mid.x)
    % y = ((y2 - y1) / (x2 - x1)) * x - ((y2 - y1) / (x2 - x1)) * mid.x + mid.y
    d1 = ((y2 - y1) / (x2 - x1));
    a1 = -1 * ((y2 - y1) / (x2 - x1)) * mid1.x + mid1.y;
    d2 = ((y4 - y3) / (x4 - x3));
    a2 = -1 * ((y4 - y3) / (x4 - x3)) * mid2.x + mid2.y;
    % plot([-1 1], [d1 * (-1) + a1 d1 * (1) + a1], 'r');
    % plot([-1 1], [d2 * (-1) + a2 d2 * (1) + a2], 'b');
    % 直角に交わる直線
    % 傾きの計算(負の逆数)
    dx1 = -1 * (1 / d1);
    dx2 = -1 * (1 / d2);
    % (y - mid.y) = dx1 * (x - mid.x)
    % y = dx1 * x - dx1 * mid.x + mid.y
    ax1 = (-1) * dx1 * mid1.x + mid1.y;
    ax2 = (-1) * dx2 * mid2.x + mid2.y;
    % plot([-1 1], [dx1 * (-1) + ax1 dx1 * (1) + ax1], 'r');
    % plot([-1 1], [dx2 * (-1) + ax2 dx2 * (1) + ax2], 'b');
    % y = dx1 * x + ax1
    % y = dx2 * x + ax2
    % (dx1 - dx2) * x = ax2 - ax1
    point.x = (ax2 - ax1) / (dx1 - dx2);
    point.y = dx1 * point.x + ax1;
    point.x = mid1.x;
end